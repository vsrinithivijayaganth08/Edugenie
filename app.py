import streamlit as st
import google.generativeai as genai

# GEMINI SETUP - Secrets la irundhu key edukkum
genai.configure(api_key=st.secrets["GEMINI_API_KEY"])
model = genai.GenerativeModel('gemini-1.5-flash')

# WEBSITE UI
st.set_page_config(page_title="EduGenie", page_icon="🎓")
st.title("🎓 EduGenie")
st.subheader("Google Gemini Powered Learning Assistant")

st.sidebar.header("Settings")
level = st.sidebar.selectbox("Yaarukku explain pannanum?",
["6th Std Student", "College Student", "Expert"])

# Chat
if "chat" not in st.session_state:
    st.session_state.chat = []

user_input = st.chat_input("Un doubt enna?")

if user_input:
    st.session_state.chat.append(("user", user_input))

    # AI ku anupura prompt
    prompt = f"You are EduGenie. Explain '{user_input}' for {level} level in simple steps. Use Tanglish if needed."

    response = model.generate_content(prompt)
    answer = response.text

    st.session_state.chat.append(("ai", answer))

# Chat history kaamikuthu
for role, msg in st.session_state.chat:
    if role == "user":
        st.chat_message("user").write(msg)
    else:
        st.chat_message("assistant").write(msg)
