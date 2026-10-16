# vcamaral/tap

Homebrew casks for my macOS apps.

```sh
brew install --cask vcamaral/tap/utter        # local voice dictation
brew install --cask vcamaral/tap/notchhider   # hides the notch
```

| Cask | App |
|---|---|
| `utter` | [Utter](https://github.com/vcamaral/utter) — local voice dictation with Whisper |
| `notchhider` | [NotchHider](https://github.com/vcamaral/NotchHider) — hides the notch with a black band on the wallpaper |

The apps aren't notarized yet, so the casks remove the quarantine flag after installing; macOS won't ask you to
**Open Anyway**.

Each app's `scripts/release.sh` publishes a GitHub release and updates its cask here.
