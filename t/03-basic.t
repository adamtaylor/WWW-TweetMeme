use Test::More tests => 2;

use WWW::TweetMeme;

SKIP: {
    skip 'Set $ENV{REALLY_TEST_API} to run', 2 unless $ENV{REALLY_TEST_API};
 
    my $resp;

    ok(
        $resp = WWW::TweetMeme->get_url_info({ url => 'http://www.twitter.com' }),
        'Got a response from the API'
    );

    like( $resp->{story}->{url_count}, qr/\d+/, 'Returned URL count for the URL' );
};

