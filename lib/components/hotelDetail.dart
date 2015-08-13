part of darthotel.components;

class HotelDetailComponent extends react.Component {

  Hotel get hotel => props['hotel'];

  dynamic render () =>
    react.div({'className': 'ui left aligned content'}, [
      react.img({
        'className': 'right floated mini ui image',
        'src': hotel.thumbnail,
        'alt': hotel.name
      }),
      react.div({'className': 'header'}, hotel.name),
      stars({'stars': hotel.getStarsList()}),
      react.div({'className': 'description'}, 'Min price £${hotel.minCost.toString()}'),
      react.div({'className': 'ui divider'}),
      react.div({'className': 'extra content'}, [
        react.p({}, 'Rating ${hotel.userRating.toString()} from ${hotel.totalRatings.toString()} reviewers')
      ])
    ]);
}

var hotelDetailComponent = react.registerComponent(() => new HotelDetailComponent());
