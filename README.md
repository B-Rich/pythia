[![Build Status](https://travis-ci.org/IcaliaLabs/pythia.svg?branch=specs)](https://travis-ci.org/IcaliaLabs/pythia)
[![Code Climate](https://codeclimate.com/repos/581760cdbe815c29e20045b5/badges/c73deabc9bfe6628467c/gpa.svg)](https://codeclimate.com/repos/581760cdbe815c29e20045b5/feed)
[![Test Coverage](https://codeclimate.com/repos/581760cdbe815c29e20045b5/badges/c73deabc9bfe6628467c/coverage.svg)](https://codeclimate.com/repos/581760cdbe815c29e20045b5/coverage)
[![Issue Count](https://codeclimate.com/repos/581760cdbe815c29e20045b5/badges/c73deabc9bfe6628467c/issue_count.svg)](https://codeclimate.com/repos/581760cdbe815c29e20045b5/feed)
![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)


<div style="text-align:center">
  <img src="assets/logo.png" width="980">
</div>

Pythia is an open source ruby gem that acts as a wrapper for IBM Watson's [Personality Insights
service API](https://www.ibm.com/watson/services/personality-insights/).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pythia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pythia

## Usage

### Configuration

In order for Pythia to work correctly, it is important that you [set up an IBM Bluemix account of your own](https://console.ng.bluemix.net/) and that your trial period hasn't ended (or, for that matter, that you've registered for a paid account)

First require `pythia` in your file:

```ruby
require 'pythia'
```

Then add the following configuration block:

```ruby

Pythia.configure do |config|
	config.username = SOME_USERNAME
	config.password = SOME_PASSWORD
	config.base_uri = "https://gateway.watsonplatform.net/personality-insights/api"
end
```

**Note: The username and password are not your Bluemix credentials. These
credentials are specific to the Personality Insights API and must
be obtained from said section of Watson's Docs**

### Generating a Personality Insight Profile

The Personality Insights API is capable of generating a personality
profile for the author of the input text it is given. According to the
Personality Insights documentation, the service accepts up to 20 MB of
input text, but it actually requires much less. The minimum necessary
input is around 600 words, but it is recommended to use an input text of
1,200 or more words for more acurate profiling.

## Input Format

The documentation specifies that for JSON input, the
`ContentListContainer` object type should be used. Said object type looks
like this:

```
{
  "contentItems": [
    {
      "content": INPUT_TEXT,
      "id": "string",
      "created": 0,
      "updated": 0,
      "contenttype": "text/plain",
      "language": "ar",
      "parentid": "null",
      "reply": false,
      "forward": false
    }
  ]
}
```

For more information on providing input for this service, check out the
[Personality Insights API Reference](https://www.ibm.com/watson/developercloud/personality-insights/api/v3/#profile).

## Using Pythia to generate a new Personality Insight Profile

Once you've constructed the `ContentListContainer` object, you can use
the `profile` method of the `Pythia::Insights` class to generate a full
profile of the input text's author.

```ruby

@author_profile = Pythia::Insights.profile(content_list_container)

```

This method should return a `Pythia::Profile` object containing the
following readable properties, which make up the profile:

- Word Count: The number of words in the input text
- Processed Language: The language that was detected in the text or
  specified in the request
- Personality: A `Pythia::Personality` object that lists the Big 5
  personality traits and how the input text scores in each of them
- Needs: A `Pythia::Needs` object that contains needs characteristics
  as well as their score and percentile as calculated from the input
text.
- Values: A `Pythia::Values` object that contains values
  characteristics as well as their score and percentile as
calculated from the input text.
- Behavior: A `Pythia::Behavior` object that lists behavioral traits as
  detected in the input text
- Consumption Preferences: A `Pythia::ConsumptionPreferences` object
  that lists the author's consumption preferences as detected in the
input text.
- Warnings: A `Pythia::Warnings` object that lists the warning_ids and
  respective warning messages that were returned from the request.

For a more comprehensive understading of the nature and meaning of the
contents of these attributes, please read the [API documentation for the
Personality Insights service.](https://www.ibm.com/watson/developercloud/personality-insights/api/v3/#profile)

Since `profile` is a class method, there's no need to instantiate
`Pythia::Insights` first.

**Note: Remember to convert the `ContentListContainer` object to JSON
through `obj.to_json` before using it in the `profile` method. You must
`require 'json'` for this to work.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/icalialabs/pythia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
