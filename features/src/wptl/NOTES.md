## Commands

This feature introduces two commands:

* `setup-wptl` to download the specified version of the WordPress Test Library;
* `use-wptl` to activate the specified version of the WordPress Test Library.

Note that `use-wptl` automatically invokes `setup-wptl` if the specified version of the WordPress Test Library is not found.

Both commands accept one argument, WordPress Test Livrary version.

It can be specified as the exact version (`6.0.9`), `latest` (latest stable release), `trunk`, `nightly` (both refer to the latest development version), or the `.x`-form (e.g., `6.6.x`) to download the latest available release in the given series.
