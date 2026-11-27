# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.75.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.75.0/dock-cli-darwin-arm64"
      sha256 "bbfc217be2b814c9a553e5eb61fc8c4ca3195f631306dc304fc4bb0ebc058697"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.75.0/dock-cli-darwin-amd64"
      sha256 "19c1d8c5bf13fc876255d5509d52d375ba6f786f745548eb9e7ce0d10cb84689"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.75.0/dock-cli-linux-arm64"
      sha256 "1b927c3310232073b7a5dd0efac86e3236ed6adf484f57bb9b51a4747f234d3f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.75.0/dock-cli-linux-amd64"
      sha256 "9ec79116d6e0a52d5b6c3e5db5d3b8d6ede9b0c2933062f2b4d778805c7192dc"
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
