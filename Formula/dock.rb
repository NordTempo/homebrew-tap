# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.58.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.58.0/dock-cli-darwin-arm64"
      sha256 "ea08e1341f925e65f35fdd12fcdabcbc0f762dc84981ad75f9f181551e7ae15d"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.58.0/dock-cli-darwin-amd64"
      sha256 "586dfec791ba2af363ac24276475ff79565e0fdf8df3d1cf9f859609f4e9c79c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.58.0/dock-cli-linux-arm64"
      sha256 "dd376080f7293e78620267e7c8bcd0d05b783db02e7a0ac54721abbfa4fbb2d7"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.58.0/dock-cli-linux-amd64"
      sha256 "2a15d1c375f72c05e9566dd51595ab1919380412b950d93a3d31c842da126fc8"
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
