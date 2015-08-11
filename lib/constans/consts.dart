library darthotel.consts;

import 'package:path/path.dart' as path;

const String dataFolder = '../web/data';
const String dataFile = 'hotels.json';
const String templateFolder = '../template';
const String webPath = '../web';
const String dataFolderClient = '/data';

const String indexTemplate = 'index.mustache';
const String indexToServe = 'index.html';

final String dataPath = path.join(dataFolder, dataFile);
final String dataClientPath = path.join(dataFolderClient, dataFile);
final String templatePath = path.join(templateFolder, indexTemplate);
final String webIndexPath = path.join(webPath, indexToServe);
