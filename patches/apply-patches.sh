#!/bin/bash
cd ./bootable/recovery
for f in ../../device/realme/RMX3231/patches/*.patch
do
  patch -p1 < $f
done
cd ../..
