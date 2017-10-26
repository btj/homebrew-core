class OcamlFindlib < Formula
  desc "OCaml library manager"
  homepage "http://projects.camlcity.org/projects/findlib.html"
  url "http://download.camlcity.org/download/findlib-1.7.3.tar.gz"
  sha256 "d196608fa23c36c2aace27d5ef124a815132a5fcea668d41fa7d6c1ca246bd8b"

  depends_on "ocaml"

  def install
    ENV.deparallelize

    system "./configure", "-bindir", "bin",
                          "-mandir", "share/man",
                          "-sitelib", "lib/ocaml",
                          "-config", "etc/ocamlfind.conf",
                          "-no-topfind"
    system "make", "all"
    system "make", "opt"
    system "make", "install", "prefix=#{prefix}/"
    # prefix.install Dir["output/#{HOMEBREW_PREFIX}/*"]
  end

  test do
    system "#{bin}/ocamlfind", "query", "findlib"
  end
end
