# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.66.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.1/dock-cli-darwin-arm64"
      sha256 "436735ba129dfd73dc5380a6fdc2d40816bfd738d8ebb73d9377afec1feb6b33"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.1/dock-cli-darwin-amd64"
      sha256 "2303da529423ffe35d998a941b77d31af0f989cef31bafd6426b14562739854c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.1/dock-cli-linux-arm64"
      sha256 "73a27c35273102544ce42253873c7e2fd30643258a3129a22d7113ece5a53f26"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.1/dock-cli-linux-amd64"
      sha256 "3bc4669933fc7ffd6dcc8753c1560a335492de43cd40555ccc6a0bf4ef574af9"
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
