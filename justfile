# use 7z cli to make data pack
build:
    7z a -x!.git/ -x!.justcache/ -x!justfile "../mc-Custom Recipe Pack.zip" .
