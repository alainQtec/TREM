function Disable-StartupApps {
  # .SYNOPSIS
  #   Disable unnecessary startup applications.
  # .DESCRIPTION
  #   Disable unnecessary startup applications.
  # .PARAMETER AppName
  #   (string[]): Specific apps to disable.
  # .PARAMETER DisableAll
  #   (bool): Disable all non-essential startup apps.
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false)]
    [string[]]$AppName,

    [Parameter(Mandatory = $false)]
    [switch]$DisableAll
  )

  begin {
  }

  process {
  }

  end {
  }
}