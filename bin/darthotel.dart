library darthotel;

import 'dart:io' show Platform;
import 'dart:async' show runZoned;

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:darthotel/constans/consts.dart';

import 'package:darthotel/server_utils/template_render.dart' show renderTemplate;

main () async {

  var portEnv = Platform.environment['PORT'];
  var port = portEnv != null
              ? int.parse(portEnv)
              : 5000;

  await renderTemplate();

  var handler = createStaticHandler(
      webPath,
      defaultDocument: 'index.html',
      serveFilesOutsidePath: true
  );

  runZoned(() => io.serve(handler, '0.0.0.0', port));
}
