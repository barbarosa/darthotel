library darthotel;

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:darthotel/constans/consts.dart';

import 'package:darthotel/server_utils/template_render.dart' show renderTemplate;

main () async {

  await renderTemplate();

  var handler = createStaticHandler(
      webPath,
      defaultDocument: 'index.html',
      serveFilesOutsidePath: true
  );

  io.serve(handler, '127.0.0.1', 8080);
}
