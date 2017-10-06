IMAGE=sourcefinding.img
DEF=sourcefinding.def

.PHONY: bootstrap

all: bootstrap

${IMAGE}:
	sudo singularity create -s 25000 ${IMAGE}
bootstrap: ${IMAGE}
	sudo singularity bootstrap ${IMAGE} ${DEF}
upgrade:
	sudo singularity exec --writable ${IMAGE} apt-get update
	sudo singularity exec --writable ${IMAGE} apt-get upgrade
clean:
	rm -f ${IMAGE}
