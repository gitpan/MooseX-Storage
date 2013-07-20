use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.009

use Test::More 0.94;



use Capture::Tiny qw{ capture };

my @module_files = qw(
lib/MooseX/Storage/Engine/Trait/OnlyWhenBuilt.pm
lib/MooseX/Storage/Engine/Trait/DisableCycleDetection.pm
lib/MooseX/Storage/Deferred.pm
lib/MooseX/Storage/Engine.pm
lib/MooseX/Storage/Meta/Attribute/Trait/DoNotSerialize.pm
lib/MooseX/Storage/Base/WithChecksum.pm
lib/MooseX/Storage/Meta/Attribute/DoNotSerialize.pm
lib/MooseX/Storage/Traits/OnlyWhenBuilt.pm
lib/MooseX/Storage/Traits/DisableCycleDetection.pm
lib/MooseX/Storage.pm
lib/MooseX/Storage/Basic.pm
lib/MooseX/Storage/Util.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (sort @module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require qq[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}

if ($ENV{AUTHOR_TESTING}) { is(scalar(@warnings), 0, 'no warnings found'); }



BAIL_OUT("Compilation problems") if !Test::More->builder->is_passing;

done_testing;
