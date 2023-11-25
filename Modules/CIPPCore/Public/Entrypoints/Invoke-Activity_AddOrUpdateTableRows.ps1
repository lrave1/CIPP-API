    using namespace System.Net

    Function Invoke-Activity_AddOrUpdateTableRows {
    <#
    .FUNCTIONALITY
    Entrypoint
    #>
    [CmdletBinding()]
    param($Request, $TriggerMetadata)

          try {
    #Sending each item indivually, if it fails, log an error.
    Add-CIPPAzDataTableEntity @Table -Entity $param -Force
  }
  catch {
    Write-LogMessage -API 'Activity_AddOrUpdateTableRows' -message "Unable to write to '$($TableParams.TableName)' Using RowKey $($param.RowKey) table: $($_.Exception.Message)" -sev error
  }
}

    }