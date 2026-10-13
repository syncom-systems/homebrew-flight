# SPDX-License-Identifier: MIT
class Flight < Formula
  desc "Persistent terminal workspaces for AI coding agents and shells"
  homepage "https://github.com/syncom-systems/flight"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/syncom-systems/flight/releases/download/v1.0.1/flight-1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "1df6db3eac94479b27feddd26745bc52f0b1a9144c0ee8c8bf6e387441b9796f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/syncom-systems/flight/releases/download/v1.0.1/flight-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e391b9c28e76cbc7ded52a47d2067b9fed28117aa4be718268f4a8d90c76c095"
    end
  end

  def install
    bin.install "flight"
    doc.install "README.md", "install.md"
    pkgshare.install "contrib"
  end

  def caveats
    <<~EOS
      Run `flight` to start. On macOS, turn off the system shortcut that uses
      Ctrl-Space for input sources (System Settings > Keyboard > Keyboard
      Shortcuts > Input Sources), or Flight never sees its escape key.
      Service templates: #{opt_pkgshare}/contrib
    EOS
  end

  test do
    assert_match "flight #{version}", shell_output("#{bin}/flight --version")
  end
end
