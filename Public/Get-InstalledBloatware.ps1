function Get-InstalledBloatware {
  # .SYNOPSIS
  #  Enumerate all installed apps (both system and user-installed) and identify bloatware based on a predefined list or regex patterns.
  # .PARAMETER IncludeSystemApps
  #     (switch): Include system apps in the scan.
  # .PARAMETER FilterByPublisher
  #     (string[]): Filter apps by publisher (e.g., "Microsoft", "Apple").
  # .PARAMETER CustomBloatwareList
  #     (string[]): Provide a custom list of app names or patterns to identify bloatware.
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false)]
    [string[]]$FilterByPublisher,

    [Parameter(Mandatory = $false)]
    [string[]]$CustomBloatwareList,

    [Parameter(Mandatory = $false)]
    [switch]$IncludeSystemApps
  )

  begin {
  }
  process {
  }

  end {
  }
}