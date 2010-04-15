#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {        
    local $@;
    plan skip_all => "MooseX::Storage::Format::JSONpm required for this test"
        unless eval "require MooseX::Storage::Format::JSONpm; 1";
}

plan tests => 6;
use_ok('MooseX::Storage');

{
    package Foo;
    use Moose;
    use MooseX::Storage;

    with Storage(format => [ JSONpm => { json_opts => { pretty => 1 } } ] );

    has 'string' => ( is => 'ro', isa => 'Str' );
    has 'float'  => ( is => 'ro', isa => 'Num' );
}

{
    my $foo = Foo->new(
        string => 'foo',
        float  => 10.5,
    );
    isa_ok( $foo, 'Foo' );

    my $json = $foo->freeze;

    isnt(
        index($json, "\n"),
        -1,
        "there are newlines in our JSON, because it is pretty",
    ) or diag $json;

}

{
    package Bar;
    use Moose;
    use MooseX::Storage;

    our $VERSION = '0.01';

    with 'MooseX::Storage::Deferred';

    has 'x' => (is => 'rw', isa => 'Int');
    has 'y' => (is => 'rw', isa => 'Int');
}

for my $jsonpm (
  [ string => 'JSONpm' ],
  [ aref0p => [ JSONpm => ] ],
  [ aref1p => [ JSONpm => { json_opts => { pretty => 1 } } ] ],
) {
    my ($name, $p) = @$jsonpm;

    my $json = eval { Bar->new(x => 10, y => 20)->freeze({ format => $p }) };

    is_deeply(
        JSON->new->decode($json),
        {
            '__CLASS__' => 'Bar-0.01',
            x => 10,
            y => 20,
        },
        "correct deferred freeze from $name",
    );
}
