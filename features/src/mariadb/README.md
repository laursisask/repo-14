
# MariaDB (mariadb)

Sets up MariaDB into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/mariadb:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| installDatabaseToWorkspaces | Set MariaDB data directory to /workspaces/mysql-data to persist data between container rebuilds (GHCS) | boolean | false |
| extra-options | Extra options to pass to the MariaDB server | string | - |
| install-runit-service | Whether to install a runit service for Mailpit | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/mariadb/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
