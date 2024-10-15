
# memcached (memcached)

Sets up memcached into the Dev Environment

## Example Usage

```json
"features": {
    "ghcr.io/laursisask/repo-14/memcached:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| enabled | Enable memcached | boolean | true |
| install-runit-service | Whether to install a runit service for Mailpit | boolean | true |
| memory_size | Memory size for memcached in MB | string | 64 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/laursisask/repo-14/blob/main/features/src/memcached/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
