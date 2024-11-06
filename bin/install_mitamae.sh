#!/bin/bash

set -eux

mitamae_version="1.14.2"
mitamae_cache="mitamae-${mitamae_version}"

if [[ -f "bin/${mitamae_cache}" ]]; then
  exit
fi

case "$(uname)" in
  "Darwin")
    case "$(uname -m)" in
      "arm64")
        mitamae_bin="mitamae-aarch64-darwin"
        ;;
      "x86_64")
        mitamae_bin="mitamae-x86_64-darwin"
        ;;
      *)
        echo "Unexpected Darwin machine: $(uname -m)"
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unexpected uname: $(uname)"
    exit 1
    ;;
esac

curl -o "bin/${mitamae_cache}" -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${mitamae_version}/${mitamae_bin}"
chmod +x "bin/${mitamae_cache}"

ln -sf "${mitamae_cache}" bin/mitamae
