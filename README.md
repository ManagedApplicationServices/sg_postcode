# SgPostcode

[![Build
Status](https://travis-ci.org/ManagedApplicationServices/sg_postcode.svg?branch=master)](https://travis-ci.org/ManagedApplicationServices/sg_postcode)

##Features

- Convert an array of SG Postcode to an array of place info, include long, lat, and format address

- Convert a range of SG Postcode to an array of place info, include long, lat, and format address of all valid postcode

- Support different outputs


##Support Versions

- ruby > 1.9, recommend > 2.0.0

##Install

> TODO

##Usage

1. To convert an array of SG postcode to an array of place info

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

  **TODO: will improve it

- To convert a range of SG postcode to an array of place info

##Contribute

Feel free to fork it and send me PRs to help it better

##Copyright

This project rocks and uses MIT-LICENSE.
