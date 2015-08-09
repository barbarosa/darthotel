library darthotel.hotelComponent;

import 'package:react/react.dart';
import 'package:json_object/json_object.dart';

class HotelComponent extends Component {

  Map getInitialState() => {'hotels': props['hotels']};

  processHotelsData() {
    JsonObject hotels = new JsonObject.fromJsonString(state['hotels']);
    List hotelData = hotels.Establishments;
    return hotelData;
  }

  getHotelName (Map hotel) {
    JsonObject h = new JsonObject.fromMap(hotel);
      return div({}, h.Name);
  }

  render() => div({} ,[
    div({}, processHotelsData().map((hotel) => getHotelName(hotel)).toList())
  ]);
}
