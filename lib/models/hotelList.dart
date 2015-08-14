part of darthotel.models;

class hotelList {

  List hotels;

  hotelList(List this.hotels);

  List FilterHotels (List hotels, String filter, String filterBy) {

    String _getProperty (Map hotel) {

      Map hotelMapper = {
        'Name': 'Name',
        'Stars': 'Stars',
        'Price': 'MinCost',
        'User Rating': 'UserRatingTitle',
        'Total Ratings': 'UserRatingCount'
      };

      return hotel[hotelMapper[filterBy]].toString().toLowerCase();
    }

    return hotels.where((f) => _getProperty(f).startsWith(filter)).toList();
  }
}
