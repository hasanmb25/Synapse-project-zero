import os
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_USER = os.getenv("DB_USER", "root")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_NAME = os.getenv("DB_NAME", "synapse_db")
DB_PORT = int(os.getenv("DB_PORT", 3306))

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY", "")

APP_TITLE = "Synapse Academic Workspace"
APP_ICON = "📚"