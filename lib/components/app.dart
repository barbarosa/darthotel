part of darthotel.components;

class AppComponent extends react.Component {

  Map<String, List> getInitialState () =>
    { 'hotels': props['hotels'].sublist(0, 23), 'filterText': '' };

  String getName (Map hotel) {
    return hotel['Name'].toLowerCase();
  }

  void handleUserInput (filterText) {
    List SortedHotels = props['hotels'];
    print(filterText);
    //Filter data
    List FilteredHotels = SortedHotels.where((f) => getName(f).startsWith(filterText)).toList();
    //SortedHotels.sort((a, b) => getName(a).compareTo(getName(b)));
    setState({'hotels': FilteredHotels});
  }

  dynamic render () =>
    react.div({'className': 'column twelve wide'}, [
        searchInputComponent({'userInput': handleUserInput}),
        hotelListComponent({'hotels': state['hotels']}),
      ]
    );
}

//register component to react-dart
var appComponent = react.registerComponent(() => new AppComponent());
