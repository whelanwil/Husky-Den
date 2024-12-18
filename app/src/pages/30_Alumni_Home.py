import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

# Show appropriate sidebar links for the role of the currently logged-in user
SideBarLinks()

st.title(f"Welcome Alumni, {st.session_state['first_name']}!")
st.write('')
st.write('### What would you like to do today?')

# Button to edit apartment details (alumni-specific)
if st.button('Edit Apartment Details', 
             type='primary', 
             use_container_width=True):
    st.switch_page('pages/30_Edit_Alumni_Housing.py')  # Alumni-specific page

if st.button('Connected Students', 
             type='primary', 
             use_container_width=True):
    st.switch_page('pages/31_Connect_To_Students.py')  # Shared page


