class Gitconvex < Formula
  desc "Gitconvex - A Web UI client for git"
  homepage "https://gitconvex.com"
  url "https://github.com/neel1996/gitconvex/releases/download/2.1.0-beta.1/gitconvex-2.1.0-beta.1.tar.gz"
  sha256 "e5820fb09072c65e62950bd0a0bde0c93187e224840895d06780bc945030fc07"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "libssh2"
  depends_on "libgit2"

  def install
    system "mkdir", "-p", "/usr/local/gitconvex"
    system "cp", "-r", "dist/gitconvex-ui", "/usr/local/gitconvex/"
    system "go", "build", "-o", "/usr/local/gitconvex/gitconvex"
    system "ln", "-s", "/usr/local/gitconvex/gitconvex", "/usr/local/bin"
    system "ln", "-s", "/usr/local/gitconvex/gitconvex-ui/", "/usr/local/bin"
  end

  test do
    assert_match "v2.1.0", shell_output("#{bin}/gitconvex --version")
  end
end
