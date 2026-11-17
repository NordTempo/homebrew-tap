# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.59.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.1/dock-cli-darwin-arm64"
      sha256 "d1f455f0265f9af9fab04faa5f09e3864be291cd91d558e543d2e14fbdb91470"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.1/dock-cli-darwin-amd64"
      sha256 "4fdc82b253401a21d8d43263d30ce1f64187b2de79f84091254f6df37a782f9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.1/dock-cli-linux-arm64"
      sha256 "79a4594c3b4201e5f8d1f4b34917d268947483a844340f6730b0ac814e4c4de0"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.1/dock-cli-linux-amd64"
      sha256 "ebe110e131e328477b98034b6ec748124e9effdcb04f60fee167d02c431aaf5e"
    end
  end

  def install
    # The release's dock-cli builds are bare files, downloaded without the
    # executable bit.
    cli = Dir["dock-cli-*"].first
    chmod 0755, cli
    bin.install cli => "dock"
    generate_completions_from_executable(bin/"dock", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dock --version")
  end
end
