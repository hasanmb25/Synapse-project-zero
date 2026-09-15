import db
from utils.validators import hash_password, verify_password, is_valid_email

# Registration: Validate → Check existing user → Hash password → Store in database.


def register_user(name: str, email: str, password: str, semester: str = "", department: str = "") -> tuple[bool, str]:
    """Registers a new user into the database."""
    if not name.strip() or not email.strip() or not password.strip():
        return False, "All required fields must be filled."
    
    if not is_valid_email(email):
        return False, "Please enter a valid email address."
    
    if len(password) < 6:
        return False, "Password must be at least 6 characters long."
    
    existing_user = db.fetch_one("SELECT user_id FROM users WHERE email = %s;", (email.strip().lower(),))
    if existing_user:
        return False, "An account with this email already exists."
    
    hashed_pwd = hash_password(password)
    try:
        db.execute_query(
            """
            INSERT INTO users (name, email, password_hash, semester, department)
            VALUES (%s, %s, %s, %s, %s);
            """,
            (name.strip(), email.strip().lower(), hashed_pwd, semester.strip(), department.strip())
        )
        return True, "Account created successfully! You can now log in."
    except Exception as e:
        return False, f"Database error: {str(e)}"

# Login: Find user → Hash entered password → Compare hashes → Allow/deny login.

def login_user(email: str, password: str) -> tuple[bool, dict | str]:
    """Authenticates credentials and returns user details on success."""
    if not email.strip() or not password.strip():
        return False, "Email and password are required."
    
    user = db.fetch_one(
        "SELECT user_id, name, email, password_hash, semester, department FROM users WHERE email = %s;",
        (email.strip().lower(),)
    )
    
    if not user:
        return False, "No account found with this email."
    
    if verify_password(password, user["password_hash"]):
        del user["password_hash"]
        return True, user
    else:
        return False, "Incorrect password."

