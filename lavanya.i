<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LearnMate AI — Gemini Learning Assistant</title>

  <style>
    :root {
      --bg: #f7f8fc;
      --card: #ffffff;
      --text: #172033;
      --muted: #6f7890;
      --primary: #6c63ff;
      --primary-dark: #5148e8;
      --secondary: #eaf0ff;
      --border: #e5e8f0;
      --green: #22a06b;
      --orange: #f59e0b;
      --red: #ef4444;
      --shadow: 0 12px 35px rgba(31, 41, 55, 0.08);
      --radius: 20px;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: Inter, ui-sans-serif, system-ui, -apple-system,
        BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: var(--bg);
      color: var(--text);
    }

    button,
    input,
    textarea {
      font: inherit;
    }

    button {
      cursor: pointer;
      border: none;
    }

    .app {
      display: flex;
      min-height: 100vh;
    }

    /* SIDEBAR */
    .sidebar {
      width: 255px;
      background: #fff;
      border-right: 1px solid var(--border);
      padding: 25px 16px;
      position: fixed;
      left: 0;
      top: 0;
      bottom: 0;
      z-index: 100;
    }

    .logo {
      display: flex;
      align-items: center;
      gap: 11px;
      padding: 5px 12px 30px;
      font-size: 20px;
      font-weight: 800;
    }

    .logo-icon {
      width: 38px;
      height: 38px;
      border-radius: 12px;
      background: linear-gradient(135deg, #6c63ff, #9c7cff);
      display: grid;
      place-items: center;
      color: white;
      font-size: 20px;
      box-shadow: 0 7px 18px rgba(108, 99, 255, 0.3);
    }

    .gemini-badge {
      color: var(--primary);
      font-size: 10px;
      margin-left: auto;
      font-weight: 700;
    }

    .nav-title {
      color: #9aa2b2;
      text-transform: uppercase;
      font-size: 10px;
      letter-spacing: 1.3px;
      padding: 0 13px 9px;
    }

    .nav-item {
      width: 100%;
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 14px;
      border-radius: 12px;
      background: transparent;
      color: #697287;
      margin-bottom: 4px;
      text-align: left;
      transition: .2s;
    }

    .nav-item:hover,
    .nav-item.active {
      background: #f0efff;
      color: var(--primary);
      font-weight: 700;
    }

    .nav-icon {
      width: 20px;
      text-align: center;
    }

    .sidebar-bottom {
      position: absolute;
      bottom: 22px;
      left: 16px;
      right: 16px;
    }

    .user-card {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px;
      background: #f7f7fb;
      border-radius: 14px;
    }

    .avatar {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background: linear-gradient(135deg, #ffb86c, #ff6b9a);
      color: white;
      display: grid;
      place-items: center;
      font-weight: 800;
    }

    .user-name {
      font-size: 13px;
      font-weight: 700;
    }

    .user-plan {
      font-size: 11px;
      color: var(--muted);
    }

    /* MAIN */
    .main {
      margin-left: 255px;
      width: calc(100% - 255px);
      padding: 30px 35px;
    }

    .mobile-menu {
      display: none;
    }

    .topbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 28px;
    }

    .welcome h1 {
      font-size: 28px;
      margin-bottom: 5px;
    }

    .welcome p {
      color: var(--muted);
      font-size: 14px;
    }

    .top-actions {
      display: flex;
      gap: 10px;
    }

    .icon-btn {
      width: 42px;
      height: 42px;
      border-radius: 12px;
      background: white;
      border: 1px solid var(--border);
      color: #697287;
    }

    /* HERO */
    .hero {
      background:
        radial-gradient(circle at 85% 20%, rgba(157, 126, 255, .5), transparent 30%),
        linear-gradient(135deg, #5148e8, #7968ff 55%, #9b7cff);
      border-radius: 25px;
      color: white;
      padding: 30px;
      min-height: 220px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 15px 35px rgba(92, 76, 225, .22);
      margin-bottom: 25px;
    }

    .hero-content {
      position: relative;
      z-index: 2;
      max-width: 650px;
    }

    .hero-label {
      display: inline-flex;
      gap: 7px;
      align-items: center;
      background: rgba(255,255,255,.16);
      padding: 7px 12px;
      border-radius: 30px;
      font-size: 12px;
      margin-bottom: 17px;
    }

    .hero h2 {
      font-size: 30px;
      margin-bottom: 10px;
    }

    .hero p {
      color: rgba(255,255,255,.82);
      max-width: 550px;
      line-height: 1.6;
      font-size: 14px;
    }

    .hero-orb {
      position: absolute;
      right: 40px;
      top: 30px;
      width: 170px;
      height: 170px;
      border-radius: 50%;
      border: 1px solid rgba(255,255,255,.22);
      box-shadow:
        0 0 0 25px rgba(255,255,255,.04),
        0 0 0 55px rgba(255,255,255,.025);
    }

    /* STATS */
    .stats {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin-bottom: 25px;
    }

    .stat-card {
      background: var(--card);
      border: 1px solid var(--border);
      padding: 20px;
      border-radius: var(--radius);
      box-shadow: 0 5px 20px rgba(20,30,60,.03);
    }

    .stat-top {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
    }

    .stat-icon {
      width: 39px;
      height: 39px;
      border-radius: 11px;
      display: grid;
      place-items: center;
      background: #f0efff;
      color: var(--primary);
    }

    .stat-value {
      font-size: 24px;
      font-weight: 800;
    }

    .stat-label {
      font-size: 12px;
      color: var(--muted);
      margin-top: 3px;
    }

    .stat-change {
      font-size: 11px;
      color: var(--green);
      background: #eafaf3;
      padding: 4px 7px;
      border-radius: 8px;
    }

    /* GRID */
    .content-grid {
      display: grid;
      grid-template-columns: 1.55fr 1fr;
      gap: 20px;
    }

    .card {
      background: white;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      padding: 22px;
      box-shadow: 0 5px 20px rgba(20,30,60,.03);
    }

    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 18px;
    }

    .card-header h3 {
      font-size: 16px;
    }

    .card-header a {
      color: var(--primary);
      font-size: 12px;
      cursor: pointer;
      font-weight: 700;
    }

    /* QUICK TOOLS */
    .tools {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 12px;
    }

    .tool {
      border: 1px solid var(--border);
      background: #fff;
      border-radius: 15px;
      padding: 15px;
      text-align: left;
      transition: .2s;
    }

    .tool:hover {
      transform: translateY(-2px);
      border-color: #cfcaff;
      box-shadow: var(--shadow);
    }

    .tool-icon {
      width: 37px;
      height: 37px;
      border-radius: 10px;
      display: grid;
      place-items: center;
      background: #f1f0ff;
      margin-bottom: 10px;
      font-size: 17px;
    }

    .tool-title {
      font-weight: 700;
      font-size: 13px;
      margin-bottom: 4px;
    }

    .tool-text {
      color: var(--muted);
      font-size: 11px;
      line-height: 1.4;
    }

    /* COURSES */
    .course {
      margin-bottom: 17px;
    }

    .course:last-child {
      margin-bottom: 0;
    }

    .course-top {
      display: flex;
      justify-content: space-between;
      margin-bottom: 8px;
    }

    .course-name {
      font-size: 13px;
      font-weight: 700;
    }

    .course-percent {
      color: var(--muted);
      font-size: 11px;
    }

    .progress {
      height: 7px;
      background: #edf0f5;
      border-radius: 10px;
      overflow: hidden;
    }

    .progress-bar {
      height: 100%;
      border-radius: inherit;
      background: linear-gradient(90deg, #6c63ff, #9c7cff);
    }

    /* CHAT */
    .chat-section {
      margin-top: 20px;
    }

    .chat-window {
      height: 360px;
      overflow-y: auto;
      padding: 5px 5px 15px;
    }

    .message {
      display: flex;
      gap: 10px;
      margin-bottom: 17px;
      max-width: 85%;
    }

    .message.user {
      margin-left: auto;
      flex-direction: row-reverse;
    }

    .message-avatar {
      flex: 0 0 34px;
      height: 34px;
      border-radius: 10px;
      display: grid;
      place-items: center;
      font-size: 14px;
    }

    .ai-avatar {
      background: linear-gradient(135deg, #6c63ff, #a083ff);
      color: white;
    }

    .user-avatar {
      background: #ffe5c9;
    }

    .bubble {
      background: #f4f5f9;
      padding: 12px 15px;
      border-radius: 5px 16px 16px 16px;
      font-size: 13px;
      line-height: 1.6;
      color: #4c566d;
    }

    .message.user .bubble {
      background: var(--primary);
      color: white;
      border-radius: 16px 5px 16px 16px;
    }

    .chat-input {
      display: flex;
      gap: 10px;
      border-top: 1px solid var(--border);
      padding-top: 15px;
    }

    .chat-input input {
      flex: 1;
      border: 1px solid var(--border);
      border-radius: 13px;
      padding: 13px 15px;
      outline: none;
      color: var(--text);
    }

    .chat-input input:focus {
      border-color: var(--primary);
    }

    .send-btn {
      width: 48px;
      border-radius: 13px;
      background: var(--primary);
      color: white;
      font-size: 18px;
    }

    .send-btn:hover {
      background: var(--primary-dark);
    }

    /* MODAL */
    .modal-overlay {
      display: none;
      position: fixed;
      inset: 0;
      background: rgba(15, 20, 40, .55);
      z-index: 1000;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .modal-overlay.show {
      display: flex;
    }

    .modal {
      background: white;
      width: 100%;
      max-width: 620px;
      border-radius: 24px;
      padding: 25px;
      box-shadow: 0 25px 70px rgba(0,0,0,.2);
      animation: modalIn .2s ease;
    }

    @keyframes modalIn {
      from {
        opacity: 0;
        transform: translateY(15px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .modal-header {
      display: flex;
      justify-content: space-between;
      margin-bottom: 18px;
    }

    .close {
      background: #f1f2f6;
      width: 35px;
      height: 35px;
      border-radius: 10px;
    }

    .modal textarea {
      width: 100%;
      min-height: 130px;
      resize: vertical;
      border: 1px solid var(--border);
      border-radius: 14px;
      padding: 14px;
      outline: none;
      margin: 10px 0 15px;
    }

    .primary-btn {
      padding: 12px 18px;
      border-radius: 12px;
      background: var(--primary);
      color: white;
      font-weight: 700;
    }

    .primary-btn:hover {
      background: var(--primary-dark);
    }

    .result {
      background: #f7f7fb;
      border-radius: 14px;
      padding: 16px;
      margin-top: 15px;
      white-space: pre-wrap;
      line-height: 1.6;
      font-size: 13px;
      max-height: 300px;
      overflow-y: auto;
    }

    /* RESPONSIVE */
    @media (max-width: 1050px) {
      .stats {
        grid-template-columns: repeat(2, 1fr);
      }

      .content-grid {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 760px) {
      .sidebar {
        transform: translateX(-100%);
        transition: .25s;
      }

      .sidebar.open {
        transform: translateX(0);
      }

      .main {
        margin-left: 0;
        width: 100%;
        padding: 20px 15px;
      }

      .mobile-menu {
        display: grid;
        place-items: center;
        width: 40px;
        height: 40px;
        background: white;
        border: 1px solid var(--border);
        border-radius: 10px;
      }

      .topbar {
        gap: 12px;
      }

      .welcome {
        flex: 1;
      }

      .welcome h1 {
        font-size: 20px;
      }

      .hero {
        padding: 23px;
      }

      .hero h2 {
        font-size: 23px;
      }

      .hero-orb {
        opacity: .25;
        right: -40px;
      }

      .stats {
        grid-template-columns: 1fr 1fr;
        gap: 10px;
      }

      .stat-card {
        padding: 15px;
      }

      .stat-value {
        font-size: 20px;
      }

      .tools {
        grid-template-columns: 1fr 1fr;
      }
    }

    @media (max-width: 450px) {
      .stats {
        grid-template-columns: 1fr;
      }

      .tools {
        grid-template-columns: 1fr;
      }

      .top-actions {
        display: none;
      }
    }
  </style>
</head>

<body>

<div class="app">

  <!-- SIDEBAR -->
  <aside class="sidebar" id="sidebar">

    <div class="logo">
      <div class="logo-icon">✦</div>
      <span>LearnMate</span>
      <span class="gemini-badge">AI</span>
    </div>

    <div class="nav-title">Workspace</div>

    <button class="nav-item active" onclick="switchPage('Dashboard')">
      <span class="nav-icon">⌂</span>
      Dashboard
    </button>

    <button class="nav-item" onclick="switchPage('AI Tutor')">
      <span class="nav-icon">✦</span>
      AI Tutor
    </button>

    <button class="nav-item" onclick="switchPage('Courses')">
      <span class="nav-icon">▣</span>
      My Courses
    </button>

    <button class="nav-item" onclick="switchPage('Quiz')">
      <span class="nav-icon">✓</span>
      AI Quiz
    </button>

    <button class="nav-item" onclick="switchPage('Notes')">
      <span class="nav-icon">▤</span>
      Smart Notes
    </button>

    <button class="nav-item" onclick="switchPage('Progress')">
      <span class="nav-icon">◔</span>
      Progress
    </button>

    <div class="nav-title" style="margin-top:25px;">Account</div>

    <button class="nav-item" onclick="showSettings()">
      <span class="nav-icon">⚙</span>
      Settings
    </button>

    <div class="sidebar-bottom">
      <div class="user-card">
        <div class="avatar">S</div>
        <div>
          <div class="user-name">Student</div>
          <div class="user-plan">Free Plan</div>
        </div>
      </div>
    </div>

  </aside>

  <!-- MAIN -->
  <main class="main">

    <div class="topbar">

      <button class="mobile-menu" onclick="toggleSidebar()">☰</button>

      <div class="welcome">
        <h1>Good afternoon 👋</h1>
        <p>Ready to continue your learning journey?</p>
      </div>

      <div class="top-actions">
        <button class="icon-btn" title="Notifications">♧</button>
        <button class="icon-btn" onclick="showSettings()" title="Settings">⚙</button>
      </div>

    </div>

    <!-- HERO -->
    <section class="hero">
      <div class="hero-content">
        <div class="hero-label">
          ✦ Gemini-powered learning
        </div>

        <h2>Your personal AI tutor.</h2>

        <p>
          Ask questions, understand difficult concepts, generate quizzes,
          summarize your notes and build a personalized study plan.
        </p>

        <button
          class="primary-btn"
          style="margin-top:18px;background:white;color:#5c50e8;"
          onclick="focusChat()">
          Start Learning →
        </button>
      </div>

      <div class="hero-orb"></div>
    </section>

    <!-- STATS -->
    <section class="stats">

      <div class="stat-card">
        <div class="stat-top">
          <div class="stat-icon">◷</div>
          <span class="stat-change">+12%</span>
        </div>
        <div class="stat-value">18.5h</div>
        <div class="stat-label">Study time this week</div>
      </div>

      <div class="stat-card">
        <div class="stat-top">
          <div class="stat-icon">✓</div>
          <span class="stat-change">+8%</span>
        </div>
        <div class="stat-value">86%</div>
        <div class="stat-label">Average quiz score</div>
      </div>

      <div class="stat-card">
        <div class="stat-top">
          <div class="stat-icon">🔥</div>
          <span class="stat-change">Active</span>
        </div>
        <div class="stat-value">12 days</div>
        <div class="stat-label">Learning streak</div>
      </div>

      <div class="stat-card">
        <div class="stat-top">
          <div class="stat-icon">★</div>
          <span class="stat-change">+24</span>
        </div>
        <div class="stat-value">742</div>
        <div class="stat-label">Learning points</div>
      </div>

    </section>

    <!-- CONTENT -->
    <section class="content-grid">

      <!-- LEFT -->
      <div>

        <div class="card">

          <div class="card-header">
            <h3>AI Learning Tools</h3>
            <a onclick="openTool('Explain a Topic')">View all</a>
          </div>

          <div class="tools">

            <button class="tool" onclick="openTool('Explain a Topic')">
              <div class="tool-icon">💡</div>
              <div class="tool-title">Explain a Topic</div>
              <div class="tool-text">
                Get simple explanations for difficult concepts.
              </div>
            </button>

            <button class="tool" onclick="openTool('Generate Quiz')">
              <div class="tool-icon">🧠</div>
              <div class="tool-title">Generate Quiz</div>
              <div class="tool-text">
                Create practice questions from any topic.
              </div>
            </button>

            <button class="tool" onclick="openTool('Summarize Notes')">
              <div class="tool-icon">📝</div>
              <div class="tool-title">Summarize Notes</div>
              <div class="tool-text">
                Turn long notes into useful study summaries.
              </div>
            </button>

            <button class="tool" onclick="openTool('Study Plan')">
              <div class="tool-icon">📅</div>
              <div class="tool-title">Study Plan</div>
              <div class="tool-text">
                Build a personalized study schedule.
              </div>
            </button>

          </div>

        </div>

        <!-- CHAT -->
        <div class="card chat-section" id="chatSection">

          <div class="card-header">
            <h3>✦ Ask your AI Tutor</h3>
            <a onclick="clearChat()">Clear chat</a>
          </div>

          <div class="chat-window" id="chatWindow">

            <div class="message">
              <div class="message-avatar ai-avatar">✦</div>

              <div class="bubble">
                Hi! I'm your AI learning assistant. Ask me anything
                about your studies and I'll explain it step by step.
              </div>
            </div>

            <div class="message">
              <div class="message-avatar ai-avatar">✦</div>

              <div class="bubble">
                For example, you can ask:
                <br><br>
                <b>"Explain photosynthesis like I'm 12."</b>
              </div>
            </div>

          </div>

          <div class="chat-input">
            <input
              id="chatInput"
              type="text"
              placeholder="Ask anything about your studies..."
              onkeydown="handleEnter(event)"
            />

            <button class="send-btn" onclick="sendMessage()">➤</button>
          </div>

        </div>

      </div>

      <!-- RIGHT -->
      <div>

        <div class="card">

          <div class="card-header">
            <h3>Continue Learning</h3>
            <a onclick="switchPage('Courses')">See all</a>
          </div>

          <div class="course">

            <div class="course-top">
              <span class="course-name">Mathematics</span>
              <span class="course-percent">72%</span>
            </div>

            <div class="progress">
              <div class="progress-bar" style="width:72%"></div>
            </div>

          </div>

          <div class="course">

            <div class="course-top">
              <span class="course-name">Physics</span>
              <span class="course-percent">54%</span>
            </div>

            <div class="progress">
              <div class="progress-bar" style="width:54%"></div>
            </div>

          </div>

          <div class="course">

            <div class="course-top">
              <span class="course-name">Computer Science</span>
              <span class="course-percent">81%</span>
            </div>

            <div class="progress">
              <div class="progress-bar" style="width:81%"></div>
            </div>

          </div>

          <div class="course">

            <div class="course-top">
              <span class="course-name">English</span>
              <span class="course-percent">46%</span>
            </div>

            <div class="progress">
              <div class="progress-bar" style="width:46%"></div>
            </div>

          </div>

        </div>

        <div class="card" style="margin-top:20px;">

          <div class="card-header">
            <h3>Today's Goal</h3>
            <span style="font-size:20px;">🎯</span>
          </div>

          <div style="text-align:center;padding:8px 0 5px;">

            <div style="
              width:120px;
              height:120px;
              margin:auto;
              border-radius:50%;
              background:conic-gradient(#6c63ff 72%,#edf0f5 0);
              display:grid;
              place-items:center;
            ">

              <div style="
                width:92px;
                height:92px;
                background:white;
                border-radius:50%;
                display:grid;
                place-items:center;
                font-weight:800;
                font-size:20px;
              ">
                72%
              </div>

            </div>

            <p style="
              margin-top:14px;
              font-size:13px;
              color:var(--muted);
            ">
              36 of 50 minutes completed
            </p>

          </div>

        </div>

      </div>

    </section>

  </main>
</div>

<!-- TOOL MODAL -->
<div class="modal-overlay" id="toolModal">

  <div class="modal">

    <div class="modal-header">

      <div>
        <h2 id="modalTitle">AI Learning Tool</h2>
        <p id="modalSubtitle"
           style="color:var(--muted);font-size:12px;margin-top:4px;">
          Powered by Gemini
        </p>
      </div>

      <button class="close" onclick="closeModal()">✕</button>

    </div>

    <textarea
      id="toolInput"
      placeholder="Enter a topic, question, or notes..."
    ></textarea>

    <button class="primary-btn" onclick="runTool()">
      Generate with AI ✦
    </button>

    <div class="result" id="toolResult" style="display:none;"></div>

  </div>

</div>

<script>
  /*
   * ============================================================
   * LEARNMATE AI
   * Gemini-powered learning assistant frontend
   *
   * IMPORTANT:
   * Do NOT put a production Gemini API key directly in this file.
   * Use a backend endpoint such as:
   *
   * POST /api/gemini
   *
   * Your backend should securely store the Gemini API key.
   * ============================================================
   */

  let currentTool = "Explain a Topic";

  const chatWindow = document.getElementById("chatWindow");
  const chatInput = document.getElementById("chatInput");

  function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("open");
  }

  function switchPage(page) {
    document.querySelectorAll(".nav-item").forEach(item => {
      item.classList.remove("active");
    });

    const items = document.querySelectorAll(".nav-item");

    items.forEach(item => {
      if (item.textContent.trim().includes(page)) {
        item.classList.add("active");
      }
    });

    if (page === "AI Tutor") {
      focusChat();
      return;
    }

    if (page === "Quiz") {
      openTool("Generate Quiz");
      return;
    }

    if (page === "Notes") {
      openTool("Summarize Notes");
      return;
    }

    if (page === "Courses") {
      alert("Courses page can be connected to your course database.");
      return;
    }

    if (page === "Progress") {
      alert("Progress dashboard can display detailed learning analytics.");
      return;
    }
  }

  function focusChat() {
    document.getElementById("chatSection").scrollIntoView({
      behavior: "smooth"
    });

    setTimeout(() => {
      chatInput.focus();
    }, 500);
  }

  function handleEnter(event) {
    if (event.key === "Enter") {
      sendMessage();
    }
  }

  function addMessage(text, type = "ai") {

    const message = document.createElement("div");
    message.className = "message " + (type === "user" ? "user" : "");

    const avatar = document.createElement("div");
    avatar.className =
      "message-avatar " +
      (type === "user" ? "user-avatar" : "ai-avatar");

    avatar.textContent = type === "user" ? "S" : "✦";

    const bubble = document.createElement("div");
    bubble.className = "bubble";

    bubble.textContent = text;

    message.appendChild(avatar);
    message.appendChild(bubble);

    chatWindow.appendChild(message);

    chatWindow.scrollTop = chatWindow.scrollHeight;
  }

  async function sendMessage() {

    const message = chatInput.value.trim();

    if (!message) return;

    addMessage(message, "user");

    chatInput.value = "";

    // Loading message
    const loadingId = "loading-" + Date.now();

    const loading = document.createElement("div");
    loading.className = "message";
    loading.id = loadingId;

    loading.innerHTML = `
      <div class="message-avatar ai-avatar">✦</div>
      <div class="bubble">Thinking... ✦</div>
    `;

    chatWindow.appendChild(loading);
    chatWindow.scrollTop = chatWindow.scrollHeight;

    try {

      /*
       * Production example:
       *
       * const response = await fetch("/api/gemini", {
       *   method: "POST",
       *   headers: {"Content-Type": "application/json"},
       *   body: JSON.stringify({
       *      message: message
       *   })
       * });
       *
       * const data = await response.json();
       * const answer = data.answer;
       */

      const answer = await demoAI(message);

      document.getElementById(loadingId)?.remove();

      addMessage(answer, "ai");

    } catch (error) {

      document.getElementById(loadingId)?.remove();

      addMessage(
        "Sorry, something went wrong. Please try again.",
        "ai"
      );
    }
  }

  /*
   * Demo AI response.
   *
   * Replace this function with a call to your secure backend.
   */
  async function demoAI(message) {

    await new Promise(resolve => setTimeout(resolve, 900));

    const lower = message.toLowerCase();

    if (lower.includes("photosynthesis")) {

      return `Photosynthesis is the process plants use to make food.

1. Plants absorb sunlight using chlorophyll.
2. Roots absorb water from the soil.
3. Leaves take in carbon dioxide from the air.
4. The plant uses light energy to convert water and carbon dioxide into glucose.
5. Oxygen is released as a by-product.

In simple terms:
Sunlight + Water + Carbon Dioxide → Glucose + Oxygen

Think of a plant as a tiny solar-powered food factory. 🌱`;

    }

    if (lower.includes("newton")) {

      return `Newton's laws describe how objects move.

First Law:
An object stays at rest or keeps moving unless a force changes its motion.

Second Law:
Force = Mass × Acceleration
F = ma

Third Law:
For every action, there is an equal and opposite reaction.

Example:
When you push a wall, you exert a force on it, and the wall pushes back on you.`;

    }

    return `Great question!

To answer "${message}", I would normally send your question to the Gemini API through a secure backend.

For this demo, the AI connection is represented by this response.

You can connect the sendMessage() function to your own /api/gemini endpoint to enable real Gemini responses. ✦`;
  }

  function openTool(tool) {

    currentTool = tool;

    const modal = document.getElementById("toolModal");
    const title = document.getElementById("modalTitle");
    const subtitle = document.getElementById("modalSubtitle");
    const input = document.getElementById("toolInput");
    const result = document.getElementById("toolResult");

    title.textContent = tool;

    result.style.display = "none";
    result.textContent = "";

    if (tool === "Explain a Topic") {

      subtitle.textContent =
        "Understand difficult concepts in simple language.";

      input.placeholder =
        "Example: Explain quantum physics like I'm 15...";

    } else if (tool === "Generate Quiz") {

      subtitle.textContent =
        "Generate practice questions from any topic.";

      input.placeholder =
        "Example: Create a 10-question quiz about biology...";

    } else if (tool === "Summarize Notes") {

      subtitle.textContent =
        "Turn your notes into concise study material.";

      input.placeholder =
        "Paste your notes here...";

    } else if (tool === "Study Plan") {

      subtitle.textContent =
        "Create a personalized study schedule.";

      input.placeholder =
        "Example: I have 14 days to prepare for my physics exam...";

    }

    modal.classList.add("show");

    setTimeout(() => input.focus(), 100);
  }

  function closeModal() {
    document.getElementById("toolModal").classList.remove("show");
  }

  async function runTool() {

    const input = document.getElementById("toolInput");
    const result = document.getElementById("toolResult");

    const text = input.value.trim();

    if (!text) {
      input.focus();
      return;
    }

    result.style.display = "block";
    result.textContent = "Generating with AI... ✦";

    await new Promise(resolve => setTimeout(resolve, 900));

    if (currentTool === "Explain a Topic") {

      result.textContent =
        `📚 Explanation

Topic:
${text}

Here's how I'd structure the explanation:

• Start with a simple definition.
• Break the concept into smaller ideas.
• Explain each idea with an example.
• Connect the ideas together.
• Finish with a short recap.

For a real Gemini response, send this prompt to your secure backend.`;

    } else if (currentTool === "Generate Quiz") {

      result.textContent =
        `🧠 Practice Quiz

Topic:
${text}

1. What is the main concept?
   A) Option A
   B) Option B
   C) Option C
   D) Option D

2. Which statement is correct?
   A) Option A
   B) Option B
   C) Option C
   D) Option D

3. Explain the concept in your own words.

4. Give one real-world example.

5. What is the most important takeaway?

Connect this interface to Gemini to generate dynamic questions and answers.`;

    } else if (currentTool === "Summarize Notes") {

      result.textContent =
        `📝 Smart Summary

${text}

Key ideas:
• Identify the main topic.
• Extract the most important facts.
• Remove repeated information.
• Organize the material into clear sections.
• Create a short revision-friendly summary.

A Gemini backend can automatically process the complete notes.`;

    } else {

      result.textContent =
        `📅 Personalized Study Plan

Goal:
${text}

Suggested structure:

Day 1–3
• Learn the fundamentals
• Create short notes

Day 4–7
• Practice problems
• Review difficult concepts

Day 8–11
• Take practice quizzes
• Identify weak areas

Day 12–14
• Full revision
• Mock test
• Final review

Gemini can customize this plan according to your available study hours and exam date.`;
    }
  }

  function clearChat() {
    chatWindow.innerHTML = `
      <div class="message">
        <div class="message-avatar ai-avatar">✦</div>
        <div class="bubble">
          Chat cleared. What would you like to learn?
        </div>
      </div>
    `;
  }

  function showSettings() {
    alert(
      "Settings\n\n" +
      "• Profile\n" +
      "• Learning preferences\n" +
      "• AI response style\n" +
      "• Notifications\n" +
      "• Theme"
    );
  }

  // Close modal when clicking outside it.
  document.getElementById("toolModal").addEventListener("click", function(e) {
    if (e.target === this) {
      closeModal();
    }
  });

</script>

</body>
</html>
