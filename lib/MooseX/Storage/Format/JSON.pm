
package MooseX::Storage::Format::JSON;
use Moose::Role;

use JSON::Any;

our $VERSION = '0.01';

requires 'pack';
requires 'unpack';

sub thaw {
    my ( $class, $json ) = @_;
    $class->unpack( JSON::Any->jsonToObj($json) );
}

sub freeze {
    my $self = shift;
    JSON::Any->objToJson( $self->pack() );
}

1;

__END__

=pod

=head1 NAME

MooseX::Storage::Format::JSON

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

=head1 AUTHOR

Chris Prather E<lt>chris.prather@iinteractive.comE<gt>

Stevan Little E<lt>stevan.little@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


