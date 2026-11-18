# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.61.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.61.0/dock-cli-darwin-arm64"
      sha256 "5e6274ea725aefec2f265cb9235264b792a833345c3897e41110dab5ca1abb1e"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.61.0/dock-cli-darwin-amd64"
      sha256 "2ee738f82acc6d22637e17e2165035a84277c857bf4c2d67ab6afe375ede4257"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.61.0/dock-cli-linux-arm64"
      sha256 "bcaea866a41d30d3fae91f346784b49b963e117a600a8670fcbc5b893b4ca8e9"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.61.0/dock-cli-linux-amd64"
      sha256 "b894f0e88310755c49531fcc8df008a6d340196c7e87f6117fbd869fdde4905a"
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
