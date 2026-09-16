import streamlit as st
from services.dashboard_service import get_dashboard_metrics, get_upcoming_deadlines

def render_dashboard():
    user = st.session_state.get("user")
    st.title(f"⚡ Welcome back, {user['name']}!")
    
    # 1. Metric Header Row
    metrics = get_dashboard_metrics(user['user_id'])
    col1, col2, col3 = st.columns(3)
    col1.metric("Active Courses", metrics["courses"])
    col2.metric("Pending Tasks", metrics["tasks"])
    col3.metric("Total Notes", metrics["notes"])
    
    st.divider()
    
    # 2. Main Workspace Layout
    left_col, right_col = st.columns([2, 1])
    
    with left_col:
        st.subheader("📌 Upcoming Deadlines")
        deadlines = get_upcoming_deadlines(user['user_id'])
        if deadlines:
            for task in deadlines:
                st.info(f"**{task['title']}** — Due: `{task['due_date']}` | Priority: **{task['priority']}**")
        else:
            st.success("No pending deadlines. You're all caught up!")
            
    with right_col:
        st.subheader("🚀 Quick Actions")
        if st.button("➕ Add New Course", use_container_width=True):
            st.session_state.current_page = "courses"
            st.rerun()
        if st.button("📝 Create Note", use_container_width=True):
            st.session_state.current_page = "note_editor"
            st.rerun()