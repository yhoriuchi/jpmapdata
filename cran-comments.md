## Test environments

- Local macOS Tahoe 26.5.1, R 4.6.1

## R CMD check results

0 errors | 0 warnings | 2 notes

This is a new data-package submission. The package contains boundary
'GeoPackage' files used by the 'jpmap' package. Keeping these data separate
lets 'jpmap' update its functionality without repeatedly redistributing the
same boundary files on CRAN mirrors.

The included MLIT N03 administrative area data are derived from the official
2024 Okinawa Prefecture file. The national 2024 municipal file was tested but
is not included in this first submission because the generated 'GeoPackage' is
very large.

The CRAN incoming size note is expected for this data package. The source
tarball is about 15 MB and contains boundary 'GeoPackage' files used by 'jpmap'
examples and tutorials.

The local check also reports that the installed HTML Tidy is not recent enough
to run HTML validation. This is a local toolchain note.

## Downstream dependencies

There are no downstream dependencies because this is a new submission.
