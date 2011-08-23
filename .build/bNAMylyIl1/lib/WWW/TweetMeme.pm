# ABSTRACT: Perl wrapper for the TweetMeme API
package WWW::TweetMeme;

use strict;
use warnings;

use Carp;

sub get_url_info {
    my ( $class, $args ) = @_;

    my $url = delete $args->{url};
    croak 'URL argument expected' unless defined $url;
    croak 'Unexpected arguments provided' if $args;
}
1;
