import 'package:test/test.dart';

Matcher iterable2dAlmostEqualTo(Iterable<Iterable<double>> expected,
    [double precision = 1e-5]) =>
    pairwiseCompare<Iterable<double>, Iterable<double>>(expected,
            (Iterable<double> expected, Iterable<double> actual) {
          if (expected.length != actual.length) {
            return false;
          }
          for (int i = 0; i < expected.length; i++) {
            if ((expected.elementAt(i) - actual.elementAt(i)).abs() >= precision) {
              return false;
            }
          }
          return true;
        }, '');
