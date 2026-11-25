# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.64.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.64.0/dock-cli-darwin-arm64"
      sha256 "3cb8985377fddbcba1b0fda39eef52392baed1108994f99ee8418cba088b3591"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.64.0/dock-cli-darwin-amd64"
      sha256 "8eeb896431aa3040d5af2b04d5eed3337fd9ac81b13fad0fd64ea7abb02ed3c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.64.0/dock-cli-linux-arm64"
      sha256 "4b0e4cd91b2c41d8dfebc364a15e8d43d950bebb763ead22ba0b0fdbb2feaa51"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.64.0/dock-cli-linux-amd64"
      sha256 "c646bf1e80faf7d6211e9701241aaaddb2821658cdf6d2ce19a79829e2fd6750"
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
