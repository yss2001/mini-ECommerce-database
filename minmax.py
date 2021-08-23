import pymysql
import os

def cost_min(cursor, database):
    ptype = input("Enter Product type: ")
    laptop = 'laptop'
    phone = 'phone'
    camera = 'camera'
    smartwatch = 'smartwatch'
    tv = 'tv'

    if ptype.lower() == laptop:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Laptop WHERE Product.ProductID = Laptop.ProductID ORDER BY Product.Price ASC LIMIT 1;"
    elif ptype.lower() == phone:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Phone WHERE Product.ProductID = Phone.ProductID ORDER BY Product.Price ASC LIMIT 1;"
    elif ptype.lower() == camera:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Camera WHERE Product.ProductID = Camera.ProductID ORDER BY Product.Price ASC LIMIT 1;"
    elif ptype.lower() == smartwatch:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Smartwatch WHERE Product.ProductID = Smartwatch.ProductID ORDER BY Product.Price ASC LIMIT 1;"
    elif ptype.lower() == tv:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, TV WHERE Product.ProductID = TV.ProductID ORDER BY Product.Price ASC LIMIT 1;"

    print("Minimum-\n")
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        for record in result:
            print(record[0], "-", end = ' ')
            print(record[1], "\n")

    except Exception as e:
        print(e)
        print("Query Failed!\n")
        database.rollback()

def cost_max(cursor, database):
    ptype = input("Enter Product type: ")
    laptop = 'laptop'
    phone = 'phone'
    camera = 'camera'
    smartwatch = 'smartwatch'
    tv = 'tv'

    if ptype.lower() == laptop:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Laptop WHERE Product.ProductID = Laptop.ProductID ORDER BY Product.Price DESC LIMIT 1;"
    elif ptype.lower() == phone:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Phone WHERE Product.ProductID = Phone.ProductID ORDER BY Product.Price DESC LIMIT 1;"
    elif ptype.lower() == camera:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Camera WHERE Product.ProductID = Camera.ProductID ORDER BY Product.Price DESC LIMIT 1;"
    elif ptype.lower() == smartwatch:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, Smartwatch WHERE Product.ProductID = Smartwatch.ProductID ORDER BY Product.Price DESC LIMIT 1;"
    elif ptype.lower() == tv:
        query = "SELECT Product.Model_Name, Product.Price FROM Product, TV WHERE Product.ProductID = TV.ProductID ORDER BY Product.Price DESC LIMIT 1;"

    print("Maximum-\n")
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        for record in result:
            print(record[0], "-", end= ' ')
            print(record[1], "\n")

    except Exception as e:
        print(e)
        print("Query Failed!\n")
        database.rollback()

def handle_minmax(cursor, database):
    cost_min(cursor, database)
    cost_max(cursor, database)

    temp = input("Press any key to continue...")
