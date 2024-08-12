
# SSH (ssh)

Sets up SSH into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/Automattic/vip-codespaces/ssh:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Enable OpenSSH | boolean | true |
| port | Port to expose for SSH | string | 22 |
| new_password | New password for the user | string | skip |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/Automattic/vip-codespaces/blob/main/features/src/ssh/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
