
# Desktop Lite (desktop-lite)

A lightweight desktop environment for development.

## Example Usage

```json
"features": {
    "ghcr.io/Automattic/vip-codespaces/desktop-lite:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Enable the Desktop Lite feature. | boolean | true |
| vnc_geometry | The geometry of the VNC server. | string | 1280x800 |
| vnc_password | The password for the VNC server. The password must be at least six characters long, and  only the first eight characters are significant. | string | vscode |
| install-runit-service | Whether to install a runit service for the Desktop Lite feature. | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/Automattic/vip-codespaces/blob/main/features/src/desktop-lite/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
