class Gitconvex < Formula
  desc "Gitconvex - A Web UI client for git"
  homepage "https://gitconvex.com"
  url "https://github.com/neel1996/gitconvex/releases/download/2.1.0-beta.1/gitconvex-2.1.0-beta.1.tar.gz"
  sha256 "ab8b1856d40c854d2bc1ea35d551234ed5ab64a916108157e60d508df0c597cd"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "libssh2"
  depends_on "libgit2"

  def install
    system "cp", "-r", "dist/gitconvex-ui", "."
    system "go", "build", "-v"
    bin.install "gitconvex"
  end

  test do
    assert_match "v2.1.0", shell_output("#{bin}/gitconvex --version")
  end
end
