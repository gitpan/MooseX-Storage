package MooseX::Storage::Engine::IO::AtomicFile;
# ABSTRACT: The actual atomic file storage mechanism.
$MooseX::Storage::Engine::IO::AtomicFile::VERSION = '0.48';
use Moose;
use IO::AtomicFile;
use Carp 'confess';
use namespace::autoclean;

extends 'MooseX::Storage::Engine::IO::File';

sub store {
    my ($self, $data) = @_;
    my $fh = IO::AtomicFile->new($self->file, 'w')
        || confess "Unable to open file (" . $self->file . ") for storing : $!";

    # TODO ugh! this is surely wrong and should be fixed.
    $fh->binmode(':utf8') if utf8::is_utf8($data);
    print $fh $data;
    $fh->close()
        || confess "Could not write atomic file (" . $self->file . ") because: $!";
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MooseX::Storage::Engine::IO::AtomicFile - The actual atomic file storage mechanism.

=head1 VERSION

version 0.48

=head1 DESCRIPTION

This provides the actual means to store data to a file atomically.

=head1 METHODS

=over 4

=item B<file>

=item B<load>

=item B<store ($data)>

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
