# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 5 };
use Lingua::FeatureMatrix;
ok(1); # If we made it this far, we're ok.

#########################

warn "loading examples/Phone class...\n";
use lib 'examples';
use Phone;
ok(2); # If we made it this far, we're ok.

warn "loading examples/phonematrix.dat...\n";
my $matrix =
  Lingua::FeatureMatrix->new(eme => 'Phone',
			     file => 'examples/phonematrix.dat');

ok(defined $matrix);

my $sibilants =
  join(' ', sort $matrix->listFeatureClassMembers('SIBILANT'));
warn "sibilants are: $sibilants\n";
ok($sibilants eq 'CH J S SH Z ZH');

my $affricates =
  join(' ', sort $matrix->listFeatureClassMembers('AFF'));
warn "affricates are: $affricates\n";
ok($affricates eq 'CH J');
