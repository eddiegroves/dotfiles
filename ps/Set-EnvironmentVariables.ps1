# Sets up env variables
param([switch]$WhatIf = $false)

# TFPT
$env:TFPT_ONLINE_EXCLUDE = '.hg,bin,obj,*.hgignore,*.suo,*.user,*.swp,*.cache,*.dbmdl,*.schemaview'

