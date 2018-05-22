# R:SS 2018 paper on Differentiable Physics and Stable Modes for Tool-Use and Manipulation Planning

This repository is a supplement to the paper
> M. Toussaint, K. R. Allen, K. A. Smith, and J. B. Tenenbaum:
> [Differentiable Physics and Stable Modes for Tool-Use and Manipulation Planning](http://ipvs.informatik.uni-stuttgart.de/mlr/papers/18-toussaint-RSS.pdf).
> In Proceedings of /Robotics: Science and Systems (R:SS)/, 2018.
Please also see the [supplementary video]() to get an impression on the method.

The repository checks out the original commit [18-RSS tag](https://github.com/MarcToussaint/rai/releases/tag/18-RSS) (as submodule) and allows you to reproduce the experiments. Please see the notes at the end on ongoing developments of the core [RAI](https://github.com/MarcToussaint/rai) code, including simpler interfaces for others to use these methods.

## Quick Start

On Ubuntu 16.04, and assuming you have ssh authorization with github:
```
git clone git@github.com:MarcToussaint/18-RSS-PhysicalManipulation.git
cd 18-RSS-PhysicalManipulation
git submodule init
git submodule update

make -j1 initUbuntuPackages  # calls sudo apt-get install; you can always interrupt
make                         # builds libs
cd demo; make; ./x.exe       # run the demo
```
