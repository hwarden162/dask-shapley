.PHONY : docs
docs :
	rm -rf docs/build/
	sphinx-autobuild -b html --watch dask_shapley/ docs/source/ docs/build/

.PHONY : run-checks
run-checks :
	isort --check .
	black --check .
	ruff check .
	mypy .
	CUDA_VISIBLE_DEVICES='' pytest -v --color=yes --doctest-modules tests/ dask_shapley/

.PHONY : build
build :
	rm -rf *.egg-info/
	python -m build
