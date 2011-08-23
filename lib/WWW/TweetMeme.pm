# ABSTRACT: Perl wrapper for the TweetMeme API
package WWW::TweetMeme;

=head1 SYNOPSIS

    use WWW::TweetMeme;
    my $response = WWW::TweetMeme->get_url_info({ url => $url });

=head1 DESCRIPTION

Simple Perl interface to the TweetMeme core API that provides information
about a URL, such as the number of times that URL has been shared on
Twitter.

=head1 METHODS

=cut

use strict;
use warnings;

use Carp;
use LWP::UserAgent;
use JSON;

my $API_BASE = 'http://api.tweetmeme.com/';

=head2 C<get_url_info>

    my $response = WWW::TweetMeme->get_url_info({ url => $url });

Returns a JSON decoded hash of information about the URL.

=cut

sub get_url_info {
    my ( $class, $args ) = @_;

    my $url = delete $args->{url};
    croak 'URL argument expected' unless defined $url;
    croak 'Unexpected arguments provided' if %{$args};

    my $ua = _build_ua();
    my $api_url = $API_BASE . 'url_info.json?url=';

    my $response = $ua->get( $api_url . $url );

    if ( $response->is_success ) {
        return decode_json $response->content;
    }
    else {
        die $response->status_line;
    }
    
}

sub _build_ua {

    my $ua = LWP::UserAgent->new;
    $ua->timeout(10);
    $ua->env_proxy;

    return $ua;

}

=head1 SEE ALSO

L<http://help.tweetmeme.com/category/developers/api/>

=head1 AUTHOR

Adam Taylor <ajct@cpan.org>

=cut

1;
