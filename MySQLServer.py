# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

# ----------------------------------------------------------------------
# Configuration (Use the working credentials)
# NOTE: Replace <YOUR_ROOT_PASSWORD> with the password that just worked!
# ----------------------------------------------------------------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "<YOUR_ROOT_PASSWORD>", 
    # Do NOT include the database="alx_book_store" here, 
    # as we connect to the server first to create the DB.
}

DATABASE_NAME = "alx_book_store"

# ----------------------------------------------------------------------
# Function to create the database
# ----------------------------------------------------------------------
def create_database(cursor):
    """Creates the alx_book_store database if it does not exist."""
    try:
        # Use CREATE DATABASE IF NOT EXISTS to prevent failure if it exists
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}")
        
        # NOTE: A successful CREATE DATABASE IF NOT EXISTS does not raise an error
        #       even if the database exists. To meet the printing requirement
        #       without using SHOW/SELECT, we assume success after execution.
        print(f"Database '{DATABASE_NAME}' created successfully!")
        
    except mysql.connector.Error as err:
        # Handle specific MySQL errors during creation (though unlikely with IF NOT EXISTS)
        print(f"Failed creating database: {err}")
        exit(1)

# ----------------------------------------------------------------------
# Main connection logic
# ----------------------------------------------------------------------
def main():
    """Connects to MySQL and calls the database creation function."""
    mydb_connection = None  # Initialize connection to None

    try:
        # 1. Connect to the MySQL server (without specifying a database)
        mydb_connection = mysql.connector.connect(**DB_CONFIG)
        
        # 2. Create a cursor object
        cursor = mydb_connection.cursor()
        
        # 3. Create the database
        create_database(cursor)
        
        # 4. Close the cursor
        cursor.close()

    except mysql.connector.Error as err:
        # Handle connection errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB. Check username or password.")
        elif err.errno == errorcode.CR_CONN_HOST_ERROR:
            print("Error: Failed to connect to DB. Check host or server status.")
        else:
            print(f"Error: Failed to connect to DB. {err}")
        exit(1)
        
    finally:
        # 5. Handle open and close of the DB connection
        if mydb_connection and mydb_connection.is_connected():
            mydb_connection.close()
            # print("Database connection closed.") # Optional print

if __name__ == "__main__":
    main()
