# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.59.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.2/dock-cli-darwin-arm64"
      sha256 "2417b2be7526aa7ca4a6e2f0e789dcde98bd03f881921ef05fca03732aa5edfb"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.2/dock-cli-darwin-amd64"
      sha256 "7ce5ea27f6fafdb974f7eeff552a4677928e6a17682f4599a81f5ea83ab2def7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.2/dock-cli-linux-arm64"
      sha256 "2880dcc7f5369d73b4406aa5bffa481e8e8ddda7c0f16c0d9c7aa6ad1ae4bcb7"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.2/dock-cli-linux-amd64"
      sha256 "68340aba53ef48cc9fac41a8d92a7cd7470a96bc7b1ea5ba0b7aa0dd751ac05a"
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
