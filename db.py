import mysql.connector
from mysql.connector import pooling
import config

# Create connection pool to manage concurrent connections efficiently
try:
    db_pool = mysql.connector.pooling.MySQLConnectionPool(
        pool_name="synapse_pool",
        pool_size=5,
        pool_reset_session=True,
        host=config.DB_HOST,
        user=config.DB_USER,
        password=config.DB_PASSWORD,
        database=config.DB_NAME,
        port=config.DB_PORT
    )
except mysql.connector.Error as err:
    print(f"Error creating connection pool: {err}")
    db_pool = None

def get_connection():
    """Returns a connection from the pool."""
    if db_pool:
        return db_pool.get_connection()
    return None

def fetch_all(query: str, params: tuple = ()):
    """Executes SELECT queries and returns all matching rows as dictionaries."""
    conn = get_connection()
    if not conn:
        return []
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(query, params)
        result = cursor.fetchall()
        return result
    finally:
        cursor.close()
        conn.close()

def fetch_one(query: str, params: tuple = ()):
    """Executes SELECT queries and returns a single row as a dictionary."""
    conn = get_connection()
    if not conn:
        return None
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(query, params)
        result = cursor.fetchone()
        return result
    finally:
        cursor.close()
        conn.close()

def execute_query(query: str, params: tuple = ()):
    """Executes INSERT, UPDATE, or DELETE queries and commits transactions."""
    conn = get_connection()
    if not conn:
        return None
    cursor = conn.cursor()
    try:
        cursor.execute(query, params)
        conn.commit()
        last_id = cursor.lastrowid
        return last_id
    except mysql.connector.Error as err:
        conn.rollback()
        raise err
    finally:
        cursor.close()
        conn.close()