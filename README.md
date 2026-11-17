# NordTempo Homebrew tap

```sh
brew install nordtempo/tap/dock
```

`dock` is the CLI of [Tempo Dock](https://dock.nordtempo.com), a
self-hosted deploy platform for your own servers
([source](https://github.com/NordTempo/tempoDock)). Connect it to your
server with `dock login <url>`; `dock version` says when the two differ.

`Formula/dock.rb` is written by Tempo Dock's release workflow for every
release, with the SHA-256 of each build taken from the release's signed
`SHA256SUMS`. Changes made here by hand are overwritten; open issues and
pull requests on [tempoDock](https://github.com/NordTempo/tempoDock).

This tap is MIT licensed (`LICENSE`); the dock CLI it installs is licensed
under the [AGPL-3.0](https://github.com/NordTempo/tempoDock/blob/main/LICENSE).
