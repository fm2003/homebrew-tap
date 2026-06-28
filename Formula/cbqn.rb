# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cbqn < Formula
  desc "A BQN implementation in C"
  homepage "https://github.com/dzaima/CBQN"
  url "https://github.com/dzaima/CBQN/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "b8b680b9c4a26f67a3949f28f58604ae1c52ef8d5d5d97d521393c528c36b178"
  head "https://github.com/dzaima/CBQN.git", branch: "develop"
  license "GPL-3.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "libffi"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.bqn").write("•Show 1+1\n")
    assert_match "2", shell_output("#{bin}/bqn test.bqn").strip
  end
end
