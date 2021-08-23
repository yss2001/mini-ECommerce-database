import os
import pymysql

def handle_search(cursor, database):
    os.system('clear')
    search = input("Enter a model name (complete or part of it): ")

    query = "SELECT * FROM Product"

    try:
        flag = 0
        cursor.execute(query)
        results = cursor.fetchall()
        for record in results:
            if search in record[2]:
                flag = 1
                print("Model Name: ", record[2], "\t")
                print("Price: ", record[1], "\t")
                print("Stock left: ", record[3], "\t")
                print("\n")

        if flag==0:
            print("No such product exists!\n")

        temp = input("Press any key to continue...")


    except Exception as e:
        print(e)
        database.rollback()

