# References used


1. http://www.postgresqltutorial.com/postgresql-date/  
  For the formatting of date in query3.sql
2. https://stackoverflow.com/questions/39154661/postgresql-negative-substring-length-not-allowed-but-no-obvious-violation-in-da  
  Seeking how to get substring to ignore '%' symbol -- discovered there's a `length` key word: used in query3.sql  
3. https://stackoverflow.com/questions/11182339/reference-alias-calculated-in-select-in-where-clause  
  Struggling with not being able to use `as` keyword in `where` clause - discovered ability to use subselect (which was turned into a view) to force name of item  
4. https://pyformat.info/  
  How to interpolate strings in python for use in for loop of query files  
