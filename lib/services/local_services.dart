import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getDirectoryPath() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  Directory directory = await Directory(appDocDirectory.path + '/' + 'dir')
      .create(recursive: true);

  return directory.path;
}
