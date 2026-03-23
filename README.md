# Address App

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-3DDC84)
![Architecture](https://img.shields.io/badge/Architecture-Feature--First%20%7C%20Layered-4A90E2)
![API](https://img.shields.io/badge/API-ViaCEP-orange)

Address App is a Flutter application that looks up Brazilian postal codes (CEP), shows address details, and lets users save favorite addresses locally.

The project follows a feature-first and layered architecture, using Flutter Modular for routing/dependency injection, Dio for HTTP calls, and SharedPreferences for local persistence.

## Features

- Search address data by CEP using the ViaCEP API
- Handle loading, success, empty, and error states in the UI
- Save and remove favorite addresses
- Persist favorites locally with SharedPreferences
- Navigate between Home and Favorites modules

## Tech Stack

- Flutter (Dart)
- flutter_modular
- dio
- fpdart
- equatable
- shared_preferences

## Project Structure

```text
lib/
	core/
		error/
		network/
	features/
		app_module.dart
		home/
			data/
			domain/
			presentation/
		favorites/
			data/
			domain/
			presentation/
	shared/
		ui/
		widgets/
	main.dart

test/
	features/
		home/
```

## Architecture Notes

- Data layer: datasources and repository implementations
- Domain layer: entities, repository contracts, and use cases
- Presentation layer: controllers, state models, and widgets/pages
- App composition: `AppModule` configures app-level bindings and routes

## API Integration

- Base URL: `https://viacep.com.br/ws/`
- Address query format: `{cep}/json`

## Getting Started

### Prerequisites

- Flutter SDK installed
- A device or emulator configured

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Run tests

```bash
flutter test
```

## Current Test Coverage

- Unit test for `GetAddressUsecase`

## Notes

- Favorites are stored locally on the device.
- Network timeout and Dio exception mapping are handled in the core network layer.
