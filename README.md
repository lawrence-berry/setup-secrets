# setup-secrets

<img src="public/icon.png" alt="" width="96">

Bootstraps a `~/.secrets/secrets.sh` for machine-local secrets (API keys, tokens) and sources it from your shell. Only the **template** lives here — your real secrets never enter version control.

## Install

```sh
./install.sh
```

Creates `~/.secrets/secrets.sh` from `secrets.sh.template` on first run (and only then — it never overwrites an existing one), locks it to `600`, and adds a source line to your `~/.zshrc` / `~/.bashrc`. Re-runnable. Then edit `~/.secrets/secrets.sh` and add your exports.

## Scope

The source line goes in `~/.zshrc` / `~/.bashrc`, which only run for **interactive terminal** shells. So your exported secrets are available in terminals and anything you launch from them, but **not** in GUI apps started from the Dock, `launchd`/`cron` jobs, or non-interactive remote commands like `ssh host 'somecmd'`. Those need a different mechanism (e.g. a `launchd` plist's `EnvironmentVariables`).
