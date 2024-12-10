#!/usr/bin/env perl

use Data::Dumper;

use OpenAPI::Client::OpenAI;

my @messages = (
    {
        role => 'system',
        content =>
          'You are a helpful assistant. You are here to provide information and answer questions to the best of your ability.',
    },
    {
        role    => 'user',
        content => 'What is the capital of Syria?',
    },
);

# The OPENAI_API_KEY environment variable must be set
# See https://platform.openai.com/api-keys and ENVIRONMENT VARIABLES below
my $client = OpenAPI::Client::OpenAI->new();
my $tx     = $client->createChatCompletion(
    {
        body => {
            model       => 'gpt-4o-mini',
            messages    => \@messages,
            temperature =>
              0.5,    # optional, between 0 and 1, with 0 being the least random
        },
    }
);
my $response_data = $tx->res->json;
print Dumper($response_data);
