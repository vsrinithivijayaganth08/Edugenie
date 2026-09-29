# ============================================================
# EDUGENIE: GOOGLE GEMINI POWERED LEARNING ASSISTANT
# ============================================================

print("=" * 65)
print("        EDUGENIE - GOOGLE GEMINI POWERED LEARNING ASSISTANT")
print("=" * 65)

student_name = input("\nEnter Student Name: ")

print("\nWelcome,", student_name + "!")
print("EduGenie is ready to assist you with your learning.\n")

while True:

    print("\n------------------- EDUGENIE MENU -------------------")
    print("1. Ask a Question")
    print("2. Get Study Tip")
    print("3. Take a Quick Quiz")
    print("4. Exit")
    print("------------------------------------------------------")

    choice = input("Enter your choice: ")

    # ---------------- ASK QUESTION ----------------
    if choice == "1":

        question = input("\nEnter your question: ").lower()

        if "artificial intelligence" in question or " ai" in question:
            answer = """
Artificial Intelligence (AI) is a technology that enables
computers to perform tasks that normally require human
intelligence, such as learning, reasoning and problem solving.
"""

        elif "machine learning" in question:
            answer = """
Machine Learning is a branch of Artificial Intelligence.
It allows computers to learn patterns from data and make
predictions or decisions without being explicitly programmed
for every task.
"""

        elif "python" in question:
            answer = """
Python is a high-level programming language known for its
simple syntax and readability. It is widely used in AI,
Machine Learning, Data Science and Web Development.
"""

        elif "gemini" in question:
            answer = """
Google Gemini is a family of AI models developed by Google.
It can understand and generate different types of information,
including text, images and code.
"""

        elif "database" in question:
            answer = """
A database is an organized collection of information.
It allows users to store, manage, retrieve and update data
efficiently.
"""

        else:
            answer = """
EduGenie could not find a specific answer in this demo.
In a real Google Gemini integration, the question would be
sent to the Gemini AI model to generate a suitable response.
"""

        print("\n🤖 EduGenie Answer:")
        print(answer)

    # ---------------- STUDY TIP ----------------
    elif choice == "2":

        print("\n📚 EduGenie Study Tip:")
        print("• Study one topic at a time.")
        print("• Make short notes for important concepts.")
        print("• Practice questions regularly.")
        print("• Take short breaks while studying.")
        print("• Revise the topic before moving to a new one.")

    # ---------------- QUIZ ----------------
    elif choice == "3":

        print("\n🧠 QUICK QUIZ")
        print("What does AI stand for?")
        print("A. Automated Internet")
        print("B. Artificial Intelligence")
        print("C. Advanced Information")
        print("D. Automatic Input")

        answer = input("\nEnter your answer (A/B/C/D): ").upper()

        if answer == "B":
            print("✅ Correct! Well done.")
        else:
            print("❌ Incorrect. The correct answer is B - Artificial Intelligence.")

    # ---------------- EXIT ----------------
    elif choice == "4":

        print("\nThank you for using EduGenie,",
              student_name + "!")
        print("Keep learning and keep growing! 🚀")
        break

    else:
        print("\n❌ Invalid choice. Please select 1, 2, 3 or 4.")

print("\nProgram Ended.")