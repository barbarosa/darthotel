part of darthotel.models;

class HotelList {

  List hotels;

  HotelList(List this.hotels);

  /// @param hotels The data to filter
  /// @param filter Text input to filter
  /// @param filterBy Which key to filter by ex Name, Stars etc
  /// @returns Filtered hotels
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
