def read_sql(file_path):
    try:
        sql_src = open(file_path, 'r')
        file_contents = sql_src.read()
    finally:
        sql_src.close()
    return file_contents


def read_and_print(c, file_path):
    c.execute(read_sql(file_path))
    res = c.fetchall()
    if res:
        print('\n{}'.format(res))


def main():
    import psycopg2
    try:
        db = psycopg2.connect("dbname=news")
        c = db.cursor()
        for iterator in range(1,4):
            read_and_print(c, 'query{}.sql'.format(iterator))
    finally:
        db.close()

if __name__ == '__main__':
    main()
