import 'dart:async';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:grinder_coveralls/grinder_coveralls.dart' as coveralls;

const outputFileName = 'coverage.info';

void analyze() {
  Analyzer.analyze('lib', fatalWarnings: true);
}

Future<void> test() async {
  await coveralls.collectCoverage(
    getDir('test'),
    saveAs: outputFileName,
    basePath: Directory.current.path,
    reportOn: ['lib'],
  );
}

Future<void> uploadCoverage() async {
  final coverage = await getFile(outputFileName)
      .readAsString();
  await coveralls.uploadCoverage(coverage);
}
