# SPDX-License-Identifier: MIT
class Flight < Formula
  desc "Persistent terminal workspaces for AI coding agents and shells"
  homepage "https://github.com/syncom-systems/flight"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/syncom-systems/flight/releases/download/v1.1.0/flight-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "aa79da1584fe72f3ef09805386aa37bb8b281a36844ca1c24308a02380e2cc90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/syncom-systems/flight/releases/download/v1.1.0/flight-1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "952ae6afe3a5fde8081cf01182cc36da5587726301b2e08344c9eb15741a1861"
    end
  end

  def install
    bin.install "flight"
    doc.install "README.md", "SECURITY.md"
    doc.install Dir["docs/*.md"]
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
