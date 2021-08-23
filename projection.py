import pymysql
import os


def project_price(cursor, database):
    os.system('clear')
    try:
        upper = int(
            input("Enter the upperbound of the price range, enter 0 for no upper bound: "))
        lower = int(input(
            "Enter the lowerbound of the price range, enter 0 for least lower bound: "))
        if upper == 0:
            query = "SELECT ProductID, Model_Name, Price from Product where Price > %d" % lower
        else:
            query = ("SELECT ProductID, Model_Name, Price from Product where Price between %d and %d" % (
                lower, upper))

        cursor.execute(query)

        results = cursor.fetchall()

        print("ID\tName\t\tPrice\n")
        for row in results:
            prodID = row[0]
            name = row[1]
            price = row[2]
            print("%s\t%-8s\t%s\n" % (prodID, name, price))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def project_delivery(cursor, database):
    os.system('clear')
    try:
        cid = input("Enter the CompanyID for the delivery provider: ")
        query = "SELECT Phone, First_Name, Last_Name, Coordinated_By from Deliveryman where Works_For = '%s'" % cid

        cursor.execute(query)

        results = cursor.fetchall()

        print("Phone\tfirst\tLastname\tCoordinated by\n")
        for row in results:
            print("%s\t%s\t%-8s\t%s\n" % (row[0], row[1], row[2], row[3]))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def project_contract(cursor, database):
    os.system('clear')
    try:
        date_entry = input("Enter a date in YYYY-MM-DD format: ")
        reqyear, reqmonth, reqdate = map(int, date_entry.split('-'))

        query = ("Select * from Delivery_Provider_Contract where DATE_ADD(Last_Renewed_On, INTERVAL Contract_Length YEAR) < '%d-%d-%d'" %
                 (reqyear, reqmonth, reqdate))

        cursor.execute(query)

        results = cursor.fetchall()

        print("ID\tLength\tLast renewed\tPayment\tNo of Drivers\n")
        for row in results:
            print("%s\t%s\t%s\t%s\t%s\n" %
                  (row[0], row[1], row[2], row[3], row[4]))

        database.commit()
    except:
        print("Query failed!\n")
        database.rollback()


def handle_project(cursor, database):
    os.system('clear')
    print("1. Display products filtered by price range\n")
    print("2. Display delivery men belonging to a particular Delivery Provider\n")
    print("3. Display delivery providers who's contract expiry is before a particular date\n")
    print("Enter 0 to return\n")

    i_choice = int(input("Enter your choice: "))
    if i_choice == 0:
        return
    elif i_choice == 1:
        project_price(cursor, database)
    elif i_choice == 2:
        project_delivery(cursor, database)
    elif i_choice == 3:
        project_contract(cursor, database)

    temp = input("Press enter to continue...")
