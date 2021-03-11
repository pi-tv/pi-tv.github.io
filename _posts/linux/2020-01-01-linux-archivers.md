---
title: Linux archivers
tags: [Linux]
desc: Different archivers usage
date: 2021-03-11
---

# Linux archivers

## Rar

```bash
#!/bin/bash

rar a -r -m5 -k -s -ag-YYYY.MM.DD_HH.MM.SS "$1.rar" "$1"
```

It creates (`a -r`) 
- solid (`-s`) 
- locked(`k`) 
- maximal compressed (`-m5`)
- named using the current date (`-ag-YYYY.MM.DD_HH.MM.SS`)
archive from the specified file or directory.

Like "pi-tv.github.io-2021.03.08_22.35.50.rar" from the `pi-tv.github.io` directory.

## Tar + Bzip2 (.tar.bz2, .tbz), Gzip (.tar.gz, .tgz), Zstd (.tar.zst) compressors

```bash
#!/bin/bash

tar -cjf "$1-$(date +%Y.%m.%d_%H.%M.%S).tbz" "$1"
tar -czf "$1-$(date +%Y.%m.%d_%H.%M.%S).tgz" "$1"
tar -c --zstd -f "$1-$(date +%Y.%m.%d_%H.%M.%S).tar.zst" "$1"
```

It creates an archive from the specified file or directory named using the current date:
- bzip2-compressed (`-j`), 
- gzip-compressed (`-z`) or
- zstd-compressed 


## p7zip

```bash
#!/bin/bash

7za a -t7z -mx=9 -ms=on "$1-$(date +%Y.%m.%d_%H.%M.%S).7z" "$1"
```

- ultra compressed (`-mx=9`) 
- solid (`-ms=on`)