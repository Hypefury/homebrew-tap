class Blackroija < Formula
  desc "Floating window that lists your Claude Code sessions and what they need"
  homepage "https://github.com/Hypefury/blackroija"
  url "https://github.com/Hypefury/blackroija/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "da70609a5ea4dc3ce9f4e6db9fab991192d213971f8bbf5f3f62eff0cab12350"
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
