# rquery
Query ODBC databases efficiently from R

To install, run the following command from R

```r
# Install devtools if you don't have it yet
# install.packages('devtools')
devtools::install_github('ndesmo/rquery')
```

This package allows you to query most databases that uses SQL using R, in an efficient manner. SQL queries are only executed when needed, and the results are saved locally as RDS files. It's possible to use bind variables in your query (a one-row dataframe of substitutes to be precise), and these are all individually cached.

First things first, you need a driver set up using the same architecture that your version of R uses. So if you have 64-bit R and want to connect to SQL Server, then you need a 64-bit driver for SQL Server.

```r
# Set environment variables for connecting with, e.g. here are Oracle-style connection details
library(rquery)
library(ROracle)
Sys.setenv('db_driver' = 'mydriver',
           'db_username' = 'myuser',
           'db_password' = 'password',
           'db_host' = 'my.host.com',
           'db_port' = 123,
           'db_sid' = 'stuff.io',
           NLS_LANG = 'ENGLISH_UNITED KINGDOM.UTF8')
```

Next you can declare your query and run it as follows:

```r
# Run your first query and call it "first" (am using Oracle as my database hence use of the "dual" table)
rquery("select 1 as a from dual", "first")

# Run a second query
rquery("select 2 as b from dual", "second")

# Run your first query again. It should run faster than before
rquery("select 1 as a from dual", "first")

# In fact, to rerun you don't need to specify SQL anymore
rquery(name = 'second')

# Force an overwrite of the first query
rquery(name = 'first', overwrite = TRUE)

# Try using substitutes
sql <- "select 1 as a from dual where 1 = XnumberX"
subs <- data.frame('XnumberX' = 1)
rquery(sql, 'third', subs)
```
You can refresh all the code in one go

```r
# Daily refresh
refresh()

# Force a refresh
refresh(overwrite = TRUE)
```
