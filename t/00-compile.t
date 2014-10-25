use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.027

use Test::More 0.94 tests => 12 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



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



# no fake home requested

use IPC::Open3;
use IO::Handle;

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stdin = '';     # converted to a gensym by open3
    my $stderr = IO::Handle->new;
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';

    my $pid = open3($stdin, '>&STDERR', $stderr, qq{$^X -Mblib -e"require q[$lib]"});
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
