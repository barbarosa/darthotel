part of darthotel.components;

class HotelListComponent extends react.Component {

  List<Map> get hotels => props['hotels'];

  void componentDidMount(root) {
    print('mounted hotel component');
  }

  render() => react.div({'className': 'ui left aligned'} ,[
    react.div({'className': 'ui cards'}, hotels.map((hotel) {

      return react.div({'className': 'card'}, [
        hotelDetailComponent({'hotel': new Hotel(hotel)})
      ]);

    }))
  ]);
}

var hotelListComponent = react.registerComponent(() => new HotelListComponent());
