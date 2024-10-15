
# WordPress Test Library (wptl)

Installs the WordPress Test Library for unit testing WordPress plugins

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/wptl:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Whether to enable the WordPress Test Library | boolean | true |
| version | The version of the WordPress Test Library to install | string | - |

## Commands

This feature introduces two commands:

* `setup-wptl` to download the specified version of the WordPress Test Library;
* `use-wptl` to activate the specified version of the WordPress Test Library.

Note that `use-wptl` automatically invokes `setup-wptl` if the specified version of the WordPress Test Library is not found.

Both commands accept one argument, WordPress Test Livrary version.

It can be specified as the exact version (`6.0.9`), `latest` (latest stable release), `trunk`, `nightly` (both refer to the latest development version), or the `.x`-form (e.g., `6.6.x`) to download the latest available release in the given series.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/wptl/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
