# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.59.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.0/dock-cli-darwin-arm64"
      sha256 "e871fb07bf04b44534e1d4c0cd7686ba60b5102ab6ab7edc4fd3527be654f8b6"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.0/dock-cli-darwin-amd64"
      sha256 "c3a56422670c38b01cb8b243a7faeab26a4e794f79c057af1f50429fc0e2f4e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.0/dock-cli-linux-arm64"
      sha256 "95b3adc147b406fb50110d5bcded48848ccdeaead5d89b88d013c2b638a4a784"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.59.0/dock-cli-linux-amd64"
      sha256 "44438ff1108df5b8ff2710c5f7e5b115d96cc09734d96e0bbd9214a885c9479b"
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
