# jpmapdata

`jpmapdata` contains boundary GeoPackage files used by
[`jpmap`](https://yhoriuchi.github.io/jpmap/).

The package is intentionally separate from `jpmap` so updates to map-drawing
functionality do not require CRAN mirrors to store the same boundary data again.

```r
install.packages("jpmapdata")
install.packages("jpmap")

library(jpmap)
plot_jpmap("prefecture")
plot_jpmap("municipality", include = "Okinawa")
```

The package currently includes:

- `jpmap_boundaries_2021.gpkg`: Japan prefecture example boundaries.
- `jpmap_boundaries_2024_47.gpkg`: official MLIT N03 2024 municipal boundaries
  for Okinawa Prefecture.

For all-prefecture municipal boundaries, use `jpmap::jpmap_build_data()` to
build the national MLIT N03 file locally:

```r
jpmap_build_data(year = 2024)
```

The national 2024 GeoPackage is very large, so it is not bundled in the first
CRAN-facing `jpmapdata` package.
