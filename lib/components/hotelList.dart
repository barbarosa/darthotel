part of darthotel.components;

class HotelListComponent extends React.Component {

  List<Map> get hotels => props['hotels'];

  void componentDidMount(root) {
    print('mounted hotel component');
  }

  dynamic render() => React.div({} ,[
    React.div({'className': 'ui cards'}, hotels.map((hotel) {

      return React.div({'className': 'card'}, [
        hotelDetailComponent({'hotel': new Hotel(hotel)})
      ]);

    }))
  ]);
}

//register component to react-dart
dynamic hotelListComponent = React.registerComponent(() => new HotelListComponent());
