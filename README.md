# homebrew-peekaboo

Homebrew tap for [Peekaboo](https://getpeekaboo.app) — every file on your Mac, finally findable.

## Install

```bash
brew install --cask vishvavariya/peekaboo/peekaboo
```

Or as two steps:

```bash
brew tap vishvavariya/peekaboo
brew install --cask peekaboo
```

## Update

Peekaboo updates itself through Sparkle, so a Homebrew install keeps itself current. To force it:

```bash
brew upgrade --cask peekaboo
```

## Uninstall

```bash
brew uninstall --cask peekaboo
```

To also remove its preferences, caches and index:

```bash
brew uninstall --cask --zap peekaboo
```

## Links

- Website: <https://getpeekaboo.app>
- Download: <https://getpeekaboo.app/Peekaboo.dmg>
- Releases: <https://github.com/vishvavariya/peekaboo-releases/releases>

## Maintenance

The cask lives at [`Casks/peekaboo.rb`](Casks/peekaboo.rb). `release_local.sh` in the app repo bumps `version` and `sha256` on every release; the hourly [auto-bump workflow](.github/workflows/auto-bump.yml) catches a release whose bump was skipped. The hash is of the release's `Peekaboo-X.Y.Z.zip`:

```bash
shasum -a 256 Peekaboo-X.Y.Z.zip
```

Sparkle `livecheck` keeps `brew livecheck peekaboo` honest against <https://getpeekaboo.app/appcast.xml>.
