package Net::HTTP::Spore::Middleware::Header;
# ABSTRACT: Spore Middleware to add header on each request
use strict;
use warnings;
# VERSION

use Moose;
extends 'Net::HTTP::Spore::Middleware';

has 'header_name' => (isa => 'Str', is => 'rw', required => 1);
has 'header_value' => (isa => 'Str', is => 'rw', required => 1);

=method call

This method will add header_name:header_value in the header of each request

=cut
sub call {
    my ($self, $req) = @_;

    return $req->header($self->header_name, $self->header_value);
}
1;

__END__

=head1 SYNOPSIS

    my $client = Net::HTTP::Spore->new_from_spec('api.json');
    $client->enable(
        header_name  => 'Content-Type',
        header_value => 'application/json'
    );

=head1 DESCRIPTION

This module is a middleware that add header on each request. You can specify for exemple a Content-Type to pass.

=cut
