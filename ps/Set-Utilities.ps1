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
