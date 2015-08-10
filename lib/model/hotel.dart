library darthotel.hotel;

class Hotel {

  String name;

  Hotel(this.name);

  // Named constructor
  Hotel.fromJson(Map json) {
    name = json['name'];
  }

}