#!/usr/bin/env python
def read_sql(file_path):
    try:
        sql_src = open(file_path, 'r')
        file_contents = sql_src.read()
    finally:
        sql_src.close()
    return file_contents


def most_views(c, query_file):
    c.execute(read_sql(query_file))
    res = c.fetchall()
    for article in res:
        print('"{}" with {}'.format(article[0], article[1]))
    print('\n')


def dates_errors(c):
    c.execute(read_sql('query3.sql'))
    res = c.fetchall()
    for error_date in res:
        print('date {} had {} errors'.format(error_date[0], error_date[1]))
    print('\n')


def main():
    import psycopg2
    try:
        db = psycopg2.connect("dbname=news")
        c = db.cursor()
        for iterator in range(1, 3):
            most_views(c, 'query{}.sql'.format(iterator))
        dates_errors(c)
    finally:
        db.close()


if __name__ == '__main__':
    main()
