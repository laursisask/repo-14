
# PHP (php)

Installs PHP into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/php:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | PHP version | string | 8.2 |
| composer | Whether to install Composer | boolean | true |
| install-runit-service | Whether to install a runit service for Mailpit | boolean | true |
| lite-install | Whether to install a minimal set of PHP extensions | boolean | false |
| skip-gmagick | Whether to skip installing the gmagick extension | boolean | false |

## Customizations

### VS Code Extensions

- `mrorz.language-gettext`
- `bmewburn.vscode-intelephense-client`
- `MehediDracula.php-namespace-resolver`
- `wongjn.php-sniffer`
- `getpsalm.psalm-vscode-plugin`



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/php/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
