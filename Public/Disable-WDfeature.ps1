function Disable-WDfeature {
  # .SYNOPSIS
  #   Disable Windows Defender features (use with caution).
  # .DESCRIPTION
  #   Disable Windows Defender features (use with caution).
  # .PARAMETER Feature
  #   (string): Specific Windows Defender feature to disable.
  # .PARAMETER All
  #   (switch): Disable all Windows Defender features.
  [CmdletBinding(supportsShouldProcess = $true)][Alias('Disable-WDfeature')]
  param (
    [Parameter(Mandatory = $false)]
    [validateset('RealTimeProtection', 'CloudProtection')]
    [string]$Feature,

    [switch]$All
  )

  begin {
  }

  process {
    if ($pscmdlet.ShouldProcess($Feature, "Disable")) {
    }
  }

  end {
  }
}