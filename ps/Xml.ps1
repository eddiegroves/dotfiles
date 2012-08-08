function Test-Xml {
param(
    $InputObject = $null,
    $Namespace = $null,
    $SchemaFile = $null
)

BEGIN {
    $failCount = 0
    $failureMessages = ""
    $fileName = ""
}

PROCESS {
    if ($InputObject -and $_) {
        throw 'ParameterBinderStrings\AmbiguousParameterSet'
        break
    } elseif ($InputObject) {
        $InputObject
    } elseif ($_) {
        $fileName = $_.FullName
        $readerSettings = New-Object -TypeName System.Xml.XmlReaderSettings
        $readerSettings.ValidationType = [System.Xml.ValidationType]::Schema
        $readerSettings.ValidationFlags = [System.Xml.Schema.XmlSchemaValidationFlags]::ProcessInlineSchema -bor
            [System.Xml.Schema.XmlSchemaValidationFlags]::ProcessSchemaLocation -bor 
            [System.Xml.Schema.XmlSchemaValidationFlags]::ReportValidationWarnings
        $readerSettings.Schemas.Add($Namespace, $SchemaFile) | Out-Null
        $readerSettings.add_ValidationEventHandler(
        {
            $failureMessages = $failureMessages + [System.Environment]::NewLine + $fileName + " - " + $_.Message
            $failCount = $failCount + 1
        });
        $reader = [System.Xml.XmlReader]::Create($_, $readerSettings)
        while ($reader.Read()) { }
        $reader.Close()
    } else {
        throw 'ParameterBinderStrings\InputObjectNotBound'
    }
}

END {
    $failureMessages
    "$failCount validation errors were found"
}
}

