use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.06

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/MooseX/Storage.pm',
    'lib/MooseX/Storage/Base/WithChecksum.pm',
    'lib/MooseX/Storage/Basic.pm',
    'lib/MooseX/Storage/Deferred.pm',
    'lib/MooseX/Storage/Engine.pm',
    'lib/MooseX/Storage/Engine/IO/AtomicFile.pm',
    'lib/MooseX/Storage/Engine/IO/File.pm',
    'lib/MooseX/Storage/Engine/Trait/DisableCycleDetection.pm',
    'lib/MooseX/Storage/Engine/Trait/OnlyWhenBuilt.pm',
    'lib/MooseX/Storage/Format/JSON.pm',
    'lib/MooseX/Storage/Format/Storable.pm',
    'lib/MooseX/Storage/Format/YAML.pm',
    'lib/MooseX/Storage/IO/AtomicFile.pm',
    'lib/MooseX/Storage/IO/File.pm',
    'lib/MooseX/Storage/IO/StorableFile.pm',
    'lib/MooseX/Storage/Meta/Attribute/DoNotSerialize.pm',
    'lib/MooseX/Storage/Meta/Attribute/Trait/DoNotSerialize.pm',
    'lib/MooseX/Storage/Traits/DisableCycleDetection.pm',
    'lib/MooseX/Storage/Traits/OnlyWhenBuilt.pm',
    'lib/MooseX/Storage/Util.pm'
);

notabs_ok($_) foreach @files;
done_testing;
