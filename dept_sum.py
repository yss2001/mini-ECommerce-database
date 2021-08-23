import pymysql
import os

def dept_sum(cursor, database):
    query = "SELECT Works_For_Office, SUM(Salary) FROM Employee GROUP BY Works_For_Office;"

    try:
        cursor.execute(query)
        result = cursor.fetchall()

        for record in result:
            print("Department Number:", record[0], end=' ')
            print(record[1], "\n")
    except Exception as e:
        print(e)
        print("Query failed!\n")
        database.rollback()

    temp = input("Press any key to continue...")
