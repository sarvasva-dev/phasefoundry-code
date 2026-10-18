# PhaseFoundry Code ⚡

> **Ideas ✦ Web ✦ Growth ✦ Together**  
> Next-Generation AI Coding Studio & Autonomous Agent Desktop Environment.

---

## 🌟 Overview

**PhaseFoundry Code** is a high-performance desktop IDE and AI pair programmer designed for modern software engineers and agentic workflows. Reverse-engineered, fully rebranded, and customized from the ground up, PhaseFoundry Code connects you to state-of-the-art AI models, provides an integrated terminal environment, and orchestrates multi-agent tasks in an intuitive workspace.

---

## ✨ Features

- **Multi-Model Orchestration**: Seamlessly connect to PhaseFoundry, Claude (Anthropic), GPT-4o (OpenAI), Gemini (Google), OpenRouter, Groq, Ollama, DeepSeek, and more.
- **Embedded Sidecar Architecture**: High-throughput local RPC and HTTP sidecar service managing project indexing, session states, and autonomous agent loops.
- **Native PTY Terminal**: Ultra-fast terminal integration powered by Ghostty web rendering and high-performance native PTY sessions.
- **Comprehensive Internationalization**: Full native localization across 120+ locales with complete string translations.
- **Bespoke PhaseFoundry UI**: Custom dark/light styling, glowing emblem marks, custom themes, and clean modern typography.
- **Git & Session Diff Review**: Real-time git branch tracking, multi-file inspection, and automated commit management.

---

## 📁 Repository Structure

```
phasefoundry-code/
├── out/
│   ├── main/           # Electron main process & sidecar server
│   │   ├── chunks/     # Backend agent engines, PTY handlers, schemas
│   │   ├── index.js    # Desktop window management & native menus
│   │   └── sidecar.js  # Local agent RPC listener
│   ├── preload/        # Secure Electron context bridges
│   └── renderer/       # SolidJS frontend application
│       ├── assets/     # Vite chunks, locale dictionaries, icons, fonts
│       └── index.html  # Main application HTML shell
├── resources/          # Desktop assets, icons, app metainfo
│   └── icons/          # PhaseFoundry icon suite (.png, .icns, .ico)
├── scripts/            # Launchers and installation tools
│   ├── install.sh      # One-click desktop installer
│   ├── phasefoundry    # CLI command wrapper
│   └── phasefoundry-code # Desktop GUI launcher wrapper
├── package.json        # Application manifest & dependencies
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Linux (Ubuntu, Debian, Fedora, Arch, etc.) with X11 or Wayland
- Electron runtime / Node.js 18+

### Quick Installation

Clone this repository and run the setup script:

```bash
git clone https://github.com/sarvasva-dev/phasefoundry-code.git
cd phasefoundry-code
bash scripts/install.sh
```

This will automatically:
1. Install high-resolution 512x512 application icons to `~/.local/share/icons/`
2. Register the `PhaseFoundry Code` desktop entry with your system application launcher
3. Link the `phasefoundry` and `phasefoundry-code` binaries into `~/.local/bin/`

---

## 🖥️ Launching PhaseFoundry Code

### From the Application Menu
Search for **PhaseFoundry Code** in your desktop application launcher (GNOME, KDE, etc.) and launch with one click.

### From the Terminal
Launch the Desktop GUI:
```bash
phasefoundry-code
# or
phasefoundry desktop
```

Launch the CLI interface:
```bash
phasefoundry
```

---

## ⚙️ Configuration & Customization

PhaseFoundry Code reads configuration from `phasefoundry.json` or standard environment variables:

```json
{
  "$schema": "https://phasefoundry.sarthakml.in/schema.json",
  "theme": "PhaseFoundry",
  "providers": {
    "phasefoundry": {
      "apiKey": "YOUR_API_KEY"
    }
  }
}
```

---

## 📄 License

Distributed under the [MIT License](LICENSE).
PhaseFoundry © 2026. All rights reserved.
