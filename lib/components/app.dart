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
    'user_rating': 'User Rating',
    'total_rating': 'Total Ratings'
  };

  void selectFilterAction (String selectedFilter) {
    setState({
     'selectedFilter': selectOptions[selectedFilter]
    });
  }

  Future<String> _getInitialSelectedFilter() async =>
    state['selectedFilter'];


  componentDidMount(root) =>
     _getInitialSelectedFilter();


  Future handleUserInput (String filterText) async {

    List filteredHotels = new HotelList(props['hotels'])
          .FilterHotels(props['hotels'], filterText, await _getInitialSelectedFilter());

    setState({
      'hotels': filteredHotels.length > 16
                ? filteredHotels.sublist(0, 16)
                : filteredHotels
    });
  }

  render () =>
    react.div({'className': 'column sixteen wide'}, [
        actions({
          'userInput': handleUserInput,
          'selectFilterAction': selectFilterAction,
          'selectedFilter': state['selectedFilter']
        }),
        hotelListComponent({'hotels': state['hotels']})
      ]
    );
}

var appComponent = react.registerComponent(() => new _AppComponent());
