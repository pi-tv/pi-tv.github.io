---
title: Linux archiving
tags: [Linux]
desc: todo
date: 2021-03-07
---

# Linux archiving

## .rar

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

## .tar.bz2

```bash
#!/bin/bash

tar -cjf "$1-$(date +%Y.%m.%d_%H.%M.%S).tbz" "$1"
```

It creates bzip2-compressed (`-j`), named using the current date archive from the specified file or directory.

## .tar.gz

```bash
#!/bin/bash

tar -czf "$1-$(date +%Y.%m.%d_%H.%M.%S).tgz" "$1"
```

It creates gzip-compressed (`-z`), named using the current date archive from the specified file or directory.
