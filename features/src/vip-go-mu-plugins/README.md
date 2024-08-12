
# VIP Go MU Plugins (vip-go-mu-plugins)

Installs VIP Go MU Plugins into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/Automattic/vip-codespaces/vip-go-mu-plugins:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Whether to install VIP Go MU Plugins | boolean | true |
| branch | Which branch to install from | string | staging |
| development_mode | Set to true to install all files necessary for development of VIP MU plugins. | boolean | false |

## Commands

`update-mu-plugins`: a script to update MU plugins to their latest available version.

Usage:

update-mu-plugins [branch] [dev-mode]

* `branch`: which branch of VIP MU plugins to load. Accepts `staging`, `production`, or `develop`. The default values is `staging`.
* `dev-mode`: set to `true` to load all files necessary for the development of VIP MU plugins. The default value is `false`.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/Automattic/vip-codespaces/blob/main/features/src/vip-go-mu-plugins/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
