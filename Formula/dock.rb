# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.66.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.0/dock-cli-darwin-arm64"
      sha256 "79a23875dd33e9833e4ca9aa66c8635c41004afa43f93c0946c883919ebffb2f"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.0/dock-cli-darwin-amd64"
      sha256 "f162c781b057aab0acaccce1f9fc878213a05ebbb0a24b7f445dfaef7646e2b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.0/dock-cli-linux-arm64"
      sha256 "77f69b4edd650381cf246b76b22fc85b27cbc5a9fd1c695e54dd88c320b7f8ad"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.66.0/dock-cli-linux-amd64"
      sha256 "5d0fbceb2b6f1dd487e5accf42df55388f470ab5ee9351a9531ee062f4201488"
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
