# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.60.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.1/dock-cli-darwin-arm64"
      sha256 "4e9fa938e32b415c0ab2974c02405b9846bdd730bfe6c2f02d5a0ee899523a3b"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.1/dock-cli-darwin-amd64"
      sha256 "5c6dbe0ecd28bb6e9904065c7afc026bd38faa46ef810695d681446f6a513cee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.1/dock-cli-linux-arm64"
      sha256 "550a9cb98cfd6d054c25080018fc2fb2702e30232d7a83a364284ce63e7b128d"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.1/dock-cli-linux-amd64"
      sha256 "64512b245ca8cf3bbeef1b2a63b1b473d5411563a2140f48a4e511853c29cbc0"
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
