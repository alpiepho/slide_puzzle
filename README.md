# Fork Notes

This is a fork of the Slide Puzzle.  Look for big logo below for original README.md.

Run it here: [https://alpiepho.github.io/slide_puzzle/](https://alpiepho.github.io/slide_puzzle/)

Optionally, load as PWA to you phone.  On IOS Safari, look for middle up botton, then "Add to Home Screen".  Similar for Android Chrome Browser.

## Feature Changes

- build and hosted as PWA fron Github pages
- added settings (gear) button
- added settings dialog with instant changes to settings
- added support for 3x3 and 5x5 puzzles
- added support for same shuffle with same init state and same seeds used for subsequent shuffle
- added persistence of settings
- added persistence of theme




## Ideas

### Serve as PWA (Progressive Web Applicaiton)
- [x] port peanut script from scoreboard_tn, https://github.com/alpiepho/scoreboard_tn
- [x] for mobile, ~~force portrait~~ given use of Responsive* chose to simplify by only changing board size and allow scroll in landscape on mobile

### User settable size
- [x] currently a 4x4 puzzle
- [x] settings dialog for 3x3 and 4x4
- [x] adjust simple fonts for 3x3 and 5x5
- [x] new dashtar images for 3x3, 4x4, 5x5, ~~success for colors~~
- [x] import images
- [x] access images based on puzzle size
- [x] dynamically use puzzleSize and re-enable checkboxes
- [x] tune dashatar tile sizes 3x3 and 5x5
- [x] change size upon size checkbox? warning?
- [x] local persistent storage of puzzle settings
- [-] local persistent storage of puzzle state
- [x] local persistent storage of puzzle theme
- [ ] local persistent storage of puzzle audio
- [ ] review TODO items
- [ ] review "// ingore" tags
- [ ] review for code refactor and updated testing


### User help features
- [x] checkbox to overlay numbers on tiles
- [x] checkbox for same shuffle
- [x] checkbox for record moves
- [-] save last shuffle
- [x] use last shuffle when selected
- [-] new dashtar images with numbers for 3x3, 4x4, 5x5
- [x] dynamically use overlayNumbers
- [ ] new dashtar images 3x3, 4x4, 5x5 for success


### User advanced help features
- [ ] record moves button (record/stop)
- [ ] record moves (echo to output)
- [ ] playback button
- [ ] implement solver and playback?

### User pictures
- [ ] input link to image
- [ ] process image as tiles
- [ ] test with hard coded image


### Other Ideas
- [ ] clean up "problems"
- [ ] move annimations
- [ ] add commentary to playback ("Rocket League" mode)


### References

- https://stackoverflow.com/questions/60366893/futurebuilder-doesnt-work-when-used-with-sharedpreferences




<br>
<br>
<br>

---

# Slide Puzzle

<!-- ![Photo Booth Header][logo] -->
<img src="art/header.png" alt="Photo Booth Header" width="400"/>

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A slide puzzle built for [Flutter Challenge](https://flutterhack.devpost.com/).

*Built by [Very Good Ventures][very_good_ventures_link] in partnership with Google.*

*Created using [Very Good CLI][very_good_cli_link].*

---

## Getting Started 🚀

To run the project either use the launch configuration in VSCode/Android Studio or use the following command:

```sh
$ flutter run -d chrome
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:very_good_slide_puzzle/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[very_good_ventures_link]: https://verygood.ventures/
[logo]: art/header.png