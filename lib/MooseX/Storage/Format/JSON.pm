package MooseX::Storage::Format::JSON;
# ABSTRACT: A JSON serialization role
$MooseX::Storage::Format::JSON::VERSION = '0.48';
use Moose::Role;
use JSON::MaybeXS;
use namespace::autoclean;

requires 'pack';
requires 'unpack';

sub thaw {
    my ( $class, $json, @args ) = @_;

    # TODO ugh! this is surely wrong and should be fixed.
    utf8::encode($json) if utf8::is_utf8($json);

    $class->unpack( JSON::MaybeXS->new({ utf8 => 1 })->decode( $json), @args );
}

sub freeze {
    my ( $self, @args ) = @_;

    my $json = JSON::MaybeXS->new({ utf8 => 1, canonical => 1 })->encode($self->pack(@args));

    # if it's valid utf8 mark it as such
    # TODO ugh! this is surely wrong and should be fixed.
    utf8::decode($json) if !utf8::is_utf8($json) and utf8::valid($json);

    return $json;
}

no Moose::Role;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MooseX::Storage::Format::JSON - A JSON serialization role

=head1 VERSION

version 0.48

=head1 SYNOPSIS

  package Point;
  use Moose;
  use MooseX::Storage;

  with Storage('format' => 'JSON');

  has 'x' => (is => 'rw', isa => 'Int');
  has 'y' => (is => 'rw', isa => 'Int');

  1;

  my $p = Point->new(x => 10, y => 10);

  ## methods to freeze/thaw into
  ## a specified serialization format
  ## (in this case JSON)

  # pack the class into a JSON string
  $p->freeze(); # { "__CLASS__" : "Point", "x" : 10, "y" : 10 }

  # unpack the JSON string into a class
  my $p2 = Point->thaw('{ "__CLASS__" : "Point", "x" : 10, "y" : 10 }');

=head1 METHODS

=over 4

=item B<freeze>

=item B<thaw ($json)>

=back

=head2 Introspection

=over 4

=item B<meta>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHORS

=over 4

=item *

Chris Prather <chris.prather@iinteractive.com>

=item *

Stevan Little <stevan.little@iinteractive.com>

=item *

יובל קוג'מן (Yuval Kogman) <nothingmuch@woobling.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2007 by Infinity Interactive, Inc..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
