library darthotel;

import 'dart:io';
import 'dart:async';
import 'package:mustache/mustache.dart' show Template;
import 'package:json_object/json_object.dart';
import 'package:react/react.dart' as React;
import 'package:react/react_server.dart' as reactServer;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:darthotel/constans/consts.dart' show dataPath, templatePath , webPath, webIndexPath;
import 'package:darthotel/components/components.dart' show appComponent;

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
 * @params data
 */
Future<Map> processData (String data) async {
  JsonObject hotelInformation = new JsonObject.fromJsonString(data);
  List<Map> hotels = hotelInformation.Establishments;
  //React server side render
  return {'appServer': React.renderToString(appComponent({'hotels': hotels}))};
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
 * App entry point
 */
main () async {

  await reactServer.setServerConfiguration();
  Map dataToCompile = await getHotelsData().then((value) => processData(value));

  await processTemplate()
    .then((String templateContent) => compileTemplate(templateContent, dataToCompile)
    .then((String compiledTemplate) => writeTemplate(compiledTemplate)))
    .catchError(print);

//  await setupServer();
  var handler = createStaticHandler(
      webPath,
      defaultDocument: 'index.html',
      serveFilesOutsidePath: true
  );

  io.serve(handler, '127.0.0.1', 8080);

}
