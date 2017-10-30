#!/bin/bash

needed_software=( nasm yasm binutils gcc g++ perl virtualbox-guest-dkms virtualbox-guest-utils binutils-mingw-w64 mingw-w64 )
apt-get update

apt-get -y install ${needed_software[@]}
