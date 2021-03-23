# 4.About-Disk(of-view-archive)
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.View Disk
# cli: df du
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
rootfs          223G  174G   49G  79% /
$ du -sh
187M    .
# 2.tar
# tar (1)              - an archiving utility
!<<!
$ tar --help
Usage: tar [OPTION...] [FILE]...
GNU 'tar' saves many files together into a single tape or disk archive, and can
restore individual files from the archive.
Examples:
  tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
  tar -tvf archive.tar         # List all files in archive.tar verbosely.
  tar -xf archive.tar          # Extract all files from archive.tar.
!

# 3.zip
# gunzip (1)           - compress or expand files
# gzip (1)             - compress or expand files
!<<!
$ gzip --help
Usage: gzip [OPTION]... [FILE]...
Compress or uncompress FILEs (by default, compress FILES in-place).
$ gunzip --help
Usage: /usr/bin/gunzip [OPTION]... [FILE]...
Uncompress FILEs (by default, in-place).
!
