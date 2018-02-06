BASE = rai

DEPEND = Core Algo Geo Kin Gui Optim KOMO LGP

build: $(DEPEND:%=makeDepend/%)

initUbuntuPackages: $(DEPEND:%=initUbuntuPackages/%)

clean: $(DEPEND:%=cleanPath/%)

include $(BASE)/build/generic.mk

.NOTPARALLEL:
