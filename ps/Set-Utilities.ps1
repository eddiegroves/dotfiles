# Join mulitple file paths together by passing in an array
# Example: Join_Paths 'C:\', 'bin', 'test.exe'
function Join-Paths([array]$paths) {
    if ($paths.Length -eq 1) {
        return $paths[0]
    }

    if ($paths.Length -eq 2) {
        return Join-Path $paths[0] $paths[1]
    } 

    Join-Paths (@(Join-Path $paths[0] $paths[1]) + $paths[2..($paths.Length-1)])
}

# Returns true if the path is a symlink
function Test-ReparsePoint([string]$path) {
    return (Get-ReparsePoint $path).Target.Length -gt 0
}

# IIS Express
function IISExpress
{
    param($Path, $WindowStyle = 'Hidden', $Port = 8080)
    Start-Process -FilePath 'C:\Program Files (x86)\IIS Express\iisexpress.exe' -ArgumentList "/path:$Path /port:$Port" -WindowStyle $WindowStyle
}

function Get-SQLConnectionString
{
    $server = Read-Host "Enter Server"
    $database = Read-Host "Enter Database"
    $connectionString = "Data Source=$server;Initial Catalog=$database"

    Write-Host $connectionString
    Set-Clipboard -Text $connectionString
}

