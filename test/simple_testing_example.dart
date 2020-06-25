
import 'package:simple_testing/simple_testing.dart';
import 'package:test/test.dart';

// This is a function that needs to be tested.
//
// This function has no practical use. Written only to illustrate the use of the
// package [simple_testing].
//
// She calculates the sum of the numbers of list [a], and the sum of the numbers
// of list [b]. Then she divides the sum of [a] by the sum of [b]. The lists
// should not be empty. They should be equal in length, and their length should
// be in the range of 2 to 5 values. Numbers should not be empty either. And
// the sum of list [b] should not be zero.
//
// In order to make sure that all these conditions are checked in the
// function (in the form of Assertions or Exceptions) and the
// packet [simple_testing] is created.
//
// Try commenting out the checks marked with an "*" as if you forgot to write
// this check. Then run the test and see how it works.
double calculate(List<double> a, List<double> b) {
  assert(a != null && b != null); // *
  assert(a.length == b.length); // *
  assert(a.length >= 2 && a.length <= 5); // *
  assert(b.length >= 2 && b.length <= 5); // *

  var sumA = 0.0, sumB = 0.0;
  for (var i = 0; i < a.length; i++) {
    assert(a[i] != null && b[i] != null); // *
    sumA += a[i];
    sumB += b[i];
  }
  if (sumB == 0.0) {
    throw 'The sum of the numbers in list B is zero. Cannot be divided by zero.'; // *
  }
  return sumA/sumB;
}

// This function shows how you can verify that the [calculate] function
// implements all the necessary checks in the form of Assertions or Exceptions.
// This helps [simple_testing] package.
void main() {
  group('Constructors', () {

    test('Assertions check example', () {
      tryAssertion(() { calculate(null, [1, 2]); });
      tryAssertion(() { calculate([1, 2], null); });
      tryAssertions([
        () { calculate([], [1, 2]); },
        () { calculate([1, 2], []); },
        () { calculate([1, 2], [1, 2, 3]); },
        () { calculate([1, 2, 3], [1, 2]); },
        () { calculate([1], [2]); },
        () { calculate([1, 2, 3, 4, 5, 6], [1, 2, 3, 6, 7, 8]); },
        () { calculate([1, null, 3], [1, 2, null]); }
      ]);
    });

    test('Exceptions check example', () {
      tryException(() { calculate([1, 2, 3], [1, -3, 2]); });
    });

    test('Assertions or exceptions check example', () {
      tryAssOrExc(() { calculate(null, [1, 2]); });
      tryAssOrExc(() { calculate([1, 2], [1, 2, 3]); });
      tryAssOrExc(() { calculate([1, 2, 3], [1, -3, 2]); });
    });

  });

}