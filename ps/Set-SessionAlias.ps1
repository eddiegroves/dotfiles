# Fix for plain 'vim' not working
Set-Alias vim vim.exe

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

Set-Alias Start-IISExpress IISExpress

