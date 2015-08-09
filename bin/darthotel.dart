library darthotel;

import 'dart:io';
import 'dart:async';
import 'package:mustache/mustache.dart' show Template;

import 'package:react/react.dart' as React;
import 'package:react/react_server.dart' as reactServer;

//constants
import 'package:darthotel/constans/consts.dart' show dataPath, templatePath , webPath, webIndexPath;
//components
import 'package:darthotel/components/HotelComponent.dart';


var hotelComponent = React.registerComponent(() => new HotelComponent());


/**
 * Asynchronously fetches hotels data
 */
Future getHotelsData () async {

  File hotels = new File(dataPath);
  try {
    return await hotels.readAsString();
  } catch (e) {
    print(e);
  }

}

/**
 * Read template file
 * @returns promise
 */
Future processTemplate () async {

  File file = new File(templatePath);

  try {
    return await file.readAsString();
  } catch (e) {
    print('Cannot read file ' + e);
  }
}

/**
 * @param content: String - un-compiled template
 * @param vars: Map - a map of key-value variables to compile
 */
Future compileTemplate (String content, Map vars) async {

  Template template = new Template(content);

  try {
    return template.renderString(vars);
  } catch (e) {
    print('Cannot compile template ' + e);
  }
}

/**
 * @param content: String to be written
 */
Future writeTemplate (String content) async {

  await new Directory(webPath)
    .exists()
    .then((bool existing) {
      if (!existing) {
        //create web dir if non-existent
        new Directory(webPath).create(recursive: true).then((Directory dir) {
          try {
            return new File(webIndexPath).writeAsString(content);
          } catch (e) {
            print('Cannot write to HTML ' + e);
          }
        }) ;
      } else {
        try {
          return new File(webIndexPath).writeAsString(content);
        } catch (e) {
          print('Cannot write to HTML ' + e);
        }
      }
    }
  );
}

/**
 * Set up web server
 */
Future setupServer () async {

  HttpServer server = await HttpServer.bind('127.0.0.1', 8080);
  File file = new File(webIndexPath);

  await for (HttpRequest request in server) {

    request.response.headers.contentType = ContentType.HTML;

    try {
      await file.openRead().pipe(request.response);
    } catch (e) {
      print (e);
      exit(-1);
    }
  }
}

/**
 * App entry point
 */
Future main () async {

  await reactServer.setServerConfiguration();


  //what to render with
  Map dataToCompile = {'hotelsServer': React.renderToString(hotelComponent({'hotels': await getHotelsData()}))};

  await processTemplate()
    .then((String templateContent) => compileTemplate(templateContent, dataToCompile)
    .then((String compiledTemplate) => writeTemplate(compiledTemplate)))
    .catchError(print);

  await setupServer();

}
