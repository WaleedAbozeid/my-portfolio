# 🚀 Waleed Mohamed Abouzeid — Developer Portfolio

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![GoRouter](https://img.shields.io/badge/Routing-GoRouter-blue)](https://pub.dev/packages/go_router)
[![Provider](https://img.shields.io/badge/State-Provider-orange)](https://pub.dev/packages/provider)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A high-performance, modern, and fully responsive personal portfolio built with **Flutter Web**. Designed to showcase professional software engineering projects, mobile applications, AI systems, and data analytics dashboards to recruiters and engineering teams worldwide.

---

## 🌐 Live Preview

- **Production URL:** [https://waleedabozeid.vercel.app](https://waleedabozeid.vercel.app)
- **LinkedIn:** [linkedin.com/in/waleedabozeid](https://linkedin.com/in/waleedabozeid)
- **GitHub:** [github.com/WaleedAbozeid](https://github.com/WaleedAbozeid)

---

## ✨ Highlights & Features

- **Multiplatform Responsive Design:** Tailored layouts with adaptive breakpoints for Mobile (360px–480px), Tablet (768px), Laptop (1280px), and Large Desktop (1600px+).
- **Bilingual Support (Arabic & English):** Native RTL (Right-to-Left) and LTR layout switching with complete localization (`ar.json` and `en.json`).
- **Dark & Light Mode:** Seamless theme switching with persistence via `SharedPreferences`.
- **Declarative Deep-link Routing:** Powered by `go_router` with shell navigation and custom branded 404 page.
- **Micro-Interactions & Animations:** Smooth transitions and cards powered by `animate_do` and Material 3 design system.
- **Search Engine & Social Optimization:** Complete Open Graph, Twitter Cards, canonical tags, `sitemap.xml`, and crawler-friendly fallback content.

---

## 🛠️ Tech Stack

| Domain | Technologies & Libraries |
| :--- | :--- |
| **Framework & Language** | Flutter Web, Dart 3 |
| **State Management** | Provider |
| **Navigation & Routing** | GoRouter 17 |
| **Typography & Styling** | Google Fonts (`Cairo` for Arabic, `Inter` for English), FontAwesome Icons |
| **Forms & Validation** | `flutter_form_builder`, `form_builder_validators` |
| **Hosting & CI/CD** | Vercel, GitHub Actions (`deploy.yml`) |

---

## 📂 Project Architecture

```
lib/
├── core/
│   ├── constants/       # Colors, Typography & Theme variables
│   ├── l10n/            # Localization provider, delegates & JSON loaders
│   ├── routing/         # GoRouter definitions & ShellRoute configuration
│   ├── theme/           # Light & Dark theme providers
│   └── utils/           # Responsive helper & breakpoint utilities
├── data/
│   ├── models/          # Project & Experience models
│   └── projects_data.dart # Curated portfolio projects & tech stack details
├── features/
│   ├── home/            # Hero, Stats, Featured Projects, Freelance & Skills sections
│   ├── projects/        # Project Grid, Filters & Detailed Showcase view
│   ├── about/           # Profile bio, education, and career metrics
│   ├── experience/      # Career timeline & milestone achievements
│   ├── contact/         # Direct email, social channels & contact form
│   └── not_found/       # Branded 404 error page
└── shared/
    └── widgets/         # Navbar, Drawer, Footer, Theme & Language toggles
```

---

## 🚀 Getting Started Locally

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.10.4 or higher)
- Chrome / Edge / modern web browser

### Run in Debug Mode
```bash
# Clone the repository
git clone https://github.com/WaleedAbozeid/portfolio.git
cd portfolio

# Install dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome
```

### Build for Production
```bash
flutter build web --release
```
The output will be generated inside `build/web/`.

---

## 👨‍💻 Author

**Waleed Mohamed Abouzeid**  
*Senior Flutter Developer & Data Analyst*  
- 📧 Email: [waleedabozeid995@gmail.com](mailto:waleedabozeid995@gmail.com)  
- 💼 LinkedIn: [@waleedabozeid](https://linkedin.com/in/waleedabozeid)  
- 🐙 GitHub: [@WaleedAbozeid](https://github.com/WaleedAbozeid)  
