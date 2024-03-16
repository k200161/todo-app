import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TodosFile {
  static const filename = 'todos.txt';

  static Future<File> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$filename';
    final file = File(path);
    final isNew = !file.existsSync();
    if (isNew) file.writeAsStringSync('[]');
    return file;
  }
}
