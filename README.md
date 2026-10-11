# setup-secrets

Bootstraps a `~/.secrets/secrets.sh` for machine-local secrets (API keys, tokens) and sources it from your shell. Only the **template** lives here — your real secrets never enter version control.

## Install

```sh
./install.sh
```

Creates `~/.secrets/secrets.sh` from `secrets.sh.template` on first run (and only then — it never overwrites an existing one), locks it to `600`, and adds a source line to your `~/.zshrc` / `~/.bashrc`. Re-runnable. Then edit `~/.secrets/secrets.sh` and add your exports.
