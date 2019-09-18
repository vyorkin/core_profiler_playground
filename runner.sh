#!/run/current-system/sw/bin/sh

export BENCHMARKS_RUNNER=TRUE
export BENCH_LIB=lib

exec dune exec -- ./bench/main.exe -fork -run-without-cross-library-inlining "$@"
