# IIS Mobile Application

A Flutter meditation/Pranic Healing companion app, built from the provided Figma design, with
Firebase-backed onboarding and authentication, Riverpod state management, and a clean
architecture (presentation / domain / data) project structure.

## Project Setup

1. Install the Flutter SDK matching `environment.sdk` in [pubspec.yaml](pubspec.yaml) (Dart ^3.12.2).
2. `flutter pub get`
3. Configure Firebase (see below) — **required**, the app will not build without it.
4. `flutter run`

## Firebase Setup

No Firebase project is wired into this repo yet — [lib/firebase_options.dart](lib/firebase_options.dart)
is a placeholder with fake values so the project still compiles/analyzes.

1. Create a Firebase project in the [Firebase console](https://console.firebase.google.com/).
2. Enable **Authentication → Email/Password** sign-in provider.
3. Enable **Firestore Database** (start in test mode for local development).
4. Install the FlutterFire CLI if you haven't already:
   ```
   dart pub global activate flutterfire_cli
   ```
5. From the project root (`iis_app/`), run:
   ```
   flutterfire configure
   ```
   This generates a real `lib/firebase_options.dart`, registers the Android/iOS apps, and
   downloads `android/app/google-services.json` / `ios/Runner/GoogleService-Info.plist`. It also
   adds the Google Services Gradle plugin wiring to `android/build.gradle.kts` /
   `android/app/build.gradle.kts` automatically — if it doesn't (older CLI versions sometimes miss
   Kotlin DSL files), add the `com.google.gms.google-services` classpath/plugin manually per the
   [FlutterFire docs](https://firebase.google.com/docs/flutter/setup).
6. `flutter pub get` again, then `flutter run`.

Firestore data model used: a single `users/{uid}` document per account:
```json
{
  "name": "Samyukta J",
  "email": "samyu@indosakura.com",
  "country": "India",
  "level": "ARHATIC PRACTITIONER • Level 1",
  "createdAt": "2026-10-29T12:00:00.000"
}
```

## Packages Used

| Package | Why |
|---|---|
| `flutter_riverpod` | State management (required by the assignment) — plain `Notifier`/`AsyncNotifier`/`StreamProvider`, no code generation, to keep the dependency graph simple. |
| `firebase_core`, `firebase_auth` | App init + email/password authentication. |
| `cloud_firestore` | Stores basic user profile (name/email/country/level) per the assignment. |
| `shared_preferences` | Persists the one-time onboarding-completed flag locally. |

## Architecture

Clean architecture, three layers:

```
lib/
  domain/            # pure Dart: entities + abstract repository contracts
    entities/
    repositories/
  data/               # implementations: Firebase/Firestore/SharedPreferences
    datasources/
    repositories/
  presentation/        # Riverpod providers/controllers + feature screens
    providers/          # raw Firebase/SharedPreferences instances + repository wiring
    auth/                # login/register screens + AuthController
    onboarding/          # onboarding screen + OnboardingController
    profile/             # edit-profile screen + profile stream provider
    splash/              # splash screen
    core/                # AuthGate (chooses Splash/Onboarding/Login/app shell)
  screens/              # existing Figma-matched UI screens (home/playlists/albums/profile/settings)
  widgets/              # shared UI widgets (bottom nav, mini player)
  core/
    app_exception.dart  # friendly error type surfaced to the UI
```

`presentation` depends only on `domain` interfaces (never directly on `data`), and `data` provides
the concrete Firebase/local implementations via Riverpod `Provider`s in
`presentation/providers/repository_providers.dart`. Screens are plain `ConsumerWidget`s that watch
providers and render loading/error/data states inline (no separate "ViewModel" classes beyond the
Riverpod `Notifier`/`AsyncNotifier` controllers, which serve that role).

Routing is deliberately simple: `AuthGate` (in `presentation/core/auth_gate.dart`) watches
onboarding + auth state and swaps between `SplashScreen` / `OnboardingScreen` / `LoginScreen` /
`RootScreen` directly — no router package. Secondary navigation (Login ↔ Register, Profile →
Settings → Edit Profile) uses plain `Navigator.push`.

## Completed Features

- Splash → first-launch decision flow (`AuthGate`).
- Onboarding (3 slides) with persisted completion flag (`shared_preferences`).
- Email/password login & registration (Firebase Auth), with loading and inline error states.
- Basic user profile stored in Firestore on sign-up (name, email, country, level).
- Profile screen reads live Firestore data; Settings screen lets the user edit their display name.
- Sign-out wired from Settings → returns to the Login screen.
- All original Figma screens (Home, Playlists, Albums, Profile, Settings) implemented as static UI.

## Known Limitations / Assumptions

- Only email/password auth is implemented — no Google/social sign-in, no password reset flow.
- Profile "stats" (hours meditated, day streak, sacred tracks) and the recent-meditations /
  playlists / albums lists remain static demo data — there's no backend model for meditation
  content/playback in this assignment's scope.
- Onboarding content/copy was designed from scratch (not present in the Figma file), per the
  assignment's note that onboarding logic may be based on the developer's own understanding.
- No automated integration tests against a live Firebase project; `test/widget_test.dart` is a
  minimal smoke test for the onboarding screen that doesn't require Firebase.
