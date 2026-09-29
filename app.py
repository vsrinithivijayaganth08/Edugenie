import streamlit as st
from google import genai
import time

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
        # PUDHU LIST - ONNU BUSY NA ADUTHATHU TRY PANNUM
        models_to_try = ["gemini-2.5-flash-lite", "gemini-3-flash-preview", "gemini-2.5-flash", "gemini-3.8-flash"]
        ans = None
        for model_name in models_to_try:
            try:
                response = client.models.generate_content(
                    model=model_name,
                    contents=f"You are EduGenie, explain in Tanglish (Tamil+English mix) for 10th std student: {prompt}"
                )
                ans = response.text
                break # answer vantha loop ah break pannu
            except Exception as e:
                if "503" in str(e) or "UNAVAILABLE" in str(e):
                    time.sleep(1)
                    continue
                else:
                    st.error(f"Error with {model_name}: {e}")
                    continue
        
        if ans:
            st.markdown(ans)
            st.session_state.messages.append({"role": "assistant", "content": ans})
        else:
            st.error("Dei server sema busy da! 1 min kalichu thirumba try pannu da!")
