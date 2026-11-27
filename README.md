# Flutter Math Toolkit

An all-in-one Flutter math app: timed math quizzes and games, BMI and age calculators, and unit and currency converters in a single mobile app.

## Features

- Math quiz game with easy, normal, and hard levels and success/wrong feedback
- Arithmetic practice screens with timed questions
- BMI calculator with input and result pages
- Age calculator
- Unit converter (area and other dimensions) and currency converter with live rates via API
- Onboarding flow and landing/product screens

## Tech stack

Flutter · Dart · Flutter Bloc · Hive · Get · Dio · flutter_simple_calculator · shared_preferences

## How to run

```bash
flutter pub get
flutter run
```

Requires a Flutter SDK (3.x recommended). The currency converter fetches rates over HTTP, so network access is needed at runtime.

## License

MIT
