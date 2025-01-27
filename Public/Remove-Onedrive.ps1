function Remove-Onedrive {
  # .SYNOPSIS
  #   Remove Onedrive.
  # .DESCRIPTION
  #   Uninstall OneDrive and remove its traces from the system.
  # .PARAMETER RemoveFiles
  #  (switch): Remove OneDrive user files and folders.
  # .PARAMETER Force
  #  (switch): Force removal without confirmation.
  [CmdletBinding(SupportsShouldProcess = $true)]
  param (
    [switch]$RemoveFiles,
    [switch]$Force
  )

  begin {
  }

  process {
    if ($pscmdlet.ShouldProcess("OneDrive", "Remove")) {
    }

    end {
    }
  }
}