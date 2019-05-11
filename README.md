# Logs Analysis

An internal reporting tool for use with the news database provided by Udacity as part of Udacity's Full Stack Developer program

## Installation and Setup

Prerequisites:  
For the following applications, ensure they are accessible from your PATH variable  
1. First you'll need VirtualBox installed on your machine. Find your operating system and install [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
2. Next you'll need to install [Vagrant](https://www.vagrantup.com/downloads.html)

Then follow these instructions:

```sh
 $ git clone https://github.com/udacity/fullstack-nanodegree-vm.git
 $ cd fullstack-nanodegree-vm/vagrant
 $ vagrant up
```
`vagrant up` may take awhile to download. Wait until it is done before continuing  
this project is made for python 2.7 -- the vagrant instance will have python 2.7 preinstalled  
for development on your local machine you can install python 2.7.16 [here](https://www.python.org/downloads/release/python-2716/)  
```sh
 $ vagrant ssh
 $ git clone https://github.com/lumodon/logs_analysis.git
 $ cd logs_analysis
 $ wget https://d17h27t6h515a5.cloudfront.net/topher/2016/August/57b5f748_newsdata/newsdata.zip
 $ unzip newsdata.zip && rm newsdata.zip
 $ psql -d news -f newsdata.sql && rm newsdata.sql
 $ pip install -r requirements.txt
 $ python init.py
 $ python main.py
```

## Architecture

`init.py` indexes database to allow `query2.sql` to execute faster.  
  
The project is modularized with three `sql` for easier debugging (using `psql -d news query{N}.sql` where N is 1-3)  
  
`main.py` then iterates over the sql files, reading them, and executing them using `psycopg2` to interact with the postgresql database  
  
`query1.sql` and `query3.sql` both use views to give readability where subselect queries would have been cumbersome  
  
this project follows [pep8](https://www.python.org/dev/peps/pep-0008/) style guide  
  
`pudb` was used for debugging -- but is not a requirement for the project  
  
`requirements.txt` the requirements in requirements.txt from `pip freeze > requirements.txt` include predefined list provided by vagrant.  
  
psycopg2 is the only production requirement used, pudb is a dev intall. Coming from NodeJS -- I am not sure how to perform python's equivelant to `npm install --save-dev ###`  
  
the vagrant system is using Python 2.7  

## References used

1. http://www.postgresqltutorial.com/postgresql-date/  
    For the formatting of date in query3.sql
2. https://stackoverflow.com/questions/39154661/postgresql-negative-substring-length-not-allowed-but-no-obvious-violation-in-da  
    Seeking how to get substring to ignore '%' symbol -- discovered there's a `length` key word: used in query3.sql  
3. https://stackoverflow.com/questions/11182339/reference-alias-calculated-in-select-in-where-clause  
    Struggling with not being able to use `as` keyword in `where` clause - discovered ability to use subselect (which was turned into a view) to force name of item  
4. https://pyformat.info/  
    How to interpolate strings in python for use in for loop of query files  
5. https://www.cybertec-postgresql.com/en/postgresql-speeding-up-group-by-and-joins/  
    query2.sql was taking 30 to 60 seconds -- by switching to this WITH format it now runs in only a matter of seconds

## License

This is free and unencumbered software released into the public domain.  
  
Anyone is free to copy, modify, publish, use, compile, sell, or  
distribute this software, either in source code form or as a compiled  
binary, for any purpose, commercial or non-commercial, and by any  
means.  
  
In jurisdictions that recognize copyright laws, the author or authors  
of this software dedicate any and all copyright interest in the  
software to the public domain. We make this dedication for the benefit  
of the public at large and to the detriment of our heirs and  
successors. We intend this dedication to be an overt act of  
relinquishment in perpetuity of all present and future rights to this  
software under copyright law.  
  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF  
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR  
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,  
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  
OTHER DEALINGS IN THE SOFTWARE.  
  
For more information, please refer to <http://unlicense.org/>  
