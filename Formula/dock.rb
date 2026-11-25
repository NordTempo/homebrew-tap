# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.68.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.68.0/dock-cli-darwin-arm64"
      sha256 "8196bd80455c46a8c8377e2e8bb320621c74be03566c2648ef574ae8d858d7f7"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.68.0/dock-cli-darwin-amd64"
      sha256 "adc373ac64c01d2785f6d6e9111ff4fe97656b1344b3f5b841a237482aa874c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.68.0/dock-cli-linux-arm64"
      sha256 "b268eb906a05c5ee733d2c4ae628a7de9d6a3893776d9874c6aae4dd703ba31f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.68.0/dock-cli-linux-amd64"
      sha256 "6e0ef61e395aac38e207c9c087cc7e0e8fd67e2676f39647a3de4333c49ca54d"
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
