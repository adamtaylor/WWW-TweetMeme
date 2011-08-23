use Test::More tests => 3;
use Test::Exception;

use WWW::TweetMeme;

throws_ok { WWW::TweetMeme->get_url_info }
    qr/URL argument expected/, 'get_url_info throws exception with no arguments';

my $args = { url => 'http://www.google.com' };
lives_ok { WWW::TweetMeme->get_url_info( $args ) }
    'get_url_info with correct arguments lives';

$args = { unexpected => 1, url => 'http://www.google.com' };
throws_ok { WWW::TweetMeme->get_url_info( $args ) }
    qr/Unexpected arguments provided/,
    'get_url_info throwse exception with unexecpted args';
