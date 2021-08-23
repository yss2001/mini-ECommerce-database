import pymysql
import os


def retrieve_empfromdept(cursor, database):
    os.system('clear')
    try:
        deptwanted = int(input("Enter the Department of the employees\n"))
        query = "SELECT * from Employee where Works_For_Office = %d" % deptwanted
        cursor.execute(query)

        results = cursor.fetchall()
        print("ID        first     last name sex       supervisorphone     email               salary    door      street    city      state     zipcode   dob\n")
        for row in results:
            print("%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s%-10s\n" %
                  (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11], row[12], row[13], row[14]))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def retrieve_delivery_provider(cursor, database):
    os.system('clear')
    try:
        query = "SELECT * from Delivery_Provider"
        cursor.execute(query)

        results = cursor.fetchall()
        print("ID\tLength    EmailID\tPhone     Door\tStreet\tCity\tState\tZipcode\n")
        for row in results:
            print("%s\t%-10s%s\t%-10s%s\t%s\t%s\t%s\t%s\n" %
                  (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8]))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def retrieve_regcust(cursor, database):
    os.system('clear')
    try:
        query = "SELECT * from Registered_Customer"
        cursor.execute(query)

        results = cursor.fetchall()
        print("Usrname EmailID\t\tPhone\tFirst\tLast name\n")
        for row in results:
            CompanyID = row[0]
            Contract_Length = row[1]
            Last_renewed_On = row[2]
            Payment = row[3]
            Number_Of_Drivers = row[4]
            print("%s\t%s\t%s\t%s\t%s\n" %
                  (CompanyID, Contract_Length, Last_renewed_On, Payment, Number_Of_Drivers))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def retrieve_merchant(cursor, database):
    os.system('clear')
    try:
        query = "SELECT * from Merchant"
        cursor.execute(query)

        results = cursor.fetchall()
        print("ID\tName\t\tBank\t\tEmailID\t\tDoor\tStreet\tCity\tState\tZipcode\tPhone\n")
        for row in results:
            print("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" %
                  (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def retrieve_product(cursor, database):
    os.system('clear')
    try:
        query = "SELECT * from Product"
        cursor.execute(query)

        results = cursor.fetchall()
        print("ID\tPrice\tName\t\tStock\n")
        for row in results:
            CompanyID = row[0]
            Contract_Length = row[1]
            Last_renewed_On = row[2]
            Payment = row[3]
            print("%s\t%s\t%-8s\t%s\n" %
                  (CompanyID, Contract_Length, Last_renewed_On, Payment))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def handle_select(cursor, database):
    os.system('clear')
    print("  1. Retrieve all employees from some department\n")
    print("  2. Retrieve all contracts of Delivery Providers\n")
    print("  3. Retrieve all Registered Customers\n")
    print("  4. Retrieve all Merchants\n")
    print("  5. Retrieve all Products\n")
    print("Enter 0 to return\n")

    i_choice = int(input("Enter your choice: "))
    if i_choice == 0:
        return
    elif i_choice == 1:
        retrieve_empfromdept(cursor, database)
    elif i_choice == 2:
        retrieve_delivery_provider(cursor, database)
    elif i_choice == 3:
        retrieve_regcust(cursor, database)
    elif i_choice == 4:
        retrieve_merchant(cursor, database)
    elif i_choice == 5:
        retrieve_product(cursor, database)

    temp = input("Press enter to continue...")
