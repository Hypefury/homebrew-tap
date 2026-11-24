# homebrew-tap

Homebrew tap for Hypefury tools. For now it has [blackroija](https://github.com/Hypefury/blackroija).

```bash
brew install hypefury/tap/blackroija
```

It builds from source, so it needs the Xcode command line tools (`xcode-select --install`). To start it now and at every login:

```bash
brew services start hypefury/tap/blackroija
```

The formula follows the newest `v*` tag of the app's repo; a workflow here updates it right after a tag is pushed, and every hour as a backup.
