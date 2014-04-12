#!/bin/bash

COMMODITY=${1:-Rice}

YEARS="2005 2006 2007 2008 2009 2010 2011 2012 2013 2014"


echo "Downloading commodity: $COMMODITY"
for YEAR in $YEARS 
do
    echo -n "Data from year $YEAR, started: " && date
    # In case the download process is interrupted, '|| true' prevents the script from exiting
    python2 download_agmarket_daily.py -c $COMMODITY -r 01/01/$YEAR 31/12/$YEAR || true
done

### Might be useful
cat csv_out/${COMMODITY}_*.csv > india_${COMMODITY}_2005-2014.csv
