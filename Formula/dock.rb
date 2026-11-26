# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.71.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.71.0/dock-cli-darwin-arm64"
      sha256 "a65964073aefff8523955c78a9c1db3ce8891bf905d84d416793a8c83fb3adc9"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.71.0/dock-cli-darwin-amd64"
      sha256 "23669a8ba5aeff711dda822b50acb9fada950d06cab41b863f7d85931a97d45b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.71.0/dock-cli-linux-arm64"
      sha256 "eefcb69e26742aeaf5340ced3af8988cc06291fcf01bf142d2ba21fd28d7ef4e"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.71.0/dock-cli-linux-amd64"
      sha256 "d909003e33bce8043c54561260e72504bb69ab0d668990c6ddc31cd4c473987c"
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
