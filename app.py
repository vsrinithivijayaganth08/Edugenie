import streamlit as st
from google import genai

# --- 1. GEMINI SETUP (PUDHU LIBRARY - 100% WORKING) ---
try:
    client = genai.Client(api_key=st.secrets["GEMINI_API_KEY"])
except Exception as e:
    st.error(f"API Key error: {e}. Secrets la key correct ah irukka nu paaru.")
    st.stop()

# --- 2. WEBSITE UI ---
st.set_page_config(page_title="EduGenie", page_icon="🎓", layout="wide")
st.title("🎓 EduGenie")
st.write("Google Gemini Powered Learning Assistant - Tanglish la padikalam!")

with st.sidebar:
    st.header("⚙️ Settings")
    std = st.selectbox("Yaarukku explain pannanum?", ["6th Std Student", "10th Std Student", "12th Std Student", "College Student"])
    subject = st.selectbox("Enna subject?", ["General", "Science", "Maths", "Social", "Computer Science"])
    st.success("✅ App is Live!")
    if st.button("Chat-a clear pannu"):
        st.session_state.messages = []
        st.rerun()

# --- 3. CHAT HISTORY ---
if "messages" not in st.session_state:
    st.session_state.messages = []

for msg in st.session_state.messages:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

# --- 4. CHAT INPUT & AI RESPONSE ---
if prompt := st.chat_input("Un doubt enna? Ex: Photosynthesis na enna?"):
    # User message
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    
    # AI message
    with st.chat_message("assistant"):
        with st.spinner("Yosichitu irukken..."):
            try:
                full_prompt = f"You are EduGenie. Explain this for a {std} studying {subject}. Question: {prompt}. Explain in simple Tanglish (Tamil written in English + English mix). Use easy examples. Keep it short and fun."
                response = client.models.generate_content(
                    model="gemini-2.0-flash",
                    contents=full_prompt
                )
                answer = response.text
                st.markdown(answer)
                st.session_state.messages.append({"role": "assistant", "content": answer})
            except Exception as e:
                st.error(f"Error vanthuduchu da: {e}")
