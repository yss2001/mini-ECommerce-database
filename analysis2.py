import os
import pymysql

def handle_analysis2(cursor, database):
    os.system('clear')
    print("Input 0 if you don't wish to specify any of the date constraint.")
    date1 = input("Input FROM date (YYYY-MM-DD): ")
    date2 = input("Input TO date (YYYY-MM-DD): ")

    print("Result:\n")

    query = ""

    if date1=="0" and date2=="0":
        query = "SELECT count(ProductID), ProductID from Purchase_History p INNER JOIN Purchase_History_Products h ON p.Username = h.Username AND p.OrderID = h.OrderID GROUP BY ProductID"
    elif date1!="0" and date2!="0":
        query = "SELECT count(ProductID), ProductID from Purchase_History p INNER JOIN Purchase_History_Products h ON p.Username = h.Username AND p.OrderID = h.OrderID WHERE p.Date >= '%s' AND p.Date <= '%s' GROUP BY ProductID" % (date1, date2)
    elif date1!="0" and date2=="0":
        query = "SELECT count(ProductID), ProductID from Purchase_History p INNER JOIN Purchase_History_Products h ON p.Username = h.Username AND p.OrderID = h.OrderID WHERE p.Date >= '%s' GROUP BY ProductID" % (date1)
    elif date1=="0" and date2!="0":
        query = "SELECT count(ProductID), ProductID from Purchase_History p INNER JOIN Purchase_History_Products h ON p.Username = h.Username AND p.OrderID = h.OrderID WHERE p.Date <= '%s' GROUP BY ProductID" % (date2)

    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for record in results:
            print("Orders for", record[1], ":", end = ' ')
            print(record[0], "\n")

        temp = input("Press any key to continue...")

    except Exception as e:
        print(e)
        database.rollback()
