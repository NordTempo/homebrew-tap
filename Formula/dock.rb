# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.69.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.69.0/dock-cli-darwin-arm64"
      sha256 "62b39341d1652539167fe8a641cf7560931e0caaa3d430ca51f479db5d788728"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.69.0/dock-cli-darwin-amd64"
      sha256 "2ec842facc322080bc8603ee51b71ae87ccde9b4ddcceaf9ff4b37aced72fdf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.69.0/dock-cli-linux-arm64"
      sha256 "bb6faddebf8d8759c13624451507f31e1fdefaf2b441a57404019a80f584b070"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.69.0/dock-cli-linux-amd64"
      sha256 "4346d09a3f6f10fd43a0bb5673f5e6b4847ad2d5c2ed999c858ce5a25bf88eda"
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
