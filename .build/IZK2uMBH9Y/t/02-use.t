use Test::More tests => 2;
use Test::Exception;

use WWW::TweetMeme;

my $tweetmeme;

throws_ok {
    $tweetmeme = WWW::TweetMeme->get_url_info
} 'Throws exception with no arguments';

lives_ok {
    $tweetmeme = WWW::TweetMeme->get_url_info({ url => 'http://www.google.com'})
} 'Created TweetMeme object';
