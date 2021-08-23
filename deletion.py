import pymysql
import os

def delete_customer(cursor, database):
    os.system('clear')
    uname = input("Input username: ")

    query1 = "DELETE FROM Purchase_History_Products WHERE Username = '%s'" % (uname)
    query2 = "DELETE FROM Purchase_History WHERE Username = '%s'" % (uname)
    query3 = "DELETE FROM `Order` WHERE Username = '%s'" % (uname)
    query4 = "DELETE FROM Registered_Customer_Shipping_Address WHERE Username = '%s'" % (uname)
    query5 = "DELETE FROM Registered_Customer WHERE Username = '%s'" % (uname)

    try:
        cursor.execute(query1)
        cursor.execute(query2)
        cursor.execute(query3)
        cursor.execute(query4)
        cursor.execute(query5)
        database.commit()
        print("User deleted!\n")

    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)

def handle_delete(cursor, database):
    os.system('clear')
    print("1. Delete a customer's account.\n")
#   print("2. Delete a delivery provider's contract.\n")
#   print("3. Delete a product.\n")
#   print("4. Delete a merchant.\n")
    print("Enter 0 to return.\n")

    d_choice = int(input("Enter your choice: "))
    if d_choice == 0:
        return
    elif d_choice == 1:
        delete_customer(cursor, database)
    temp = input("Press any key to continue...")
