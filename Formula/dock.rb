# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.56.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.56.0/dock-cli-darwin-arm64"
      sha256 "f46cf29e5a134100daa24ad243c0156517ff684946f4da50d1790a56a194742a"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.56.0/dock-cli-darwin-amd64"
      sha256 "0cbf6bd68fde5334cd2d58374fc4c87d3d5f04e2e67084ac98ffbca261ab6a81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.56.0/dock-cli-linux-arm64"
      sha256 "b4d314ea8505e378d396899530457f3abd3a32960218085cf5d9fa1173ffc80f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.56.0/dock-cli-linux-amd64"
      sha256 "bcbd185c02acfe9078f09fed85d7d5a9e1ed6b3f8c6a5a81a1ee58ab4cd9af50"
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
