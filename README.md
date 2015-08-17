# darthotel
[Dart](https://www.dartlang.org/) + [React](http://facebook.github.io/react/) Isomorphic basic app structure example that displays a list of hotels with sorting and filtering.

![alt darthotel_screenshot](https://lh3.googleusercontent.com/43i_h0NZgNY74bniK-_PfoCXpTZiiUsV7W3xOKqMQ9w=w900-h660-no)

Contains a sample web application with static data that renders hotel information using cards.

Uses [semantic-ui](http://semantic-ui.com/) style.

Can be used as a started for a Dart + React project.

Working app: https://darthotel.herokuapp.com/

## Architecture
The choice of Dart because it's **awesome**. It is a [complete and new programming language](https://www.dartlang.org/support/faq.html#q-why-dart) that focuses on web development.


The application uses Dart both on the server and the client sharing the react components using the awesome [react-dart](https://github.com/cleandart/react-dart) library to make the bindings between react.js and Dart.

**Isomorphic rendering** as a key feature:

* The component it's first rendered to string with hotels data and passed into the [mustache](https://github.com/xxgreg/mustache) as a variable and rendered by the server using [shelf](https://github.com/dart-lang/shelf)

```dart
return {'appServer': react.renderToString(appComponent({'hotels': hotels}))};
```

* The same component it's rendered into DOM with the same hotels data on the client that will compile Dart to JavaScript in the end

```dart
  React.render(appComponent({'hotels': hotels}), querySelector('#hotels-wrapper'));
```

* Mustache template where both client and server are being rendered

```mustache
<div class="ui center aligned grid" id="hotels-wrapper">
    {{{ appServer }}}
</div>
```

As an effect the speed of loading it's increased as the initial page load it's fast done by the server and based on *data-reactid* data attributes from the markup, the client doesn't re-render the DOM and just get's ready for user interaction.

## Install and run

* Download the latest [dart sdk](https://www.dartlang.org/downloads/)

* Clone this project repository

* Copy dart_sdk folder into the project repository

Execute:
```bash
> cd bin
```

```bash
> ../dart-sdk/bin/dart darthotel.dart
```

This will launch a new shelf static server on http://0.0.0.0:5000

In order to check the working JavaScript please use [Chromium](https://www.chromium.org/Home) as it compiles Dart on the fly in the browser.

## Todo:

* Enhance the application adding sorting
* Investigate use of Streams for custom user events
* Add further documentation
* Add unit test!
