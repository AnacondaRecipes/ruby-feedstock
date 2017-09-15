#!/bin/bash
set -e
set -x

if [[ ${HOST} =~ .*darwin.* ]]; then
  export LDFLAGS="${LDFLAGS_CC} -Wl,-rpath,${PREFIX}/lib"
fi

./configure --prefix="${PREFIX}"             \
            --disable-install-doc            \
            --enable-load-relative           \
            --enable-shared                  \
            --with-openssl-dir="${PREFIX}"   \
            --with-readline-dir="${PREFIX}"  \
            --with-tcl-dir="${PREFIX}"       \
            --with-tk-dir="${PREFIX}"        \
            --with-libyaml-dir="${PREFIX}"   \
            --with-zlib-dir="${PREFIX}"
make -j${CPU_COUNT} ${VERBOSE_AT}
make install
