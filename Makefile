CUDA_COMPUTE ?= "-gencode=arch=compute_80,code=sm_80" #For Nvidia A100
NCORES ?= 4

install:
	$(info [Makefile]: Installing prefix_sum)
	cd external/prefix_sum/; \
	NVCC_FLAGS=${CUDA_COMPUTE} MAX_JOBS=${NCORES} python setup.py install
	$(info [Makefile]: Installing frnn)
	NVCC_FLAGS=${CUDA_COMPUTE} MAX_JOBS=${NCORES} python setup.py install

clean:
	$(info [Makefile]: Uninstalling prefix_sum + frnn)
	python -m pip uninstall -y frnn prefix_sum
	rm -rf build
	rm -rf external/prefix_sum/build
