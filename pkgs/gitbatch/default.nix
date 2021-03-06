{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "gitbatch-${version}";
  version = "2019-12-29";

  src = fetchFromGitHub {
    owner = "isacikgoz";
    repo = "gitbatch";
    rev = "381b0df7f86056c625c0d4d2d979733c1ee5def7";
    sha256 = "0613vfqdn3k0w7fm25rqnqdr67w9vii3i56dfslqcn1vqjfrff3q";
  };

  modSha256 = "1i51lgzrnayxkyn2fzapngrcpbcr5bzzk4fsl4hc00c3csxbxa4q";
}
