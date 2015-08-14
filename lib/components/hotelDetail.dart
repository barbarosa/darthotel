part of darthotel.components;

class _HotelDetailComponent extends react.Component {

  Hotel get hotel => props['hotel'];

  render () =>
    react.div({'className': 'ui left aligned content'}, [
      react.img({
        'className': 'right floated mini ui image',
        'src': hotel.thumbnail,
        'alt': hotel.name
      }),
      react.div({'className': 'header'}, hotel.name),
      stars({'stars': hotel.getStarsList()}),
      react.div({'className': 'description'}, 'Min price £${hotel.minCost.toString()}'),
      react.div({'className': 'description'}, 'Located ${hotel.distance.toString()} km from the center'),
      react.div({'className': 'ui divider'}),
      react.div({'className': 'extra content'}, [
        react.p({}, '${hotel.userRatingTitle} (${hotel.userRating.toString()}) rating from ${hotel.totalRatings.toString()} reviewers')
      ])
    ]);
}

var hotelDetailComponent = react.registerComponent(() => new _HotelDetailComponent());
