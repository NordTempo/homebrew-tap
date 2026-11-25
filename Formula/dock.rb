# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.65.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.65.0/dock-cli-darwin-arm64"
      sha256 "78600c3b67a5ad3bdc2f680a34462b5a23c5955744ab675407d06f36fb18eac2"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.65.0/dock-cli-darwin-amd64"
      sha256 "6bfebb4f9dd15f0c41c753434f7af9f4e2a8f1085aa11461c5e601ab0d8fef0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.65.0/dock-cli-linux-arm64"
      sha256 "09862bd3df8b7ee9aa376d07cbefaa52e507cbd6f7f3c45838f78c736a96f579"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.65.0/dock-cli-linux-amd64"
      sha256 "4950f6ee285608092ba5d239af4adee7adf4ba2c0a43b1c18145c80dae3a708f"
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
