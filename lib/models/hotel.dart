library darthotel.hotel;

class Hotel {

  Map<String, dynamic> hotel;

  String name;
  int stars;
  num userRating;
  int totalRatings;
  String userRatingTitle;
  num minCost;
  num distance;
  String thumbnail;

  Hotel(Map<String, dynamic> this.hotel) {
    this.name = hotel['Name'];
    this.stars = hotel['Stars'];
    this.userRating = hotel['UserRating'];
    this.totalRatings = hotel['UserRatingCount'];
    this.userRatingTitle = hotel['UserRatingTitle'];
    this.minCost = hotel['MinCost'];
    this.distance = hotel['Distance'].ceilToDouble();
    this.thumbnail = hotel['ThumbnailUrl'];
  }
}
