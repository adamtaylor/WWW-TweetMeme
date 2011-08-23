use Test::More tests => 2;
use Test::Exception;

use WWW::TweetMeme;

my $tweetmeme;

throws_ok { $tweetmeme = WWW::TweetMeme->get_url_info }
    qr/URL argument expected/, 'Throws exception with no arguments';

my $args = { url => 'http://www.google.com' };
lives_ok { $tweetmeme = WWW::TweetMeme->get_url_info( $args ) }
    'Created TweetMeme object';
