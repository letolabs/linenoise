#!usr/bin/env perl

use 5.010;
use Expect;
use autodie;
use Test::Most;

plan;

my $command = "linenoise_example";
my @params  = ();

my $exp = Expect->spawn($command, @params) or die "Cannot spawn $command: $!\n";

# we now give various strings to the program and verify the correct interactive response

my $timeout = 5; # seconds

# we now make sure linenoise Does The Right Thing when we type the input tests

$exp->expect($timeout,
                    [
                        qr/hello>/ => sub {
                                        my $exp = shift;
                                        $exp->send("bar\n");
                                        exp_continue;
                                      }
                    ],);

done_testing;
