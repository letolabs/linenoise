#!usr/bin/env perl

use 5.010;
use Expect;
use autodie;
use Test::Most;

plan;

my $command = "linenoise_example";
my @params  = ();

my $exp = Expect->spawn($command, @params) or die "Cannot spawn $command: $!\n";

$exp->debug( $ENV{LINENOISE_TEST_DEBUG} || 0 );

# we now give various strings to the program and verify the correct interactive response

my $timeout = 5; # seconds

# we now make sure linenoise Does The Right Thing when we type the input tests

$exp->expect($timeout,
                    [
                        qr/hello>/ => sub {
                                        my $exp = shift;
                                        $exp->send("bar\n");
                                        exp_continue;
                        },
                        qr/echo: 'bar'/ => sub {
                                        # we got the expected response from sending "bar\n" !
                                        my $exp = shift;
                                        ok(1,"got our expected echo");
                                        exp_continue;
                        },
                    ],);

$exp->soft_close;

done_testing;
