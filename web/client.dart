import 'dart:html';
import 'package:react/react_client.dart' as reactClient;
import 'package:react/react.dart' as React;

import 'package:darthotel/components/components.dart' show appComponent;


main() {
  //this should be called once at the begging of application
  reactClient.setClientConfiguration();
  React.render(appComponent(
      {'hotels': [{"Name": "Vienna International Dream Castle Hotel"}]}),
      querySelector('#hotels-wrapper')
    );
}