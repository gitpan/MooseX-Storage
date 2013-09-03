use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006000
eval "use Test::Spelling 0.12; use Pod::Wordlist::hanekomu; 1" or die $@;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
cpan
Chris
Prather
chris
Stevan
Little
stevan
Yuval
Kogman
yuval
Infinity
Interactive
Inc
Cory
Watson
gphat
Dagfinn
Ilmari
Manns�ker
ilmari
Florian
Ragwitz
rafl
Johannes
Plunien
plu
Jonathan
Rockway
jon
Yu
frequency
Jos
Boumans
jos
Karen
Etheridge
ether
Ricardo
SIGNES
rjbs
Signes
Robert
Boone
robo4288
Shawn
Moore
sartak
Tomas
Doran
t0m
bobtfish
nothingmuch
lib
MooseX
Storage
Engine
IO
File
Format
JSON
Base
WithChecksum
AtomicFile
Traits
OnlyWhenBuilt
Basic
Meta
Attribute
Trait
DoNotSerialize
Deferred
DisableCycleDetection
Storable
StorableFile
YAML
Util
