class Cbqn < Formula
  desc "BQN implementation in C"
  homepage "https://github.com/dzaima/CBQN"
  head "https://github.com/dzaima/CBQN.git", branch: "develop"
  license "GPL-3.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "libffi"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.bqn").write("•Show 1+1\n")
    assert_match "2", shell_output("#{bin}/bqn test.bqn").strip
  end
end
