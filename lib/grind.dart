import 'dart:async';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:grinder_coveralls/grinder_coveralls.dart' as coveralls;

const outputFileName = 'coverage.info';

/// Starts the build system.
Future<void> main(List<String> args) => grind(args);

@Task('Analyze code, runs the test suites and collect coverage')
Future<void> start() async {
  Analyzer.analyze('lib', fatalWarnings: true);

  await coveralls.collectCoverage(
    getDir('test'),
    saveAs: outputFileName,
    basePath: Directory.current.path,
    reportOn: ['lib'],
  );
}

@Task('Upload the coverage')
Future<void> finish() async {
  final coverage = await getFile(outputFileName)
      .readAsString();
  await coveralls.uploadCoverage(coverage);
}
