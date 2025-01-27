function Remove-DefaultApps {
  # .SYNOPSIS
  #  Removes default Windows apps (e.g., Xbox, Photos, Mail).
  # .DESCRIPTION
  #  Removes default Windows apps (e.g., Xbox, Photos, Mail).
  # .PARAMETER AppName
  #  (string[]): Specific default apps to remove.
  # .PARAMETER RemoveAll
  #  (Switch): Remove all non-essential default apps.
  [CmdletBinding(SupportsShouldProcess = $true)]
  param (
    [Parameter(Mandatory = $false)]
    [alias("Names")]
    [string[]]$AppName,

    [Parameter(Mandatory = $false)]
    [switch]$RemoveAll
  )

  begin {
  }

  process {
    if ($pscmdlet.ShouldProcess($AppName, "Remove Default Apps")) {
    }
  }

  end {
  }
}