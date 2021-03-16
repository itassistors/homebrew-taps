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
    system "cp", "-r", "dist/gitconvex-ui", "."
    system "go", "build", "-v", "-a"
  end

  test do
    assert_match "v2.1.0", shell_output("#{bin}/gitconvex --version")
  end
end
