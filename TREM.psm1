﻿
#!/usr/bin/env pwsh
#region    Classes
class TREM {
  # Core Methods
  static [void] GetInstalledBloatware([bool]$IncludeSystemApps, [string[]]$CustomBloatwareList) {
    Get-InstalledBloatware -IncludeSystemApps $IncludeSystemApps -CustomBloatwareList $CustomBloatwareList
  }

  static [void] RemoveBloatware([string[]]$AppName, [bool]$Force) {
    Remove-Bloatware -AppName $AppName -Force $Force
  }

  static [void] DisableWindowsTelemetry([string]$Level) {
    Disable-WindowsTelemetry -Level $Level
  }

  # Utility Methods
  static [void] BackupSystemState([string]$Description) {
    Backup-SystemState -Description $Description
  }

  static [bool] TestAdminPrivileges() {
    return Test-AdminPrivileges
  }
}
#endregion Classes
# Types that will be available to users when they import the module.
$typestoExport = @(
  [TREM]
)
$TypeAcceleratorsClass = [PsObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')
foreach ($Type in $typestoExport) {
  if ($Type.FullName -in $TypeAcceleratorsClass::Get.Keys) {
    $Message = @(
      "Unable to register type accelerator '$($Type.FullName)'"
      'Accelerator already exists.'
    ) -join ' - '

    [System.Management.Automation.ErrorRecord]::new(
      [System.InvalidOperationException]::new($Message),
      'TypeAcceleratorAlreadyExists',
      [System.Management.Automation.ErrorCategory]::InvalidOperation,
      $Type.FullName
    ) | Write-Warning
  }
}
# Add type accelerators for every exportable type.
foreach ($Type in $typestoExport) {
  $TypeAcceleratorsClass::Add($Type.FullName, $Type)
}
# Remove type accelerators when the module is removed.
$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
  foreach ($Type in $typestoExport) {
    $TypeAcceleratorsClass::Remove($Type.FullName)
  }
}.GetNewClosure();

$scripts = @();
$Public = Get-ChildItem "$PSScriptRoot/Public" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue
$scripts += Get-ChildItem "$PSScriptRoot/Private" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue
$scripts += $Public

foreach ($file in $scripts) {
  Try {
    if ([string]::IsNullOrWhiteSpace($file.fullname)) { continue }
    . "$($file.fullname)"
  } Catch {
    Write-Warning "Failed to import function $($file.BaseName): $_"
    $host.UI.WriteErrorLine($_)
  }
}

$Param = @{
  Function = $Public.BaseName
  Cmdlet   = '*'
  Alias    = '*'
  Verbose  = $false
}
Export-ModuleMember @Param
