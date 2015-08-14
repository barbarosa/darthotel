part of darthotel.models;

class Hotel {

  Map<String, dynamic> hotel;

  String name;
  int stars;
  num userRating;
  int totalRatings;
  String userRatingTitle;
  num minCost;
  String distance;
  String thumbnail;

  Hotel(Map<String, Object> this.hotel) {
    this.name = hotel['Name'];
    this.stars = hotel['Stars'];
    this.userRating = hotel['UserRating'];
    this.totalRatings = hotel['UserRatingCount'];
    this.userRatingTitle = hotel['UserRatingTitle'];
    this.minCost = hotel['MinCost'];
    this.distance = hotel['Distance'].toStringAsFixed(2);
    this.thumbnail = hotel['ThumbnailUrl'];
  }

  String getNameToFilter () => this.name.toLowerCase();

  List getStarsList () {

    var starsList = [];
    for (var i = 0; i < this.stars; i++) {
      starsList.add('star');
    }
    return starsList;
  }

}
