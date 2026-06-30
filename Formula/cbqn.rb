class Cbqn < Formula
  desc "BQN implementation in C"
  homepage "https://github.com/dzaima/CBQN"
  url "https://github.com/dzaima/CBQN.git",
      tag: "v0.12.0"
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
