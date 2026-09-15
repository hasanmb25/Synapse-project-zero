import streamlit as st
import config
import auth

# Page setup
st.set_page_config(
    page_title=config.APP_TITLE,
    page_icon=config.APP_ICON,
    layout="centered"
)

# Initialize session state for user tracking
if "user" not in st.session_state:
    st.session_state["user"] = None

def logout():
    st.session_state["user"] = None
    st.rerun()

# -----------------------------------------------------------------------------
# LOGGED IN VIEW (Placeholder until Phase 4 Dashboard)
# -----------------------------------------------------------------------------
if st.session_state["user"]:
    user = st.session_state["user"]
    
    st.title(f"Welcome back, {user['name']}! 👋")
    st.success(f"Logged in as **{user['email']}**")
    
    st.json({
        "User ID": user["user_id"],
        "Department": user["department"],
        "Semester": user["semester"]
    })
    
    if st.button("Log Out", type="primary"):
        logout()

# -----------------------------------------------------------------------------
# AUTHENTICATION VIEW (Login / Register Tabs)
# -----------------------------------------------------------------------------
else:
    st.title(f"{config.APP_ICON} {config.APP_TITLE}")
    st.caption("Offline Academic Workspace for Computer Science Students")
    
    tab_login, tab_register = st.tabs(["🔒 Login", "📝 Register"])
    
    # --- LOGIN TAB ---
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
                    st.success("Login successful! Redirecting...")
                    st.rerun()
                else:
                    st.error(response)

    # --- REGISTER TAB ---
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