# simple_testing package

This is a package to simplify writing tests.

It contains tools to verify your code. For example, you can check whether exceptions and assertions
are triggered where they should be. Probably they are simply absent, and they need to be added.

Here is a list of features that the package contains.

Function      | Description
--------------|------------
tryAssertion  | The function allows you to check whether an assertion is triggered
tryException  | The function allows you to check whether an exception is triggered
tryAssOrExc   | The function allows you to check whether an exception or assertion is triggered
tryAssertions | Using this function, you can check the list of functions for triggering assertions
tryExceptions | Using this function, you can check the list of functions for triggering exceptions
tryAssOrExcs  | Using this function, you can check the list of functions for triggering assertions or exceptions

For a more detailed introduction to using the simple_testing package, look and run the
[example](https://github.com/iLnaar/simple_testing/blob/master/test/simple_testing_example.dart)
from test directory.