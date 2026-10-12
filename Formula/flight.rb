# SPDX-License-Identifier: MIT
class Flight < Formula
  desc "Persistent terminal workspaces for AI coding agents and shells"
  homepage "https://github.com/syncom-systems/flight"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/syncom-systems/flight/releases/download/v1.0.0/flight-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "e91378f84147ba182964af71465d902235a4d07b6b75eae1539f3b4803d60d41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/syncom-systems/flight/releases/download/v1.0.0/flight-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c3c5394145760db711ea6d9967baa6109877b171d5904c1426772c1146f8c21"
    end
  end

  depends_on "tmux"

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
