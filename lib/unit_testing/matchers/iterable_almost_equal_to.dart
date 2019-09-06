import 'package:test/test.dart';

Matcher iterableAlmostEqualTo(Iterable<double> expected,
    [double precision = 1e-5]) =>
    pairwiseCompare<double, double>(
        expected,
            (expectedVal, actualVal) =>
        (expectedVal - actualVal).abs() <= precision,
        '');
