class Cbqn < Formula
  desc "BQN implementation in C"
  homepage "https://github.com/dzaima/CBQN"
  url "https://github.com/dzaima/CBQN.git",
      tag: "v0.11.0"
  sha256 "b8b680b9c4a26f67a3949f28f58604ae1c52ef8d5d5d97d521393c528c36b178"
  license "GPL-3.0-or-later"
  head "https://github.com/dzaima/CBQN.git", branch: "develop"

  depends_on "pkgconf" => :build
  depends_on "libffi"

  def install
    if build.head?
      system "make"
    else
      system "make", "version=#{version}"
    end
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.bqn").write("•Show 1+1\n")
    assert_match "2", shell_output("#{bin}/bqn test.bqn").strip
  end
end
