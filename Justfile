version := '580.95.05'

help:
    just --list

# Fetch amd64 and arm64 NVIDIA drivers and validate their checksums.
update: \
    (fetch 'x86_64' 'amd64' '849ef0ef8e842b9806b2cde9f11c1303d54f1a9a769467e4e5d961b2fe1182a7') \
    (fetch 'aarch64' 'arm64' 'ccb4426e98a29367c60daf9df34c2a577655d54d5be25463ccd409b0b2e52029')

# Construct the `target-dst` variable and then run the `pre-validate`, `download`, and `post-validate` recipes.
[private]
fetch arch target-dir shasum: (post-validate arch shasum target-dir target-dir / 'NVIDIA-Linux-' + arch + '-' + version + '.run')

# Download driver if its file does not exist.
[private]
download arch shasum target-dir target-dst: (pre-validate target-dst shasum)
    #!/bin/env bash
    set -euo pipefail
    mkdir -p {{target-dir}}
    ARCH=$(test {{arch}} = aarch64 && echo {{arch}} || echo Linux-{{arch}})
    test -e {{target-dst}} || curl -o {{target-dst}} "https://us.download.nvidia.com/XFree86/${ARCH}/{{version}}/NVIDIA-Linux-{{arch}}-{{version}}.run"

# Remove file on checksum mismatch and continue.
[private]
pre-validate target-dst shasum:
    #!/bin/env bash
    set -euo pipefail
    test -e {{target-dst}} && (test '{{shasum}}' = "$(sha256sum {{target-dst}} | cut -d' ' -f1)" || rm {{target-dst}}) || true

# Error on checksum mismatch or missing file.
[private]
post-validate arch shasum target-dir target-dst: (download arch shasum target-dir target-dst)
    #!/bin/env bash
    set -euo pipefail
    test -e {{target-dst}} && test '{{shasum}}' = "$(sha256sum {{target-dst}} | cut -d' ' -f1)"
