part of darthotel.components;

class _AppComponent extends react.Component {

  Map getInitialState () =>
    {
      'hotels': props['hotels'].sublist(0, 16),
      'filterText': '',
      'selectedFilter': selectOptions['name']
    };

  Map selectOptions = {
    'name': 'Name',
    'stars': 'Stars',
    'price': 'Price',
    'total_rating': 'Total Ratings',
    'user_rating': 'Best Ratings'
  };


//  TODO move in hotel model class
  String getName (Map hotel) {
    return hotel['Name'].toLowerCase();
  }

  void selectFilterAction (String selectedFilter) {
    setState({
     'selectedFilter': selectOptions[selectedFilter]
    });
  }

  void handleUserInput (String filterText) {
    List SortedHotels = props['hotels'];
    print(filterText);
    //Filter data
    List FilteredHotels = SortedHotels.where((f) => getName(f).startsWith(filterText)).toList();
    //SortedHotels.sort((a, b) => getName(a).compareTo(getName(b)));
    setState({
      'hotels': FilteredHotels.length > 16
                ? FilteredHotels.sublist(0, 16)
                : FilteredHotels
    });
  }

  render () =>
    react.div({'className': 'column sixteen wide'}, [
        actions({
          'userInput': handleUserInput,
          'selectFilterAction': selectFilterAction,
          'selectedFilter': state['selectedFilter']
        }),
        hotelListComponent({'hotels': state['hotels']}),
      ]
    );
}

var appComponent = react.registerComponent(() => new _AppComponent());
