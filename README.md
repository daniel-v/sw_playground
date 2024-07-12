# StopWatch App

StopWatch

## Setup

1. Widgetbook app to showcase widgets - found it useful to communicate with product/UX people. I also get inspired by seeing what I program. It is an excellent tool for prototyping.

## Technical setup

1. `.editorconfig` - same file "look" across platforms and editors
2. Linux target platform added so development without emulators/physical device is possible. Generally speaking, this reduces dev cycle time, improves productivity.
3. Using `package:riverpod_lint` to provide feedback to the developer about best practices.

### Error handling

All errors are currently logged to `stdout`. Error reporting too entry point is in the `main.dart` file, indicated by comments. Currently, the only error types not caught is when there is one during Intl initialization.

### Localization/i18n

Base packages are already part of the project, however localization is not hooked up. Currently, `package:intl` is only used for date and number formatting.

Read more about ARB here: (https://github.com/google/app-resource-bundle)[https://github.com/google/app-resource-bundle];

## Running the project

You will need to have `$SW_PROJECT_ROOT` and `$SW_PLATFORM` env vars defined.

## Project structure

The size/scope of the project allows quite a bit of freedom in how the project is structured.

Primary principles when structuring:
- simplicity
- discoverability
- code proximity (highly related pieces should be places close to each other on the FS as well)

### State management

Using `riverpod` when it makes sense.

### StopWatch App

```shell
cd $SW_PROJECT_ROOT
flutter pub get
flutter run -d $SW_PLATFORM
```

### Widgetbook app

```shell
cd $SW_PROJECT_ROOT/sw_widgetbook
flutter pub get
flutter run -d $SW_PLATFORM
```

## Appendix

### Env vars

- `SW_PLATFORM` - run target, platform to compile against
- `SW_PROJECT_ROOT` - git root directory of project