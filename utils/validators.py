import re
import hashlib

def is_valid_email(email: str) -> bool:
    """Checks if the email string follows standard email formatting."""
    pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
    return bool(re.match(pattern, email.strip()))

def hash_password(password: str) -> str:
    """Hashes plain text passwords using SHA-256 for secure storage."""
    return hashlib.sha256(password.encode('utf-8')).hexdigest()

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Compares a plain text password attempt against a stored SHA-256 hash."""
    return hash_password(plain_password) == hashed_password