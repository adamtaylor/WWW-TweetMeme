use Test::More tests => 2;
use Test::Exception;

use WWW::TweetMeme;

my $tweetmeme;

lives_ok { $tweetmeme =  WWW::TweetMeme->new } 'Created TweetMeme object';
