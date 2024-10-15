
# Playwright (playwright)

Sets up Playwright into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/playwright:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Enable Playwright | boolean | true |
| version | Playwright version to install | string | latest |

This feature is available only for Debian-based containers.

Alpine-based containers are **not** supported because the browsers used by Playwright are built against `libc`, not `musl`.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/playwright/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
