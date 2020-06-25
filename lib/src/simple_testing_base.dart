
part of simple_testing;

/// Simple function type with no parameters and no return values.
typedef TryFunction = void Function();

/// The function allows you to check whether an assertion is triggered
///
/// As a parameter, the callback function is specified, which should end with
/// the the activation of the assertion. If the function being checked does not
/// fail, then it does not contain the necessary checks, and they need to
/// be added.
void tryAssertion(TryFunction tryFunction) {
  try {
    tryFunction();
  } catch(e) {
    if (e.runtimeType.toString() != '_AssertionError') fail('Should throw an assertion');
  }
}

/// The function allows you to check whether an exception is triggered
///
/// As a parameter, the callback function is specified, which should end with
/// the exception. If the function being checked does not fail, then it does not
/// contain the necessary checks, and they need to be added.
void tryException(TryFunction tryFunction) {
  try {
    tryFunction();
  } catch(e) {
    if (e.runtimeType.toString() == '_AssertionError') fail('Should throw an exception');
  }
}

/// The function allows you to check whether an exception or assertion is triggered
///
/// As a parameter, the callback function is specified, which should end with
/// the exception or the activation of the assertion. If the function being
/// checked does not fail, then it does not contain the necessary checks, and
/// they need to be added.
void tryAssOrExc(TryFunction tryFunction) {
  try {
    tryFunction();
  } catch(e) {
    return;
  }
  fail('Should throw an assertion or exception');
}

/// Using this function, you can check the list of functions for triggering assertions.
///
/// It simply calls the [tryAssertion] for the entire list of callback functions.
void tryAssertions(List<TryFunction> functions) {
  if (functions != null) functions.forEach((func) => tryAssertion(() => func()));
}

/// Using this function, you can check the list of functions for triggering exceptions
///
/// It simply calls the [tryException] for the entire list of callback functions.
void tryExceptions(List<TryFunction> functions) {
  if (functions != null) functions.forEach((func) => tryException(() => func()));
}

/// Using this function, you can check the list of functions for triggering assertions or exceptions.
///
/// It simply calls the [tryAssOrExc] for the entire list of callback functions.
void tryAssOrExcs(List<TryFunction> functions) {
  if (functions != null) functions.forEach((func) => tryAssOrExc(() => func()));
}
