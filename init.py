def execute_db(file_path):
    try:
        sql_src = open(file_path, 'r')
        file_contents = sql_src.read()
    finally:
        sql_src.close()
    return file_contents


def init_db():
    import psycopg2
    try:
        db = psycopg2.connect("dbname=news")
        c = db.cursor()
        c.execute(execute_db('query_manual_precursor.sql'))
        db.commit()
    finally:
        db.close()


init_db()
