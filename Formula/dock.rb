# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.62.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.62.0/dock-cli-darwin-arm64"
      sha256 "ba386b35b1786b7433b70d4e758a9076c72e734ea213ad3370358c15118eee7e"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.62.0/dock-cli-darwin-amd64"
      sha256 "1fcf9f5884b29f999efc3a3dec1223bdd6385bb7795b6580a3efe7788345ef2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.62.0/dock-cli-linux-arm64"
      sha256 "325306c6545daae36265f26692b1d727fc36c2d7c891f730a337b259d675b6d8"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.62.0/dock-cli-linux-amd64"
      sha256 "d951d857257aa34bd5bc57e1c1f216542a306db943162261ce0a568ee0cc26eb"
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
