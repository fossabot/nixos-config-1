#!/usr/bin/env bash
dir="$(realpath $(dirname $0))"
cd $dir

path="$(nix-build . --no-out-link -A nixpkgs.system)"
echo $path

rm ./mutable/system
ln -s "$path" ./mutable/system

path="$(nix-build . --no-out-link -A libs.home-manager)"
echo $path

rm ./mutable/home-manager
ln -s "$path" ./mutable/home-manager
