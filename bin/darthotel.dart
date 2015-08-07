library darthotel;

import 'dart:io';
import 'dart:async';


/**
 * Asynchronously fetches hotels data
 */
Future getHotelsData () async {
  File hotels = new File('../data/hotels.json');
  try {
    return await hotels.readAsString();
  } catch (e) {
    print(e);
  }
}

/**
 * App entry point
 */
main () async {

  HttpServer server = await HttpServer.bind('127.0.0.1', 8080);

  await for (HttpRequest request in server) {
    request.response
      ..write(await getHotelsData())
      ..close();
  }
}
