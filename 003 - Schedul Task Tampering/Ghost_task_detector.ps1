$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree"

# Get all subkeys of the specified registry path
$keys = Get-ChildItem -Path $regPath

# Loop through each registry key
foreach ($key in $keys) {
    # Check if the key contains the "SD" value
    $sdValue = Get-ItemProperty -Path $key.PSPath -Name "SD" -ErrorAction SilentlyContinue

    # If "SD" value is not found, print the key and a warning message
    if (-not $sdValue) {
        Write-Output "Key: $($key.Name) - This key is suspicious due to missing 'SD' value."
    }
}
