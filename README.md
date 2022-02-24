# Bicep
Modules and snippets

## Modules

### new-password
Generates a alphanumeric password of desired length.

#### Param
```arm
param PasswordLength int = 16
param location string = 'northeurope'
```

#### Output
```json
"outputs": {
      "result": {
        "type": "String",
        "value": "kQp3bL6M6NVBIXCX"
      }
    }
```