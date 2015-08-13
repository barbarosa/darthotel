part of darthotel.components;

class _HotelListComponent extends react.Component {

  List<Map> get hotels => props['hotels'];

  void componentDidMount(root) {
    print('mounted hotel component');
  }

  render() => react.div({'className': 'ui left aligned'} ,[
    react.div({'className': 'ui centered cards'}, hotels.map((hotel) =>

      react.div({'className': 'ui card'}, [
        hotelDetailComponent({'hotel': new Hotel(hotel)})
      ])
    ))
  ]);
}

var hotelListComponent = react.registerComponent(() => new _HotelListComponent());
