# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.76.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.76.0/dock-cli-darwin-arm64"
      sha256 "9428a3f412efd75e5ded014bafe2c8e340dea7da690cabbb68fa46ff9446ce96"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.76.0/dock-cli-darwin-amd64"
      sha256 "f9277f8182eb8ffb62cd827e2908b3646470f636f657cbcca8428dd8812a5a5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.76.0/dock-cli-linux-arm64"
      sha256 "1e08462c9bef29bd47944dfe4de86fa2002a9544cf9416135afa995f7402ac50"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.76.0/dock-cli-linux-amd64"
      sha256 "6368c4dbd087471eb736c45115278c4d129150c4c0eecb4f70ae887478a46d08"
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
