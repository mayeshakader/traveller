# ✈️ Traveller

A Flutter-based travel UI application showcasing destination browsing, booking flow, and user profile management. Built as a university project (AUST, CSE) — all data is hardcoded; no backend or database is used.

---

## 📸 Screenshots

| Login | Sign In | Home |
|:---:|:---:|:---:|
| ![Login](img/login_screen.png) | ![Sign In](img/signin_screen.png) | ![Home](img/home_screen.png) |

| Destination Detail | User Profile |
|:---:|:---:|
| ![Destination](img/destination_screen.png) | ![Profile](img/profile_screen.png) |

---

## ✨ Features

| Feature | Status |
|---|---|
| Login / Sign In screens | ✅ UI only (no auth logic) |
| Home page with Feedback button | ✅ |
| Destination detail (image, rating, price, description) | ✅ |
| Group size picker (1–5 people) | ✅ |
| Favourite (heart) toggle | ✅ UI only |
| Book Now button | ✅ UI only |
| User Profile (name, location, email, join date) | ✅ Hardcoded |
| Backend / database | ❌ Not implemented |
| Real authentication | ❌ Not implemented |
| Search / filter | ❌ Not implemented |

---

## 🗺️ Destinations & Activities

Assets bundled in the app:

**Destinations**
- Mountains (`mountainone`, `mountaintwo`, `mountainthree`, `mountain`)
- Nature scenery (`natureone`, `naturetwo`, `naturethree`)
- Inani Beach, Cox's Bazar

**Activities**
- 🎈 Ballooning
- 🥾 Hiking
- 🚣 Kayaking
- 🤿 Snorkeling

All images are local assets — no network calls are made.

---

## 🛠️ Tech Stack

| | |
|---|---|
| Framework | Flutter 3.x |
| Language | Dart (SDK `>=3.2.0 <4.0.0`) |
| Packages | `cupertino_icons` only — no third-party deps |
| State management | `StatefulWidget` (built-in) |
| Backend | None — all data hardcoded |
| Platforms | Android · iOS · Web · Windows · macOS · Linux |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ≥ 3.2.0 — [install guide](https://docs.flutter.dev/get-started/install)

### Run

```bash
git clone https://github.com/mayeshakader/traveller.git
cd traveller
flutter pub get

flutter run                 # connected device / emulator
flutter run -d chrome       # web
flutter run -d windows      # Windows desktop
```

### Build

```bash
flutter build apk --release   # Android
flutter build web --release   # Web
```

---

## 📁 Project Structure

```
traveller/
├── lib/               # Dart source — screens, widgets, models
├── img/               # All local image assets (15 images)
├── test/              # Widget tests
├── android/
├── ios/
├── web/
├── windows/
├── macos/
├── linux/
├── pubspec.yaml       # Dependencies & asset declarations
└── analysis_options.yaml
```

> **Note:** The internal package name is `projectone` (from `pubspec.yaml`) — the display name "Traveller" is set at the platform level.

---

## ⚠️ Known Limitations

- No real login — any input navigates forward
- User profile data (Mili, Dhaka, mili@gmail.com) is hardcoded
- Booking does not persist anywhere
- Favourite toggle resets on page reload
- Only one destination (Inani Beach) is fully detailed

---

## 👩‍💻 Author

**Mayesha Kader**  
BSc CSE, Ahsanullah University of Science and Technology (AUST)  
[github.com/mayeshakader](https://github.com/mayeshakader)
