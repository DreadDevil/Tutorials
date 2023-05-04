import pypyodbc

mySQLServer = localhost
myDatabase = basename

connection = pypyodbc.connect('Driver={SQL Server};'
                              "Server=localhost;"
                              "Database=basename;")

cursor = connection.cursor()

mySQLQuery = ("""
                SELECT
                FROM
                WHERE
              """)

cursor.execute((mySQLQuery))
results = cursor.fetchall()

print(results)

connection.close