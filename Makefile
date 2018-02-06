BASE = rai

DEPEND = Core Algo Geo Kin Gui Optim KOMO LGP

test_paths = $(shell find test -maxdepth 3 -name 'Makefile' -printf "%h ")

build: $(DEPEND:%=makeDepend/%) $(test_paths:%=makePath/%)

initUbuntuPackages: $(DEPEND:%=initUbuntuPackages/%)

clean: $(DEPEND:%=cleanPath/%) $(test_paths:%=cleanPath/%)$

runTests: $(test_paths:%=makePath/%) $(test_paths:%=runPath/%)

include $(BASE)/build/generic.mk

.NOTPARALLEL:
