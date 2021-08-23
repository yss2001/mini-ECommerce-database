import pymysql
import os


def email(choice, attr, cursor, database):
    email = input("Enter new email: ")
    if choice == 1:
        query = "UPDATE Registered_Customer SET EmailID = '%s' WHERE Username = '%s'" % (email, attr)
    elif choice == 2:
        query = "UPDATE Employee SET EmailID = '%s' WHERE EmployeeID = '%s'" % (email, attr)
    try:
        cursor.execute(query)
        database.commit()
        print("Email updated.\n")
    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)


def phone(choice, attr, cursor, database):
    phone = input("Enter new phone: ")
    if choice == 1:
        query = "UPDATE Registered_Customer SET Phone_Number = '%s' WHERE Username = '%s'" % (phone, attr)
    elif choice == 2:
        query = "UPDATE Employee SET Phone = '%s' WHERE EmployeeID = '%s'" % (phone, attr)
    try:
        cursor.execute(query)
        database.commit()
        print("Phone updated.\n")
    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)

def update_contact(op, cursor, database):
    os.system('clear')
    if op == 1:
        attr = input("Enter Username: ")
    elif op == 2:
        attr = input("Enter EmployeeID: ")

    print("1. Update email.")
    print("2. Update phone.")

    choice = int(input("Enter option: "))
    if choice == 1:
        email(op, attr, cursor, database)
    elif choice == 2:
        phone(op, attr, cursor, database)

def update_stock(cursor, database):
    os.system('clear')
    pid = input("Enter the productID: ")
    stock = int(input("Enter new stock: "))

    query = "UPDATE Product SET Stock = '%d' WHERE ProductID = '%s'" % (stock, pid)

    try:
        cursor.execute(query)
        database.commit()
        print("Stock Updated.\n")

    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)

def handle_update(cursor, database):
    os.system('clear')
    print("1. Update Customer details.\n")
    print("2. Update Employee details.\n")
    print("3. Update Product Stock.\n")
    print("Enter 0 to return.\n")

    u_choice = int(input("Enter your choice: "))
    if u_choice == 0:
        return;
    elif u_choice == 1:
        update_contact(1, cursor, database)
    elif u_choice == 2:
        update_contact(2, cursor, database)
    elif u_choice == 3:
        update_stock(cursor, database)

    temp = input("Press any key to continue...")


