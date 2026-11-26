# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.72.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.72.0/dock-cli-darwin-arm64"
      sha256 "2e48529b76444b95f45b1e9e111eacb3085b3997f5dde28bd4e518cd85a5275f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.72.0/dock-cli-darwin-amd64"
      sha256 "b0c13875fbb45b4089d451ed81859d345f73f0c21ecebdc936116fbd31d4d4ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.72.0/dock-cli-linux-arm64"
      sha256 "27c3204430b0fd429f089ee9af15aee6ac4977002bb072c87faa57bcd041af1f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.72.0/dock-cli-linux-amd64"
      sha256 "56a8f4591d007224a8ec7203616c7fb35f5e6a2506f11c8afb38a4ac93ea6e8c"
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
