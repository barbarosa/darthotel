part of darthotel.components;

class HotelDetailComponent extends React.Component {

  Hotel get hotel => props['hotel'];

  dynamic render () =>
    React.div({'className': 'content'}, [
      React.img({
        'className': 'right floated mini ui image',
        'src': hotel.thumbnail,
        'alt': hotel.name
      }),
      React.div({'className': 'header'}, hotel.name)
    ]);
}

//register component to react-dart
dynamic hotelDetailComponent = React.registerComponent(() => new HotelDetailComponent());
