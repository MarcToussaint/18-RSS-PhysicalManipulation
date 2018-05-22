# R:SS 2018 paper on Differentiable Physics and Stable Modes for Tool-Use and Manipulation Planning

This repository is a supplement to the paper
> M. Toussaint, K. R. Allen, K. A. Smith, and J. B. Tenenbaum:
> [Differentiable Physics and Stable Modes for Tool-Use and Manipulation Planning](http://ipvs.informatik.uni-stuttgart.de/mlr/papers/18-toussaint-RSS.pdf).
> In Proceedings of *Robotics: Science and Systems (R:SS)*, 2018.

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

If you don't have ssh authorization, try
```
git clone https://github.com/MarcToussaint/18-RSS-PhysicalManipulation.git
cd 18-RSS-PhysicalManipulation

git config --file=.gitmodules submodule.rai.url https://github.com/MarcToussaint/rai.git
git config --file=.gitmodules submodule.rai-robotModels.url https://github.com/MarcToussaint/rai-robotModels.git

git submodule init
git submodule update

make -j1 initUbuntuPackages  # calls sudo apt-get install; you can always interrupt
make                         # builds libs
cd demo; make; ./x.exe       # run the demo
```

If you need to run in a docker, please have a look at the [docker setup](https://github.com/MarcToussaint/rai-maintenance/tree/master/docker) I use to test RAI. A slight modification of the Dockerfile and run scripts should allow you to setup the appropriate environment also for this repo, including X.

## Ongoing development

This repo is meant as a snapshot that documents the RSS paper's experiments. Since then, the RAI code and LGP method continuously developed, both to provide cleaner interfaces to collaborators, and in terms of extending the method. Please contact me if you'd like to collaborate using the code and need a simpler access point or interface.

