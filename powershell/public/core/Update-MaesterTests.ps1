﻿
<#
.SYNOPSIS
   Updates the specified folder with the latest ready-made Maester tests built by the Maester team.

.DESCRIPTION
    The Maester team maintains a repository of ready made tests that can be used to verify the configuration of your Microsoft 365 tenant.

    The tests can be viewed at https://github.com/maester365/maester/tree/main/tests

.EXAMPLE
    Update-MaesterTests -Path .\maester-tests

    Installs or updates the latest Maester tests in the specified directory.

.EXAMPLE
    Update-MaesterTests

    Install the latest set of Maester tests in the current directory.

#>

Function Update-MaesterTests {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '', Justification = 'Colors are beautiful')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '', Justification = 'This command updates multiple tests')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Justification = 'TODO: Implement ShouldProcess')]
    [CmdletBinding()]
    param(
        # The path to install the Maester tests to, defaults to the current directory.
        [Parameter(Mandatory = $false)]
        [string] $Path = ".\"
    )
    Get-IsNewMaesterVersionAvailable | Out-Null

    Update-MtMaesterTests -Path $Path
}