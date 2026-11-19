# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.63.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.63.0/dock-cli-darwin-arm64"
      sha256 "36d9cc3ab1e77573815ca43a050acc6cc72ef1b69840f21d09fb44bc18494fd7"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.63.0/dock-cli-darwin-amd64"
      sha256 "c24c333be49c401b2e9832167c6f5b67eb08885539d0c08bf24feaae725c872b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.63.0/dock-cli-linux-arm64"
      sha256 "9696698a13052aa38c3fc2d4eba121e4e5c5c2a555e7b2723fe80b55466edf33"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.63.0/dock-cli-linux-amd64"
      sha256 "0955331be7b4b71b979f4e73663ec69e54dfa43f6c0e48ca6c8fcae710d5bb8f"
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
