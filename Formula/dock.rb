# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.70.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.70.0/dock-cli-darwin-arm64"
      sha256 "b8a73289de08ccc9311a479dd02213c4f1ebd56f0775e069406dd270eceb74be"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.70.0/dock-cli-darwin-amd64"
      sha256 "e955a4763339569ec1c7df41b7e24afce017c8b3600bd127a4ed9c19edfc4ac7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.70.0/dock-cli-linux-arm64"
      sha256 "22339a0d96b153389bb5579caea8e2a83609f7045734a99395d4223f01f330fc"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.70.0/dock-cli-linux-amd64"
      sha256 "846184361c2a9c54b27e11de105f3af9b493519024e41ba31b98a52d8b0e993d"
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
