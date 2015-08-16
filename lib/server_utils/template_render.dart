import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:react/react.dart' as react;
import 'package:react/react_server.dart' as reactServer;
import 'package:mustache/mustache.dart' show Template;
import 'package:darthotel/components/components.dart' show appComponent;
import 'package:darthotel/constans/consts.dart';


/// Fetches hotels data
///
/// @returns Promise object
Future _getHotelsData () async {
  File hotels = new File(dataPath);
  try {
    return await hotels.readAsString();
  } catch (e) {
    print('Cannot fetch data' + e);
  }
}

/// Render react using renderToString server side rendering
///
/// @param data From json file
Future<Map> processData (String data) async {
  List<Map> hotels = JSON.decode(data)['Establishments'];
  return {'appServer': react.renderToString(appComponent({'hotels': hotels}))};
}

/// Read template file
///
/// @returns Promise object
Future _processTemplate () async {

  File file = new File(templatePath);

  try {
    return await file.readAsString();
  } catch (e) {
    print('Cannot read file ' + e);
  }
}

/// @param content Un-compiled template
/// @param vars Key-value variables to compile
Future _compileTemplate (String content, Map vars) async {

  Template template = new Template(content);

  try {
    return template.renderString(vars);
  } catch (e) {
    print('Cannot compile template ' + e);
  }
}

/// Write the new index.html
///
/// @param content The string to be written
Future _writeTemplate (String content) async {

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
  });
}

/// Configure react server &
/// Renders the react component via mustache into the new index.html
Future renderTemplate () async {

  await reactServer.setServerConfiguration();
  Map dataToCompile = await _getHotelsData().then((value) => processData(value));

  await _processTemplate()
  .then((String templateContent) => _compileTemplate(templateContent, dataToCompile)
  .then((String compiledTemplate) => _writeTemplate(compiledTemplate)))
  .catchError(print);
}
