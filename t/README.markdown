# Linenoise Tests

These are the tests for linenoise.

## Running the tests

    make test

which requires having Expect and Perl installed. This will probably change in the near future.

To run a test with extra debugging information:

    LINENOISE_TEST_DEBUG=3 perl ./t/001_linenoise_example.t

