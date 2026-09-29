import streamlit as st
from google import genai

client = genai.Client(api_key=st.secrets["GEMINI_API_KEY"])

st.set_page_config(page_title="EduGenie", page_icon="🎓")
st.title("🎓 EduGenie")
st.write("Google Gemini Powered Learning Assistant")

with st.sidebar:
    st.header("Settings")
    std = st.selectbox("Yaarukku explain pannanum?", ["6th Std Student", "10th Std Student", "College Student"])
    subject = st.selectbox("Enna subject?", ["General", "Science", "Maths", "Social"])

if "messages" not in st.session_state:
    st.session_state.messages = []

for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

if prompt := st.chat_input("Un doubt enna?"):
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    with st.chat_message("assistant"):
        full_prompt = f"Explain for a {std} in {subject}. Question: {prompt}. Explain in Tanglish simple ah."
        response = client.models.generate_content(model="gemini-2.0-flash", contents=full_prompt)
        st.markdown(response.text)
        st.session_state.messages.append({"role": "assistant", "content": response.text})
