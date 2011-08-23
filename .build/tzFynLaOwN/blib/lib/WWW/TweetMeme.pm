# ABSTRACT: Perl wrapper for the TweetMeme API
package WWW::TweetMeme;

use strict;
use warnings;

use Carp;
use LWP::UserAgent;
use JSON;

my $API_BASE = 'http://api.tweetmeme.com';

sub get_url_info {
    my ( $class, $args ) = @_;

    my $url = delete $args->{url};
    croak 'URL argument expected' unless defined $url;
    croak 'Unexpected arguments provided' if %{$args};

    my $ua = _build_ua();
    my $api_url = $API_BASE . 'url_info.json?url=';

    my $response = $ua->get( $api_url . $args->{url} );

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
1;
