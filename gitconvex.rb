class Gitconvex < Formula
  desc "A Web UI client for git"
  homepage "https://gitconvex.com"
  url "https://github.com/neel1996/gitconvex/releases/download/2.1.1/gitconvex-v2.1.1-brew.tar.gz"
  sha256 "683c1927e750499cec95b807e0491362a159757fad0e951f678c7f20b3b5c74a"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "libgit2"
  depends_on "libssh2"

  def print_lines(sym)
    $i = 0
    print "\n"
    while $i < 50
      print "#{sym}"
      $i += 1
    end
    print "\n"
  end

  def install
    # Current version will be updated every release
    version = "2.1.1"
    FileUtils.cp "./dist/", bin
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/neel1996/gitconvex-server"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-v", "-o", bin/"gitconvex", "."
      print_lines("=")
      print "\n✅\tGitconvex server is successfully installed!"
      print "\n🖥️\tNow copy and run the following command to link the UI directory to the same path"
      print "\n"
      cmd = "ln -s #{HOMEBREW_PREFIX}/Cellar/gitconvex/#{version}/bin/gitconvex-ui #{HOMEBREW_PREFIX}/bin/"
      print_lines(">")
      print "\n#{cmd}\n"
      print_lines("<")
      print_lines("=")
    end
  end

  test do
    assert_match "2.1.1", shell_output("#{bin}/gitconvex --version")
  end
end
