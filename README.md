# LGP (Logic-Geometric Programming)

This is a container repo, exposing the LGP method of the RAI code applied to physical manipulation planning. See https://github.com/MarcToussaint/rai for a README of the RAI code and why this is packaged as is.

## Quick Start

```
git clone git@github.com:MarcToussaint/LGP.git
cd LGP
git submodule init
git submodule update

make -j1 initUbuntuPackages  # calls sudo apt-get install; you can always interrupt
make                         # builds libs and tests
cd demo; make; ./x.exe       # run the demo
```
