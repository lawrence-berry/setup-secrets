<p align="center"><img src="public/icon.png" alt="setup-secrets icon" width="128" height="128"></p>

<h1 align="center">setup-secrets</h1>

<p align="center"><b>A machine-local ~/.secrets/secrets.sh for API keys and tokens, sourced from your shell. Only the template is in version control.</b></p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-27%20%C2%B7%20daily%20use-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS 27 · daily use" />
  <img src="https://img.shields.io/badge/Shell-bash%20%C2%B7%20zsh-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Shell bash · zsh" />
  <img src="https://img.shields.io/badge/Shell-POSIX%20sh-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Shell POSIX sh" />
</p>

<p align="center">
  <a href="https://github.com/lawrence-berry/setup-secrets/actions/workflows/macos.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-secrets/macos.yml?branch=main&style=for-the-badge&logo=apple&logoColor=white&label=macOS%2015" alt="macOS 15 CI status" /></a>
  <a href="https://github.com/lawrence-berry/setup-secrets/actions/workflows/linux.yml"><img src="https://img.shields.io/github/actions/workflow/status/lawrence-berry/setup-secrets/linux.yml?branch=main&style=for-the-badge&logo=ubuntu&logoColor=white&label=Ubuntu%2024.04" alt="Ubuntu 24.04 CI status" /></a>
</p>

Bootstraps a `~/.secrets/secrets.sh` for machine-local secrets (API keys, tokens) and sources it from your shell. Only the **template** lives here — your real secrets never enter version control.

## Install

```sh
./install.sh
```

Creates `~/.secrets/secrets.sh` from `secrets.sh.template` on first run (and only then — it never overwrites an existing one), locks it to `600`, and adds a source line to your `~/.zshrc` / `~/.bashrc`. Re-runnable. Then edit `~/.secrets/secrets.sh` and add your exports.

## Scope

The source line goes in `~/.zshrc` / `~/.bashrc`, which only run for **interactive terminal** shells. So your exported secrets are available in terminals and anything you launch from them, but **not** in GUI apps started from the Dock, `launchd`/`cron` jobs, or non-interactive remote commands like `ssh host 'somecmd'`. Those need a different mechanism (e.g. a `launchd` plist's `EnvironmentVariables`).

## Tests

CI lints `install.sh` with ShellCheck, then runs it twice in a scratch `HOME` on Ubuntu and macOS and checks that the source line is added once and `secrets.sh` is mode `600`.

Part of the [`setup-*`](https://lawrence-berry.github.io/setup) family; on a blank machine, `curl -fsSL https://lawrence-berry.github.io/setup | sh` installs them all (setup-mac and setup-iterm on macOS only).
