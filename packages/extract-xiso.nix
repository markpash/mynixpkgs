{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "extract-xiso";
  version = "202303040307";

  src = fetchFromGitHub {
    owner = "XboxDev";
    repo = "extract-xiso";
    rev = "build-${version}";
    sha256 = "sha256-nPkdyxI2gxxCpE4sG9sax+mbKkhbe3zZENvlO7JSUEQ=";
  };

  nativeBuildInputs = [ cmake ];

  configurePhase = ''
    cmake .
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    install -Dm555 extract-xiso $out/bin/extract-xiso
  '';

  doCheck = false;

  meta = {
    homepage = "https://github.com/XboxDev/extract-xiso/";
  };
}
