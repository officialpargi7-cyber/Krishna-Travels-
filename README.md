# Krishna Travels — Android app

Android app for Krishna Travels, built with Kotlin and Jetpack Compose. The current project includes Firebase Authentication and Cloud Firestore integration, trip/fleet screens, team management, passenger bookings, expenses, attendance, and language support.

## Build the APK using GitHub (recommended)

You can do this from a phone or computer:

1. Sign in to [GitHub](https://github.com) and create a **new repository** (for example, `krishna-travels`). Choose Public or Private.
2. Extract this ZIP file.
3. Upload the **contents inside** the extracted `krishna-travels-github` folder to the repository's top level. The `.github` folder is important. If GitHub hides it during upload, enable hidden files or upload the folder using Git.
4. Open the repository's **Actions** tab. The workflow named **Build Krishna Travels APK** starts after you push the files. You can also select **Run workflow**.
5. Wait until the workflow finishes with a green check mark.
6. Open the completed workflow run, scroll to **Artifacts**, and download `krishna-travels-debug-apk`.
7. Extract the downloaded artifact ZIP. It contains `app-debug.apk`. Transfer that APK to your Android phone and install it. Android may ask you to allow installs from that source.

Every push to `main` or `master` will build a fresh debug APK. Pull requests and manual workflow runs are also supported.

## Build locally with Android Studio

1. Install Android Studio and its recommended Android SDK components.
2. Extract this project ZIP.
3. In Android Studio, choose **Open** and select the extracted project folder (the folder containing `settings.gradle.kts`).
4. Allow Gradle sync to finish. Use JDK 17 for this project.
5. Connect an Android phone with USB debugging enabled, or start an emulator.
6. Select the `app` run configuration and press **Run**. To create an APK, choose **Build → Build Bundle(s) / APK(s) → Build APK(s)**.

## Firebase setup — important

This project already contains `app/google-services.json` and the Firebase database ID resource from the supplied project. Keep the Android application ID as `com.aistudio.busflow.kqzmtw` unless you also register the new ID in Firebase and update the OAuth configuration.

For sign-in and data features to work:

- In Firebase Console, confirm that **Authentication** has the sign-in providers used by the app enabled.
- Confirm that the Firestore database used by this app exists.
- Configure Firestore Security Rules for your app's Owner/Manager/staff access model. Do not use open rules such as `allow read, write: if true;` in production.
- Google sign-in can depend on the signing certificate. A debug APK built by GitHub has a different signing certificate from the AI Studio or locally signed app. If Google sign-in fails, add the SHA-1 and SHA-256 fingerprints of the certificate used for the installed APK to the Android app in Firebase Console, then download the updated `google-services.json`.

The Firebase configuration file contains app identifiers and an API key intended for identifying the Firebase app; it is not a place to store private server credentials. Never commit service-account JSON files, private keys, passwords, or signing keystores.

## Project notes

- Android package/application ID: `com.aistudio.busflow.kqzmtw`
- Minimum Android version: Android 7.0 (API 24)
- Target SDK: API 36
- Main source: `app/src/main/java/com/example/`
- GitHub build workflow: `.github/workflows/android.yml`

## Troubleshooting

- **Actions tab is missing:** ensure the repository has the `.github/workflows/android.yml` file and that Actions are enabled in repository settings.
- **Gradle sync/build fails:** open the workflow run, expand the failed step, and copy the first actual error (not just the final “build failed” line).
- **App installs but sign-in fails:** check Firebase Authentication providers and register the signing certificate fingerprint for the exact APK you installed.
- **App opens but data does not load:** check the Firestore database ID, database existence, and Firestore Security Rules.

This ZIP contains the Android project source, not a prebuilt APK. GitHub Actions builds the APK and makes it available as a downloadable workflow artifact.
