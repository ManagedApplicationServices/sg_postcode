# SgPostcode

[![Build
Status](https://travis-ci.org/ManagedApplicationServices/sg_postcode.svg?branch=master)](https://travis-ci.org/ManagedApplicationServices/sg_postcode)

##Features

- Convert an array of SG Postcode to an array of place info, include long, lat, and format address

- Support different outputs (LATER)


##Support Versions

- ruby > 1.9, recommend > 2.0.0

##Install

 To install this gem, simply use `gem install sg_postcode` or add this line

 ```
   gem 'sg_postcode', '~> 1.1.1'
 ```
 to the **Gemfile**, and run `bundle install`


##Usage

Follow this snippet

  ```
    require 'sg_postcode'

	postcode = ['238432', '234444']
    SgPostcode::Array.new(postcodes).convert
  ```


  `error_ignore`: default `true`.

  So if call ``SgPostcode::Array.new(postcodes).convert(error_ignore: false)``
  it'll stop if there are any invalid postcode.

  options for SgPostcode::Array.new(postcodes, options)

  - `service_provider`: default is `:Google`
  - `response_type`: default is `:json`

  You can also config the returns fields in result, call

  `SgPostCode::ResponseBuilder::Config.fields` (also #add_key_path, #remove_key_path)


##Contribute

Feel free to fork it and send me PRs to help it better.

This project use [Zenhub](http://zenhub.io) as a PM tool.

##Copyright

This project rocks and uses MIT-LICENSE.
