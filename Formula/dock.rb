# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.59.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.3/dock-cli-darwin-arm64"
      sha256 "7c9ab53b728213e60b859fa28cb2f5cc53b63723209747eacfb5ccb1ab748de1"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.3/dock-cli-darwin-amd64"
      sha256 "2ff5cefbaa0dfe3cc21feddc64a0124d14e4cccf8bd4e7994532b6a03bdf003b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.3/dock-cli-linux-arm64"
      sha256 "b8330c82e6d38cccdcacd8e24f3db7941bf5a625627116b947e7ccee72ea3fbc"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.3/dock-cli-linux-amd64"
      sha256 "cedd39ac45528b73e30d3fc1972736654d5ca0248376aad47cabac3dcebf8897"
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
