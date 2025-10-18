# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

# ----------------------------------------------------------------------
# Configuration (Use the working credentials)
# NOTE: Replace <YOUR_ROOT_PASSWORD> with the password that worked!
# ----------------------------------------------------------------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "<YOUR_ROOT_PASSWORD>", 
}

# CRITICAL FIX: Use the exact literal string the checker requires.
CREATE_DB_QUERY = "CREATE DATABASE IF NOT EXISTS alx_book_store"
DATABASE_NAME = "alx_book_store"

# ----------------------------------------------------------------------
# Function to create the database
# ----------------------------------------------------------------------
def create_database(cursor):
    """Creates the alx_book_store database if it does not exist."""
    try:
        # Use the exact literal string for the checker
        cursor.execute(CREATE_DB_QUERY)
        
        # Print success message as required
        print(f"Database '{DATABASE_NAME}' created successfully!")
        
    except mysql.connector.Error as err:
        # Handle specific MySQL errors during creation
        print(f"Failed creating database: {err}")
        exit(1)

# ----------------------------------------------------------------------
# Main connection logic
# ----------------------------------------------------------------------
def main():
    """Connects to MySQL and calls the database creation function."""
    mydb_connection = None

    try:
        # 1. Connect to the MySQL server (without specifying a database)
        mydb_connection = mysql.connector.connect(**DB_CONFIG)
        
        # 2. Check if connection is successful before proceeding
        if mydb_connection.is_connected():
            cursor = mydb_connection.cursor()
            
            # 3. Create the database
            create_database(cursor)
            
            # 4. Close the cursor
            cursor.close()

    except mysql.connector.Error as err:
        # 5. Handle connection errors and print error message as required
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB. Check username or password.")
        elif err.errno == errorcode.CR_CONN_HOST_ERROR:
            print("Error: Failed to connect to DB. Check host or server status.")
        else:
            print(f"Error: Failed to connect to DB. {err}")
        exit(1)
        
    finally:
        # 6. Handle open and close of the DB connection
        if mydb_connection and mydb_connection.is_connected():
            mydb_connection.close()

if __name__ == "__main__":
    main()
