#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 12;

BEGIN {
    use_ok('MooseX::Storage');
}

{

    package Foo;
    use Moose;
    use MooseX::Storage;

    with Storage;

    has 'number'  => ( is => 'ro', isa => 'Int' );
    has 'string'  => ( is => 'ro', isa => 'Str' );
    has 'boolean' => ( is => 'ro', isa => 'Bool' );
    has 'float'   => ( is => 'ro', isa => 'Num' );
    has 'array'   => ( is => 'ro', isa => 'ArrayRef' );
    has 'hash'    => ( is => 'ro', isa => 'HashRef' );
    has 'object'  => ( is => 'ro', isa => 'Foo' );
}

{
    my $foo = Foo->new(
        number  => 10,
        string  => 'foo',
        boolean => 1,
        float   => 10.5,
        array   => [ 1 .. 10 ],
        hash    => { map { $_ => undef } ( 1 .. 10 ) },
        object  => Foo->new( number => 2 ),
    );
    isa_ok( $foo, 'Foo' );

    is_deeply(
        $foo->pack,
        {
            __CLASS__ => 'Foo',
            number    => 10,
            string    => 'foo',
            boolean   => 1,
            float     => 10.5,
            array     => [ 1 .. 10 ],
            hash      => { map { $_ => undef } ( 1 .. 10 ) },
            object    => {
                            __CLASS__ => 'Foo',
                            number    => 2
                         },
        },
        '... got the right frozen class'
    );
}

{
    my $foo = Foo->unpack(
        {
            __CLASS__ => 'Foo',
            number    => 10,
            string    => 'foo',
            boolean   => 1,
            float     => 10.5,
            array     => [ 1 .. 10 ],
            hash      => { map { $_ => undef } ( 1 .. 10 ) },
            object    => {
                            __CLASS__ => 'Foo',
                            number    => 2
                         },
        }
    );
    isa_ok( $foo, 'Foo' );

    is( $foo->number, 10,    '... got the right number' );
    is( $foo->string, 'foo', '... got the right string' );
    ok( $foo->boolean,       '... got the right boolean' );
    is( $foo->float,  10.5,  '... got the right float' );
    is_deeply( $foo->array, [ 1 .. 10 ], '... got the right array' );
    is_deeply(
        $foo->hash,
        { map { $_ => undef } ( 1 .. 10 ) },
        '... got the right hash'
    );

    isa_ok( $foo->object, 'Foo' );
    is( $foo->object->number, 2,
        '... got the right number (in the embedded object)' );
}
