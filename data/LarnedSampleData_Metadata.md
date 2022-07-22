# Metadata

 - **Filename:** LarnedSampleData.csv
 - **Data Description:** This file contains daily streamflow, stream stage, groundwater level, and meteorological data for the Kansas Geological Survey's Larned Research Site. It has been extracted from the larger, long-term dataset at the site for teaching purposes.
 - **Data creator:** Data were compiled by Sam Zipper and originally collected by various personnel at the US Geological Survey (USGS; streamflow and stream stage), Kansas Geological Survey (KGS; groundwater levels), and National Oceanic and Atmospheric Administration (NOAA; meteorological data).
 - **Data fields:** There are 13 fields in this dataset:
	 - `date_ghcn` = date of measurement in format YYYY-MM-DD. Dates are based on the 24-hour NOAA GHCN-D data collection, which occurs at 07:00 local time. In other words, the data corresponding to each date is from 07:01 the prior day to 07:00 the date listed.
	 - `WaterYear` = the water year of the measurement, defined as October 1 of the prior year to September 30 of the year listed.
	 - `discharge_cms` = daily average stream discharge in cubic meters per second. Derived from [USGS gage 07141220](https://waterdata.usgs.gov/nwis/uv?site_no=07141220).
	 - `stage_masl` = daily average stream stage in meters above sea level. Derived from [USGS gage 07141220](https://waterdata.usgs.gov/nwis/uv?site_no=07141220).
	 - `hydrologicalRegime` = categorical variable (wet or dry) describing hydrologic regime for date of interest. Wet regimes are characterized by near-continuous discharge > 0 and dry regimes are characterized by near-continuous discharge = 0. There is a mismatch in temporal scale because regimes were determine using monthly data, so they always start/end at the midpoint of a month apart from the first wet regime. Details on regime determination are in [Zipper et al. (2022)](https://doi.org/10.1088/1748-9326/ac7539). 
	 - `alluvialAquifer_masl` = alluvial aquifer water level in meters above sea level from KGS monitoring well LWPH4a. 
	 - `alluvialAquifer_masl_source` = source for alluvial aquifer water level data (NA, Observed, of Gapfill). NA indicates no data available on that day. Observed indicates averaged to match date_ghcn from 15 minute resolution data. Gapfill indicates gap-filled using regression to other gages or periods of time.
	 - `highPlainsAquifer_masl` = High Plains aquifer water level in meters above sea level from KGS monitoring well LWPH4c. 
	 - `highPlainsAquifer_masl_source` = source for High Plains aquifer water level data (NA, Observed, of Gapfill). NA indicates no data available on that day. Observed indicates averaged to match date_ghcn from 15 minute resolution data. Gapfill indicates gap-filled using regression to other gages or periods of time.
	 - `prcp_mm` = daily precipitation in mm. Obtained from NOAA GHCN-D.
	 - `tmax_c` = daily maximum temperature in degrees Celsius. Obtained from NOAA GHCN-D.
	 - `tmin_c` = daily minimum temperature in degrees Celsius. Obtained from NOAA GHCN-D.
	 - `ETo_mm` = daily reference evapotranspiration. Calculated using Hargreaves-Samani approach based on temperature, precipitation, and site characteristics in the [Evapotranspiration package for R](https://cran.r-project.org/package=Evapotranspiration) and then empirically-adjusted based on ASCE reference ET from a nearby [Kansas Mesonet](http://mesonet.k-state.edu/) station.
 - **Citation:** Zipper S, I Popescu, K Compare, C Zhang, & EC Seybold (2022). Alternative stable states and hydrological regime shifts in a large intermittent river. Environmental Research Letters. https://doi.org/10.1088/1748-9326/ac7539