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
        port=int(config.DB_PORT)  # Cast to int to prevent string port crashes
    )
except mysql.connector.Error as err:
    print(f"Error creating connection pool: {err}")
    db_pool = None

def get_connection():
    """Returns a connection from the pool."""
    if db_pool:
        return db_pool.get_connection()
    return None

def get_db_connection():
    """Returns a connection from the pool for service-layer callers."""
    return get_connection()

def fetch_all(query: str, params: tuple = ()):
    """Executes SELECT queries and returns all matching rows as dictionaries."""
    conn = get_connection()
    if not conn:
        return []
    try:
        # buffered=True prevents unread result state issues
        with conn.cursor(dictionary=True, buffered=True) as cursor:
            cursor.execute(query, params)
            return cursor.fetchall()
    finally:
        conn.close()

def fetch_one(query: str, params: tuple = ()):
    """Executes SELECT queries and returns a single row as a dictionary."""
    conn = get_connection()
    if not conn:
        return None
    try:
        # buffered=True clears remaining result stream so connection can safely return to pool
        with conn.cursor(dictionary=True, buffered=True) as cursor:
            cursor.execute(query, params)
            return cursor.fetchone()
    finally:
        conn.close()

def execute_query(query: str, params: tuple = ()):
    """Executes INSERT, UPDATE, or DELETE queries and commits transactions."""
    conn = get_connection()
    if not conn:
        return None
    try:
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            conn.commit()
            return cursor.lastrowid
    except mysql.connector.Error as err:
        conn.rollback()
        raise err
    finally:
        conn.close()