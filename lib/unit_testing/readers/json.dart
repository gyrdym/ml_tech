import 'dart:convert' as convert;
import 'dart:io';

Future<String> readJSON(String fileName) async =>
    await File(fileName)
      .openRead()
      .transform(convert.utf8.decoder)
      .transform(convert.json.decoder)
      .first as String;