# The dock CLI, the client of Tempo Dock: https://dock.nordtempo.com
# Written by Tempo Dock's release workflow (scripts/release/brew-formula.sh)
# from the release's signed SHA256SUMS; changes here are overwritten.
class Dock < Formula
  desc "Deploy apps, databases and agents to servers you own"
  homepage "https://dock.nordtempo.com"
  version "0.73.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.73.0/dock-cli-darwin-arm64"
      sha256 "a378914ca37e80a0fc69340cc26bc6987384435fadbb09fce5207bf4f8a1e9f6"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.73.0/dock-cli-darwin-amd64"
      sha256 "6fd8a2202168777a89037c8db919b2b3f5283d38dcd9d4aa7e3e7f8f558c4057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.73.0/dock-cli-linux-arm64"
      sha256 "a4ac52a7c515dfaf32f1d91fe6e0087584ca60fe1fd3c81eedb9498c4d62df57"
    end
    on_intel do
      url "https://github.com/NordTempo/tempoDock/releases/download/v0.73.0/dock-cli-linux-amd64"
      sha256 "673fd6100c55eb37ce6d8eba6b21e72af63b8ede75e3b329075bbf17cf0f75da"
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
