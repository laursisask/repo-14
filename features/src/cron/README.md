
# Cron (cron)

Enables cron in the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/cron:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Enable cron | boolean | true |
| run_wp_cron | Run wp-cron.php from cron | boolean | false |
| wp_cron_schedule | Interval for wp-cron.php | string | */15 * * * * |
| install-runit-service | Whether to install a runit service for cron | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/cron/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
