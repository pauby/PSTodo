﻿function Get-TWStats
{
    <#
    .SYNOPSIS
        Imports todos from the todo file.
    .DESCRIPTION
        Imports the todos from the todo file and then adds a line number to the todo object.
    .OUTPUTS
        System.ArrayList
    .EXAMPLE
        Export-TWTodo c:\todo.txt

        Read and outputs the todos from c:\todo.txt
    .NOTES
        Author:  Paul Broadwith (https://pauby.com)
        Project: PSTodoWarrior (https://github.com/pauby/pstodowarrior)
        History: 1.0 - 16/07/18 - Initial
    .LINK
        https://www.github.com/pauby/pstodowarrior/tree/master/docs/import-twtodo.md
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    Param ()

    Write-Verbose "Gathering stats on the todos."

    $stats = @{
        Completed = @($script:TWTodo | Where { [string]::IsNullOrEmpty($_.DoneDate) -eq $false}).count
    }

    [PSCustomObject]$stats
#    New-Object -TypeName PSObject -Property $stats
}