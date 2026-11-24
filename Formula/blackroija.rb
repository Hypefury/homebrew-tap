class Blackroija < Formula
  desc "Floating window that lists your Claude Code sessions and what they need"
  homepage "https://github.com/Hypefury/blackroija"
  url "https://github.com/Hypefury/blackroija/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bbf01bae8ef3c4a6ddae40ea71974cf66f227428e511db7dfa0dc085659398fa"
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
