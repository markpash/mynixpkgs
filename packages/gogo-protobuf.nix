{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gogo-protobuf";
  version = "1.3.2";

  src = fetchFromGitHub {
    owner = "gogo";
    repo = "protobuf";
    rev = "v${version}";
    hash = "sha256-CoUqgLFnLNCS9OxKFS7XwjE17SlH6iL1Kgv+0uEK2zU=";
  };

  vendorSha256 = "sha256-nOL2Ulo9VlOHAqJgZuHl7fGjz/WFAaWPdemplbQWcak=";

  subPackages = [
    "proto"
    "gogoproto"
    "jsonpb"
    "protoc-gen-gogo"
    "protoc-gen-gofast"
    "protoc-gen-gogofast"
    "protoc-gen-gogofaster"
    "protoc-gen-gogoslick"
    "protoc-gen-gostring"
    "protoc-min-version"
    "protoc-gen-combo"
    "gogoreplace"
  ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/gogo/protobuf/";
  };
}
