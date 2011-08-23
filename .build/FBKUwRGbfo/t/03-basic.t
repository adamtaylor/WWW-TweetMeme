use Test::More tests => 1;

SKIP: {
    skip 'Set $ENV{REALLY_TEST_API} to run', 1 unless $ENV{REALLY_TEST_API};
 
    ok(
        WWW::TweetMeme->get_url_info({ url => 'http://www.twitter.com' }),
        'Got a response from the API'
    );
};

