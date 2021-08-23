import pymysql
import os
from insertion import *
from updation import *
from deletion import *
from search import *
from analysis1 import *
from analysis2 import *
from selection import *
from projection import *
from minmax import *
from dept_sum import *
os.system('clear')
username = input("Enter your username: ")
password = input("Enter your password: ")

try:
    database = pymysql.connect("localhost", username, password, "ESHOP")
    cursor = database.cursor()

    while 1:
        os.system('clear')
        print("1. Insert a record.\n")
        print("2. Update a record.\n")
        print("3. Delete a record.\n")
        print("4. Search a product.\n")
        print("5. Display records 1.\n")
        print("6. Display records 2.\n")
        print("7. Display maximum and minimum product costs.\n")
        print("8. Total Salaries of Employees in each Department.\n")
        print("9. Total number of orders by state.\n")
        print("10. Total orders for products, filtered by time.\n")
        print("Enter 0 to exit.\n")

        choice = int(input("Enter your choice: "))
        if choice == 0:
            database.close()
            break
        elif choice == 1:
            handle_insert(cursor, database)
        elif choice == 2:
            handle_update(cursor, database)
        elif choice == 3:
            handle_delete(cursor, database)
        elif choice == 4:
            handle_search(cursor, database)
        elif choice == 5:
            handle_select(cursor, database)
        elif choice == 6:
            handle_project(cursor, database)
        elif choice == 7:
            handle_minmax(cursor, database)
        elif choice == 8:
            dept_sum(cursor, database)
        elif choice == 9:
            handle_analysis1(cursor, database)
        elif choice == 10:
            handle_analysis2(cursor, database)

except Exception as e:
    print(e)

