# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.60.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.0/dock-cli-darwin-arm64"
      sha256 "32e2d0ff2b6597d1a1222735519ca1ef51091d0609068f43a3d1bd2b7743a668"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.0/dock-cli-darwin-amd64"
      sha256 "97e8d2638b2957a6e62bd5ef351618726fa1fa9fdc112abf16217fb706d37d8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.0/dock-cli-linux-arm64"
      sha256 "12039d9e0390dfb8a1137ec4be9fb19eebb82d1c142efcde3dbf13b0ea831e47"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.60.0/dock-cli-linux-amd64"
      sha256 "ef2c55616dfc78b55bfbd4b821799fc7cd35c4b0900ade48a99b8a580a8914be"
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
