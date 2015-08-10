library darthotel.hotelComponent;

import 'package:react/react.dart' as React;
import 'package:darthotel/model/hotel.dart';

class HotelComponent extends React.Component {

  Map getInitialState() => {
    'hotels': props['hotels'],
    'filters': state['filters']
  };

  onChange (String value) {
     print ('buiaka ' + value);
  }

  void componentDidMount(root) {
    print ('mounted');
  }

  dynamic render() => React.div({} ,[
    React.input({"type": "text", 'onChange': (React.SyntheticFormEvent e) => onChange(e.target.value)}, state['filters']),
    React.div({}, props['hotels'].map((hotel) => hotel['Name']).toList())
  ]);
}
