function New-Pipe ($Name = 'Commands')
{
  $npipeServer = new-object System.IO.Pipes.NamedPipeServerStream( $Name, [System.IO.Pipes.PipeDirection]::InOut)
  try {
      'Command Executor started'
      'Waiting for client connection'
      $npipeServer.WaitForConnection()
      'Connection established'
   
      $pipeReader = new-object System.IO.StreamReader($npipeServer)
      $pipeWriter = new-object System.IO.StreamWriter($npipeServer)
      $pipeWriter.AutoFlush = $true

      $command = $pipeReader.ReadLine()
      Write-Host $command
      $sb = $executioncontext.invokecommand.NewScriptBlock($command)
      $output = $sb.InvokeReturnAsIs() | convertto-json 
      $output.split("`n") | foreach  {$pipeWriter.WriteLine($_)}
      $pipeWriter.WriteLine('DONE')
            
  }
  catch [exception]
  {
    'blerg'
    $_.exception.message
    $_ | fl * -force
  }
  finally
  {
    $pipeReader.Dispose()
    $npipeServer.Dispose()
  }
}