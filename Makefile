export NVCC_FLAGS ?= "-gencode=arch=compute_80,code=sm_80" #For Nvidia A100

install:
	$(info [Makefile]: Installing prefix_sum)
	cd external/prefix_sum/; \
	python setup.py install
	$(info [Makefile]: Installing frnn)
	python setup.py install

clean:
	$(info [Makefile]: Uninstalling prefix_sum + frnn)
	python -m pip uninstall -y frnn prefix_sum
