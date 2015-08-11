part of darthotel.components;

class AppComponent extends React.Component {

  Map<String, List> getInitialState () =>
    { 'hotels': props['hotels'], 'filterText': '' };

  void handleUserInput (filterText) =>
    setState({'filterText': filterText});

  dynamic render () =>
    React.div({'className': 'hotelsApp'}, [
        searchInputComponent({'userInput': handleUserInput}),
        hotelComponent({'hotels': props['hotels']}),
        React.div({}, state['filterText'])
      ]
    );
}

//register component to react-dart
dynamic appComponent = React.registerComponent(() => new AppComponent());
