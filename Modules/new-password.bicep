
@minValue(1)
@maxValue(40)
@description('Password length')
param PasswordLength int = 16
param location string = 'northeurope'
resource Password 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
    name: 'PWSH-GeneratePassword'
    location: location
    kind: 'AzurePowerShell'
    properties: {
      azPowerShellVersion: '7.2'
      scriptContent: '''
      param (
            [Parameter(Mandatory=$false,HelpMessage='Password length')]
            [int]$PasswordLength=12
        )
        $Symbols = @(33, 35, 36, 37, 38, 40, 41, 47 | ForEach-Object { [char][byte]$PSItem })
        $Chars = @(97..107+109..122+65..78+80..90+48..57 | ForEach-Object {[char][byte]$PSItem }) * 4
        $Password = -join (Get-Random($Chars+$Symbols) -Count $PasswordLength)
        $DeploymentScriptOutputs =  @{
            Text = $Password
        }
      '''
      arguments: '-PasswordLength ${PasswordLength}'
      timeout: 'PT1H'
      retentionInterval: 'PT1H'
    }
  }
  output result string = Password.properties.outputs.text
