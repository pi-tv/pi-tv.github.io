---
title: Archivers
tags: [Archiver]
ctags: [7za, rar, tar]
date: 2021-03-11
---

# Archivers

## Rar

```bash
rar a -r -m5 -k -s -ag-YYYY.MM.DD_HH.MM.SS "$1.rar" "$1"
```

It creates (`a -r`) a solid (`-s`), locked(`-k`), max. compressed (`-m5`) archive with timestamped
name (`-ag-YYYY.MM.DD_HH.MM.SS`) from the specified file or directory. 
Like "backup-2021.03.08_22.35.50.rar" from the "backup" directory.

## Tar + Bzip2 (.tar.bz2, .tbz), Gzip (.tar.gz, .tgz), Zstd (.tar.zst) compressors

```bash
tar -cjf "$1-$(date +%Y.%m.%d_%H.%M.%S).tbz" "$1"
tar -czf "$1-$(date +%Y.%m.%d_%H.%M.%S).tgz" "$1"
tar -c --zstd -f "$1-$(date +%Y.%m.%d_%H.%M.%S).tar.zst" "$1"
```

It creates an archive from the specified file or directory named using the current date:
bzip2-compressed (`-j`), gzip-compressed (`-z`) or zstd-compressed (`--zstd`)

## P7zip

```bash
7za a -t7z -mx=9 -ms=on "$1-$(date +%Y.%m.%d_%H.%M.%S).7z" "$1"
```

ultra compressed (`-mx=9`), solid (`-ms=on`)