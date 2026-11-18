# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.60.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.2/dock-cli-darwin-arm64"
      sha256 "6eb74afa44f664e000386962df8495ec9c4a7bb610fdbcd900226bc931f8cf58"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.2/dock-cli-darwin-amd64"
      sha256 "ef297882c88e80276d813bf1b50525a840da6e78dd87c2cd71c50aedcf0f4f74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.2/dock-cli-linux-arm64"
      sha256 "d82cd2ded1f60ed13f715f64596b438bbe3e906b2bd645fcf15f8178598c49ab"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.2/dock-cli-linux-amd64"
      sha256 "29aa2174b352c628d1be9aaabf0fc1573ee3646d84f34943e116e8a10bb4323c"
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
