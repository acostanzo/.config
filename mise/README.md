# Mise toolchain baseline

This directory is the version-controlled global baseline for user-space
programming languages and developer CLIs on the Batcomputer.

- Homebrew owns the `mise` executable that bootstraps the system.
- `config.toml` pins exact global defaults. Do not commit `latest`, `lts`, or
  partial language versions.
- Repository `mise.toml` files override these defaults when a project needs a
  different compatible runtime.
- Application dependencies remain in their ecosystem manifests and lockfiles.
- Apple-owned `/usr/bin` tools remain available only for OS workflows that
  explicitly require them.

Upgrade one tool family at a time, run `mise install`, validate affected
repositories and services, and keep the prior installation until rollback
confidence is established.
