# kana_to_kanji

An application to help you learn Japanese.

## Localization

We want our application to be as much as possible accessible, for that purpose we want
to translate the application in multiple language. In the table below you can find the 
list of language and their support state. If your language isn't listed don't hesitate 
to create an issue!

| Language     | Support        |
|--------------|----------------|
| 🇬🇧 English | ✅ Full support  |
| 🇫🇷 French  | ✅ Full support  |


## Getting Started

### Requirements

- Flutter 3.10 or higher

### Development setup

Before trying to build the application, run the following in a terminal:

```shell
# Get the dependencies and generate l10n files
flutter pub get

# Generate Freezed and JSON Serializable files
dart run build_runner build
```

Now you are ready to run the application. To do so execute the following command:

```shell
flutter run --flavor <flavor> [--target lib/main_<flavor>.dart]
```

This project has three (3) flavors:
- Prod
- Beta, target to specify `lib/main_beta.dart`
- Dev, target to specify `lib/main_dev.dart`


#### Troubleshoot
##### `dart run build_runner build` -> "version solving failed"
In case of this issue, use the following command instead : 
```bash
dart run build_runner build --delete-conflicting-outputs
```