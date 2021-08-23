import pymysql
import os

def handle_analysis1(cursor, database):
    query = "SELECT COUNT(p.OrderID), r.State from Purchase_History p INNER JOIN Registered_Customer_Shipping_Address r ON p.Username = r.Username GROUP BY r.State"

    os.system('clear')

    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for record in results:
            print("Orders from", record[1], ":", end = ' ')
            print(record[0])

        temp = input("Press any key to continue...")

    except Exception as e:
        print(e)
        database.rollback()
