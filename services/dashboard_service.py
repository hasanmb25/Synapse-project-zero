from db import get_db_connection

def get_dashboard_metrics(user_id: int) -> dict:
    """Fetch high-level KPI counts for the active user."""
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT COUNT(*) AS active_courses FROM courses WHERE user_id = %s", (user_id,))
    courses = cursor.fetchone()['active_courses']
    
    cursor.execute(
        """
        SELECT COUNT(*) AS pending_tasks
        FROM assignments a
        JOIN courses c ON c.course_id = a.course_id
        WHERE c.user_id = %s AND a.status NOT IN ('completed', 'submitted')
        """,
        (user_id,)
    )
    tasks = cursor.fetchone()['pending_tasks']
    
    cursor.execute(
        """
        SELECT COUNT(*) AS total_notes
        FROM notes n
        JOIN courses c ON c.course_id = n.course_id
        WHERE c.user_id = %s
        """,
        (user_id,)
    )
    notes = cursor.fetchone()['total_notes']
    
    cursor.close()
    conn.close()
    return {"courses": courses, "tasks": tasks, "notes": notes}

def get_upcoming_deadlines(user_id: int, limit: int = 5) -> list:
    """Fetch nearest upcoming tasks sorted by due date."""
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        """
        SELECT a.title, a.deadline AS due_date, a.priority, a.status
        FROM assignments a
        JOIN courses c ON c.course_id = a.course_id
        WHERE c.user_id = %s AND a.status NOT IN ('completed', 'submitted')
        ORDER BY a.deadline ASC LIMIT %s
        """,
        (user_id, limit)
    )
    tasks = cursor.fetchall()
    cursor.close()
    conn.close()
    return tasks