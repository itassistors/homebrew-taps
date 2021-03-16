class Gitconvex < Formula
  desc "Gitconvex - A Web UI client for git"
  homepage "https://gitconvex.com"
  url "https://github.com/neel1996/gitconvex/releases/download/2.1.0-beta.1/gitconvex-2.1.0-beta.1.tar.gz"
  sha256 "0d26bfd5913373ab4c2f7864925c891321e48eaea8c1a39d7f9c81a2a00ee76f"
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
