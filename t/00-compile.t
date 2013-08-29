use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.021

use Test::More 0.94;



my @module_files = (
    'MooseX/Storage.pm',
    'MooseX/Storage/Base/WithChecksum.pm',
    'MooseX/Storage/Basic.pm',
    'MooseX/Storage/Deferred.pm',
    'MooseX/Storage/Engine.pm',
    'MooseX/Storage/Engine/Trait/DisableCycleDetection.pm',
    'MooseX/Storage/Engine/Trait/OnlyWhenBuilt.pm',
    'MooseX/Storage/Meta/Attribute/DoNotSerialize.pm',
    'MooseX/Storage/Meta/Attribute/Trait/DoNotSerialize.pm',
    'MooseX/Storage/Traits/DisableCycleDetection.pm',
    'MooseX/Storage/Traits/OnlyWhenBuilt.pm',
    'MooseX/Storage/Util.pm'
);

my @scripts = (

);

# no fake home requested

use IPC::Open3;
use IO::Handle;
use File::Spec;

my @warnings;
for my $lib (@module_files)
{
    open my $stdout, '>', File::Spec->devnull or die $!;
    open my $stdin, '<', File::Spec->devnull or die $!;
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, $stdout, $stderr, qq{$^X -Mblib -e"require q[$lib]"});
    waitpid($pid, 0);
    is($? >> 8, 0, "$lib loaded ok");

    if (my @_warnings = <$stderr>)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};

BAIL_OUT("Compilation problems") if !Test::More->builder->is_passing;

done_testing;
