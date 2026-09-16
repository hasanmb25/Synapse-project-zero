import streamlit as st
import config
import auth
from pages.dashboard import render_dashboard

# 1. PAGE CONFIGURATION (Must be the absolute first Streamlit execution)
st.set_page_config(
    page_title=config.APP_TITLE,
    page_icon=config.APP_ICON,
    layout="wide"
)

# 2. SESSION STATE INITIALIZATION
if "user" not in st.session_state:
    st.session_state["user"] = None

if "current_page" not in st.session_state:
    st.session_state["current_page"] = "dashboard"

# 3. AUTHENTICATION HELPERS
def logout():
    st.session_state["user"] = None
    st.session_state["current_page"] = "dashboard"
    st.rerun()

# 4. APP ROUTER & VIEW LOGIC
if not st.session_state["user"]:
    # --- LOGGED OUT VIEW (LOGIN / REGISTER) ---
    st.title(f"{config.APP_ICON} {config.APP_TITLE}")
    st.caption("Offline Academic Workspace for Computer Science Students")
    
    tab_login, tab_register = st.tabs(["🔒 Login", "📝 Register"])
    
    with tab_login:
        st.subheader("Login to your Workspace")
        with st.form("login_form", clear_on_submit=False):
            email = st.text_input("Email Address", placeholder="student@northsouth.edu")
            password = st.text_input("Password", type="password")
            submit_login = st.form_submit_button("Sign In", use_container_width=True)
            
            if submit_login:
                success, response = auth.login_user(email, password)
                if success:
                    st.session_state["user"] = response
                    st.session_state["current_page"] = "dashboard"
                    st.success("Login successful! Redirecting...")
                    st.rerun()
                else:
                    st.error(response)

    with tab_register:
        st.subheader("Create a New Account")
        with st.form("register_form", clear_on_submit=True):
            name = st.text_input("Full Name", placeholder="Hasan Ali")
            reg_email = st.text_input("Email Address", placeholder="hasan@northsouth.edu")
            reg_password = st.text_input("Password", type="password", help="Minimum 6 characters")
            semester = st.selectbox("Current Semester", ["Spring 2026", "Summer 2026", "Fall 2026"])
            department = st.selectbox("Department", ["CSE", "EEE", "CEE", "Other"])
            
            submit_register = st.form_submit_button("Create Account", use_container_width=True)
            
            if submit_register:
                success, message = auth.register_user(name, reg_email, reg_password, semester, department)
                if success:
                    st.success(message)
                else:
                    st.error(message)

else:
    # --- LOGGED IN VIEW (GLOBAL SIDEBAR + MAIN CONTENT) ---
    with st.sidebar:
        st.title(f"{config.APP_ICON} {config.APP_TITLE}")
        st.write(f"👤 **{st.session_state['user']['name']}**")
        st.caption(st.session_state['user']['email'])
        st.divider()
        
        # Sidebar Page Switches
        if st.button("⚡ Dashboard", use_container_width=True):
            st.session_state["current_page"] = "dashboard"
            st.rerun()
        if st.button("📚 Courses Workspace", use_container_width=True):
            st.session_state["current_page"] = "courses"
            st.rerun()
        if st.button("📝 Note Editor", use_container_width=True):
            st.session_state["current_page"] = "note_editor"
            st.rerun()
            
        st.divider()
        if st.button("🚪 Log Out", type="primary", use_container_width=True):
            logout()

    # Route Rendering Engine
    page = st.session_state["current_page"]
    
    if page == "dashboard":
        render_dashboard()
    elif page == "courses":
        st.title("📚 Courses Workspace (Phase 5)")
    elif page == "note_editor":
        st.title("📝 Note Editor (Phase 6)")
    else:
        render_dashboard()