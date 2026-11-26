# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.74.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.74.0/dock-cli-darwin-arm64"
      sha256 "9a3030931e731e9fba91b8c77aeb038a7ee6c265a23735c12a1ced46fd3cfb6c"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.74.0/dock-cli-darwin-amd64"
      sha256 "b5e284f5bc59766783d5ba0e981bc445b0a04d052579ed7fdabca5c1095475a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.74.0/dock-cli-linux-arm64"
      sha256 "ff9f0ccc47e4514e3c9b0e6eac264cf3b99ec4b01e5bde6ed7288918d3342e96"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.74.0/dock-cli-linux-amd64"
      sha256 "55791e30f1b66385a766a1dd3ee33b15fa9d45bf81b7ab86762e721be8154f4e"
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
