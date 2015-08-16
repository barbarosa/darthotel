import 'dart:html';
import 'dart:convert';

import 'package:react/react_client.dart' as reactClient;
import 'package:react/react.dart' as React;

import 'package:darthotel/components/components.dart' show appComponent;
import 'package:darthotel/constans/consts.dart' show dataClientPath;

main() {
  HttpRequest.getString(dataClientPath).then((data) {

    List<Map> hotels = JSON.decode(data)['Establishments'];
    reactClient.setClientConfiguration();
    React.render(appComponent({'hotels': hotels}), querySelector('#hotels-wrapper'));
  });
}
