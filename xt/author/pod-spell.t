use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006008
use Test::Spelling 0.12;
use Pod::Wordlist;


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
יובל
קוג
Yuval
Kogman
nothingmuch
Infinity
Interactive
Inc
Karen
Etheridge
ether
Tomas
Doran
bobtfish
Ricardo
Signes
rjbs
Jos
Boumans
jos
Shawn
Moore
sartak
Jonathan
Yu
frequency
Robert
Boone
robo4288
Dagfinn
Ilmari
Mannsåker
ilmari
Cory
Watson
gphat
Dan
Brook
dan
David
Steinbrunner
dsteinbrunner
Jason
Pope
cowholio4
Johannes
Plunien
plu
Rockway
jon
Florian
Ragwitz
rafl
Golden
dagolden
lib
MooseX
Storage
Engine
IO
File
Format
JSON
Trait
DisableCycleDetection
Deferred
OnlyWhenBuilt
Basic
Meta
Attribute
DoNotSerialize
StorableFile
Util
AtomicFile
Storable
Traits
YAML
Base
WithChecksum
