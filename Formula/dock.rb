# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.67.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.67.0/dock-cli-darwin-arm64"
      sha256 "c7468c0b6e2255ee898de6a6d18dc37e4c5975a144dc11c0fd0a8b90185c79cd"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.67.0/dock-cli-darwin-amd64"
      sha256 "2189c141e5ef6cbb92d07c21a90028cc01b918c27afd02eb99adb85ce52b8a76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.67.0/dock-cli-linux-arm64"
      sha256 "d92259fb36456cbbd78e11053f7b1ff83dd7e2e06b620b4adf168892a1246174"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.67.0/dock-cli-linux-amd64"
      sha256 "53091c5702f8f3aaf9f3e2b588a3b9285a7f7328a86607422f0d9136acd7872c"
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
