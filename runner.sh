#!/run/current-system/sw/bin/sh

export BENCHMARKS_RUNNER=TRUE
export BENCH_LIB=lib
exec ./_build/default/bench/main.exe -run-without-cross-library-inlining "$@"
