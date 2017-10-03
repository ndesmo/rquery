# rquery
Query ODBC databases efficiently from R

To install, run the following command from R

```r
# Install devtools if you don't have it yet
# install.packages(devtools)
devtools::install_github('ndesmo/rquery')
```

This package allows you to query any ODBC-enabled datastore that uses SQL using R, in an efficient manner. SQL queries are only executed when needed, and the results are saved locally as RDS files. It's possible to use bind variables in your query (a one-row dataframe of substitutes to be precise), and these are all individually cached.

First things first, you need a ODBC driver set up using the same architecture that your version of R uses. So if you have 64-bit R and want to connect to SQL Server, then you need a 64-bit driver for SQL Server. You can find your installed ODBC drivers in Windows by entering "ODBC Data Sources". The DSN is the name of this driver, you'll need this. You'll need the username and password as well. Below is a code snippet showing how to connect.

```r
# Set environment variables for connecting with
Sys.setenv('db_dsn' = 'mydriver',
           'db_username' = 'myuser',
           'db_password' = 'password')
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
