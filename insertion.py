import pymysql
import os

def insert_customer(cursor, database):
    os.system('clear')
    try:
        record = {}
        record["uname"] = input("Enter username: ")
        record["fname"] = input("Enter First Name: ")
        record["lname"] = input("Enter Last Name: ")
        record["email"] = input("Enter email id: ")
        record["phone"] = input("Enter phone: ")
        record["dno"] = input("Enter Door Number: ")
        record["street"] = input("Enter Street: ")
        record["city"] = input("Enter City: ")
        record["state"] = input("Enter State: ")
        record["zipcode"] = input("Enter Zipcode: ")

        query = "INSERT INTO Registered_Customer VALUES('%s', '%s', '%s', '%s', '%s')" % (record["uname"], record["email"], record["phone"], record["fname"], record["lname"])

        cursor.execute(query)

        query = "INSERT INTO Registered_Customer_Shipping_Address VALUES('%s', '%s', '%s', '%s', '%s', '%s')" % (record["uname"], record["dno"], record["street"], record["city"], record["state"], record["zipcode"])

        cursor.execute(query)
        database.commit()
        print("User added.\n")
    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)

def insert_delivery_provider(cursor, database):
    os.system('clear')
    try:
        record = {}
        record["cid"] = input("Enter unique CompanyID: ")
        record["name"] = input("Enter Company Name: ")
        record["email"] = input("Enter email id: ")
        record["phone"] = input("Enter phone: ")
        record["dno"] = input("Enter Door Number: ")
        record["street"] = input("Enter Street: ")
        record["city"] = input("Enter City: ")
        record["state"] = input("Enter State: ")
        record["zipcode"] = input("Enter Zipcode: ")
        record["clength"] = int(input("Enter Contract Length: "))
        record["renew"] = input("Enter Last Renewed Date (YYYY-MM-DD):  ")
        record["pay"] = int(input("Enter payment: "))
        record["nod"] = int(input("Enter number of drivers: "))

        query1 = "INSERT INTO Delivery_Provider VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (record["cid"], record["name"], record["email"], record["phone"], record["dno"], record["street"], record["city"], record["state"], record["zipcode"])

        query2 = "INSERT INTO Delivery_Provider_Contract VALUES('%s', '%d', '%s', '%d', '%d')" % (record["cid"], record["clength"], record["renew"], record["pay"], record["nod"])

        cursor.execute(query1)
        cursor.execute(query2)
        database.commit()
        print("Delivery Provider Added.\n")
    except Exception as e:
        print("Query failed!\n")
        database.rollback()
        print(e)

def insert_product(cursor, database):
    os.system('clear')
    try:
        record = {}
        record["pid"] = input("Enter Unique Product ID: ")
        record["price"] = int(input("Enter price: "))
        record["mname"] = input("Enter Model Name: ")
        record["bname"] = input("Enter Brand Name: ")
        record["stock"] = int(input("Enter stock: "))

        query = "INSERT INTO Brand VALUES ('%s', '%s')" % (record["mname"], record["bname"])

        try:
            cursor.execute(query)
            query = "INSERT INTO Product VALUES ('%s', '%d', '%s', '%d')" % (record["pid"], record["price"], record["mname"], record["stock"])
            cursor.execute(query)
            database.commit()
        except Exception as e:
            print(e)
            database.rollback()

        print("1. Laptop\n")
        print("2. Phone\n")
        print("3. Smartwatch\n")
        print("4. TV\n")
        print("5. Camera\n")
        category = int(input("Enter category: "))

        if category == 1:
            laptop = {}
            laptop["ssize"] = float(input("Enter screen size: "))
            laptop["sto"] = int(input("Enter storage: "))
            laptop["res"] = input("Enter resolution: ")
            laptop["ram"] = int(input("Enter RAM: "))
            laptop["gpur"] = int(input("Enter GPU RAM: "))
            laptop["gpun"] = input("Enter GPU Name: ")
            laptop["proname"] = input("Enter Processor Name: ")
            laptop["proco"] = int(input("Enter Number of Processor Cores: "))
            laptop["prosp"] = float(input("Enter Processor Speed: "))

            ports = {}
            ports = (input("Enter space seperated ports: ")).split(' ')
            colours = {}
            colours = (input("Enter space seperated colours: ")).split(' ')

            query1 = "SELECT EXISTS (SELECT * FROM Processor WHERE Name = '%s')" % (laptop["proname"])

            try:
                cursor.execute(query1)
                exist = cursor.fetchone()
                for result in exist:
                    if result == 0:
                        query2 = "INSERT INTO Processor VALUES ('%s', '%d', '%f')" % (laptop["proname"], laptop["proco"], laptop["prosp"])
                        try:
                            cursor.execute(query2)
                            database.commit()
                        except Exception as e:
                            print(e)
                            print("oh")
                            database.rollback()

                query3 = "INSERT INTO Laptop VALUES ('%s', '%f', '%d', '%s', '%d', '%d', '%s', '%s')" % (record["pid"], laptop["ssize"], laptop["sto"], laptop["res"], laptop["ram"], laptop["gpur"], laptop["gpun"], laptop["proname"])

                try:
                    cursor.execute(query3)
                    database.commit()
                except Exception as e:
                    print(e)
                    print("3");
                    database.rollback()

                for port in ports:
                    query5 = "INSERT INTO Laptop_Ports VALUES ('%s', '%s')" % (record["pid"], port)
                    try:
                        cursor.execute(query5)
                        database.commit()
                    except Exception as e:
                        print(e)
                        print("4")
                        database.rollback()

                for colour in colours:
                    query6 = "INSERT INTO Product_Colours VALUES ('%s', '%s')" % (record["pid"], colour)
                    try:
                        cursor.execute(query6)
                        database.commit()
                    except Exception as e:
                        print(e)
                        database.rollback()
            except Exception as e:
                print(e)
                print("ug")
                database.rollback()

        elif category == 2:
            phone = {}
            phone["ssize"] = float(input("Enter screen size: "))
            phone["batt"] = int(input("Enter battery: "))
            phone["sto"] = int(input("Enter storage: "))
            phone["ram"] = int(input("Enter RAM: "))
            phone["proc"] = input("Enter Processor: ")
            phone["res"] = input("Enter resolution: ")

            cameras={}
            cameras = (input("Enter space seperated camera megapixels: ")).split(' ')
            colours={}
            colours = (input("Enter space seperated colours: ")). split(' ')

            query1 = "INSERT INTO Phone VALUES ('%s', '%f', '%d', '%d', '%d', '%s', '%s')" % (record["pid"], phone["ssize"], phone["batt"], phone["sto"], phone["ram"], phone["proc"], phone["res"])

            for camera in cameras:
                query2 = "INSERT INTO Phone_Cameras VALUES ('%s', '%d')" % (record["pid"], int(camera))
                try:
                    cursor.execute(query2)
                    database.commit()
                except Exception as e:
                    print(e)
                    database.rollback()

            for colour in colours:
                query3 = "INSERT INTO Product_Colours VALUES ('%s', '%s')" % (record["pid"], colour)
                try:
                    cursor.execute(query3)
                    database.commit()
                except Exception as e:
                    print(e)
                    database.rollback()

            try:
                cursor.execute(query1)
                database.commit()
            except Exception as e:
                print(e)
                database.rollback()

        elif category == 3:
            smartwatch={}
            smartwatch["ssize"] = float(input("Enter screen size: "))
            smartwatch["dust"] = int(input("Dust Resistant or Not (0 or 1): "))
            smartwatch["water"] = int(input("Water Resistant or Not (0 or 1): "))
            smartwatch["res"] = input("Enter resolution: ")
            smartwatch["strap"] = input("Enter strap colour: ")
            smartwatch["body"] = input("Enter body colour: ")

            query1 = "INSERT INTO Smartwatch VALUES ('%s', '%f', '%d', '%d', '%s', '%s', '%s')" % (record["pid"], smartwatch["ssize"], smartwatch["dust"], smartwatch["water"], smartwatch["res"], smartwatch["strap"], smartwatch["body"])

            try:
                cursor.execute(query1)
                database.commit()
            except Exception as e:
                print(e)
                database.rollback()

        elif category == 4:
            tv={}
            tv["ssize"] = float(input("Enter screen size: "))
            tv["smart"] = int(input("Smart TV or Not (0 or 1): "))
            tv["res"] = input("Enter resolution: ")
            tv["weight"] = int(input("Enter weight: "))

            query1 = "INSERT INTO TV VALUES ('%s', '%f', '%d', '%s', '%d')" % (record["pid"], tv["ssize"], tv["smart"], tv["res"], tv["weight"])

            try:
                cursor.execute(query1)
                database.commit()
            except Exception as e:
                print(e)
                database.rollback()

        elif category == 5:
            camera={}
            camera["sens"] = input("Enter sensor type: ")
            camera["mp"] = int(input("Enter megapixels: "))
            camera["emp"] = int(input("Enter effective megapixels: "))
            camera["focus"] = int(input("Manual Focus or Not (0 or 1): "))
            camera["batt"] = int(input("Enter Battery: "))
            camera["max"] = int(input("Enter maximum shutter speed: "))
            camera["min"] = int(input("Enter minimum shutter speed: "))

            query1 = "INSERT INTO Camera VALUES ('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d')" % (record["pid"], camera["sens"], camera["mp"], camera["emp"], camera["focus"], camera["batt"], camera["max"], camera["min"])

            try:
                cursor.execute(query1)
                database.commit()
            except Exception as e:
                print(e)
                database.rollback()

    except Exception as e:
        print("Query Failed!\n")
        print(e)
        database.rollback()

def insert_purchase_record(cursor, database):
    order = {}
    order["uname"] = input("Input username: ")
    print("User already made", end = ' ')

    query = "SELECT DISTINCT OrderID FROM `Order` WHERE Username = '%s' ORDER BY OrderID DESC LIMIT 1" % (order["uname"])

    o_num = 0

    try:
        num = cursor.execute(query)
        record = cursor.fetchone()
        if num == 0:
            print("0 orders. Enter details of OrderID 1.")
            o_num = 1
        else:
            for row in record:
                print(row, "orders. Enter details of OrderID", int(row)+1, "\n", end=' ')
                o_num = int(row)+1
    except Exception as e:
        print(e)
        database.rollback()

    order["date"] = input("Input order date: ")

    print("\nDeliverymen Phones:")

    query = "SELECT Phone FROM Deliveryman"

    try:
        cursor.execute(query)
        record = cursor.fetchall()
        for row in record:
            print(row[0])
    except Exception as e:
        print(e)
        database.rollback()

    print("\n")

    query = "SELECT ProductID, Model_Name FROM Product"

    print("\nAvailable products:")

    try:
        cursor.execute(query)
        record = cursor.fetchall()
        print("ProductID\tModelName")
        for row in record:
            print(row[0],"\t\t",  row[1])
    except Exception as e:
        print(e)
        database.rollback()


    n = int(input("Enter number of products ordered: "))

    for i in range(1, n+1):
        prod = (input("Enter Product " + str(i) + ": ")).upper()
        query = "SELECT * FROM Products_Sold_By WHERE ProductID ='%s'" % (prod)

        try:
            cursor.execute(query)
            record = cursor.fetchall()
            print("ProductID\tMerchant")
            for row in record:
                print(row[0],"\t\t", row[1])
        except Exception as e:
            print(e)
            database.rollback()

        merch = (input("Enter selling Merchant " + str(i) + ": " )).upper()
        phone = input("Enter deliveryman phone from the above list: ")

        try:
            query = "INSERT INTO `Order` VALUES ('%d', '%s', '%s', '%s', '%s')" % (o_num, order["uname"], prod, phone, merch)
            cursor.execute(query)
            query = "INSERT INTO Purchase_History_Products VALUES ('%s', '%s', '%d')" % (order["uname"], prod, o_num)
            cursor.execute(query)
            database.commit()
        except Exception as e:
            print(e)
            database.rollback()

    paid = float(input("Enter total amount paid: "))

    try:
        query = "INSERT INTO Purchase_History VALUES ('%s', '%d', '%f', '%s')" % (order["uname"], o_num, paid, order["date"])
        cursor.execute(query)
        database.commit()
        print("Order Information added!")
    except Exception as e:
        print(e)
        database.rollback()



def handle_insert(cursor, database):
    os.system('clear')
    print("1. Insert registration of customer.\n")
    print("2. Insert new delivery provider.\n")
    print("3. Insert new product.\n")
    print("4. Insert a record of purchase made by Customer. \n")
    print("Enter 0 to return.\n")

    i_choice = int(input("Enter your choice: "))
    if i_choice == 0:
        return
    elif i_choice == 1:
        insert_customer(cursor, database)
    elif i_choice == 2:
        insert_delivery_provider(cursor, database)
    elif i_choice == 3:
        insert_product(cursor, database)
    elif i_choice == 4:
        insert_purchase_record(cursor, database)

    temp = input("Press any key to continue...")
