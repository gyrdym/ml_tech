import 'dart:convert' as convert;
import 'dart:io';

Future<Map<String, dynamic>> readJSON(String fileName) async =>
    await File(fileName)
      .openRead()
      .transform(convert.utf8.decoder)
      .transform(convert.json.decoder)
      .first as Map<String, dynamic>;