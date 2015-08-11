part of darthotel.components;

class HotelComponent extends React.Component {

  Map get hotels => props['hotels'];

  void componentDidMount(root) {
    print('mounted hotel component');
  }

  dynamic render() => React.div({} ,[
    React.div({}, hotels.map((hotel) => hotel['Name']).toList())
  ]);
}

//register component to react-dart
dynamic hotelComponent = React.registerComponent(() => new HotelComponent());
