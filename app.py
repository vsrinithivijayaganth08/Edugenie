import streamlit as st
from google import genai

# PUDHU LIBRARY SETUP - AQ KEY KU IDHU DHAN WORK AAGUM
client = genai.Client(api_key=st.secrets["GEMINI_API_KEY"])

st.set_page_config(page_title="EduGenie", page_icon="🎓")
st.title("🎓 EduGenie - Ipo Live!")

if "messages" not in st.session_state:
    st.session_state.messages = []

for m in st.session_state.messages:
    with st.chat_message(m["role"]):
        st.markdown(m["content"])

if prompt := st.chat_input("Un doubt enna ketu?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    with st.chat_message("assistant"):
        try:
            response = client.models.generate_content(
                model="gemini-2.5-flash",
                contents=f"Explain in Tanglish for 10th std student: {prompt}"
            )
            ans = response.text
            st.markdown(ans)
            st.session_state.messages.append({"role": "assistant", "content": ans})
        except Exception as e:
            st.error(f"Error: {e}")
