class Blackroija < Formula
  desc "Floating window that lists your Claude Code sessions and what they need"
  homepage "https://github.com/Hypefury/blackroija"
  url "https://github.com/Hypefury/blackroija/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "471c05ff8e4bb0a49256c1a5fd2142eec146aeeedb23a2cd40b14ee5f4a9ecf9"
  license "MIT"

  depends_on macos: :sonoma

  def install
    ENV["VERSION"] = version.to_s
    system "./build.sh"
    prefix.install "blackroija.app"
    bin.install_symlink prefix/"blackroija.app/Contents/MacOS/blackroija"
  end

  service do
    run [opt_prefix/"blackroija.app/Contents/MacOS/blackroija"]
    keep_alive true
  end

  test do
    assert_path_exists prefix/"blackroija.app/Contents/Info.plist"
  end
end
