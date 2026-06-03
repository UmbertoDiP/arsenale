$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $root)
$contractsDir = Join-Path $root "contracts"
$stateDir = Join-Path $root "state"

function Read-JsonFile([string] $path) {
  $raw = Get-Content -Raw -LiteralPath $path
  return $raw | ConvertFrom-Json
}

function Fail([string] $message) {
  Write-Host $message
  exit 1
}

function Assert([bool] $ok, [string] $message) {
  if (-not $ok) { Fail $message }
}

Assert (Test-Path -LiteralPath $contractsDir) ("Missing contracts dir: " + $contractsDir)
Assert (Test-Path -LiteralPath $stateDir) ("Missing state dir: " + $stateDir)

$promptContractSchemaPath = Join-Path $contractsDir "prompt-contract.schema.json"
Assert (Test-Path -LiteralPath $promptContractSchemaPath) ("Missing schema: " + $promptContractSchemaPath)
Read-JsonFile $promptContractSchemaPath | Out-Null

$stateSchemaPath = Join-Path $stateDir "state.schema.json"
$stateExamplePath = Join-Path $stateDir "state.example.json"
Assert (Test-Path -LiteralPath $stateSchemaPath) ("Missing state schema: " + $stateSchemaPath)
Assert (Test-Path -LiteralPath $stateExamplePath) ("Missing state example: " + $stateExamplePath)
$stateSchema = Read-JsonFile $stateSchemaPath
$stateExample = Read-JsonFile $stateExamplePath
Assert ($null -ne $stateExample.stateVersion) "state.example.json missing stateVersion"
Assert ($null -ne $stateExample.project) "state.example.json missing project"
Assert ($null -ne $stateExample.workflow) "state.example.json missing workflow"

$contractFiles = Get-ChildItem -LiteralPath $contractsDir -Filter "*.contract.json" -File
Assert ($contractFiles.Count -gt 0) "No *.contract.json found"

foreach ($f in $contractFiles) {
  $c = Read-JsonFile $f.FullName
  Assert ($null -ne $c.id) ("Missing id in: " + $f.FullName)
  Assert ($null -ne $c.version) ("Missing version in: " + $f.FullName)
  Assert ($null -ne $c.name) ("Missing name in: " + $f.FullName)
  Assert ($null -ne $c.role) ("Missing role in: " + $f.FullName)
  Assert ($null -ne $c.sourcePromptPath) ("Missing sourcePromptPath in: " + $f.FullName)
  Assert ($null -ne $c.inputs) ("Missing inputs in: " + $f.FullName)
  Assert ($null -ne $c.outputs) ("Missing outputs in: " + $f.FullName)
  Assert ($null -ne $c.runtime) ("Missing runtime in: " + $f.FullName)
  Assert ($null -ne $c.promptTemplate) ("Missing promptTemplate in: " + $f.FullName)
  Assert ($null -ne $c.outputs.schemaPath) ("Missing outputs.schemaPath in: " + $f.FullName)

  $sourcePromptAbs = Join-Path $repoRoot $c.sourcePromptPath
  Assert (Test-Path -LiteralPath $sourcePromptAbs) ("Missing sourcePromptPath target: " + $sourcePromptAbs)

  $schemaAbs = Join-Path $repoRoot $c.outputs.schemaPath
  Assert (Test-Path -LiteralPath $schemaAbs) ("Missing outputs.schemaPath target: " + $schemaAbs)
  Read-JsonFile $schemaAbs | Out-Null
}

Write-Host "OK: pipeline prompt/contracts/state parse + references resolved"
exit 0
