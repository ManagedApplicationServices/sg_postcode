# SgPostcode :gem:

[![Build
Status](https://travis-ci.org/ManagedApplicationServices/sg_postcode.svg?branch=master)](https://travis-ci.org/ManagedApplicationServices/sg_postcode)

Convert an array of **Postcode** to an array of place info, include **long, lat, and format address**.


##Requirement

- **ruby > 1.9**, recommend **> 2.0.0**
- **redis**

##Install

 To install this gem, simply use `gem install sg_postcode` or add this line

 ```
   gem 'sg_postcode', '~> 1.2.3'
 ```
 to the **Gemfile**, and run `bundle install`. :grin:


##Usage

Follow this snippet

```
 require 'sg_postcode'
 postcode = ['238432', '234444']
 SgPostcode::Array.new(postcodes).convert
```

There are some options:

- `response_type`: default is :json
- `host`: default :Google

Actually right now, this gem just accept these default value :smirk:

####ADVANCE USAGES:


1. Key Path:

  To edit the response data's fields, you can take a look at `lib/sg_postcode/response/config.rb`

  We use `#dig` method, that is implement in [this tutorial](http://thingsinabucket.com/2015/07/01/three_little_hacks/) to get the value in the hash. So we call `key_path` for the path of many keys.
  Checkout [this snippet](https://github.com/ManagedApplicationServices/sg_postcode/blob/develop/lib/sg_postcode/response/json_output.rb#L41-L45) for more information.

  The `.add_key_path` and `.remove_key_path` will be implement in the future version.

2. Redis config

  In default, Redis will use `localhost` and port `6379`, if you want to customize, you can set the value for the environment variable `REDIS_URL`.

  For example:

  ```
    ENV[`REDIS_URL`] =  "redis://:p4ssw0rd@10.0.1.1:6380/15"
  ```

  Check out the [`redis` gem](https://github.com/redis/redis-rb#getting-started) for more information.

  The gem use **Hash** type to store the **postcode request**. The **Hash** key is defined in `lib/sg_postcode/services/cache_adapter.rb`

  You can change it, just call `SgPostcode::CacheAdapter.hashname = 'IamAwesomeStore'`

##Contribute

Feel free to fork it and send me PRs and Issues, comments to help it better. :+1:

This project use [Zenhub](http://zenhub.io) as a PM tool.

##Copyright

This project rocks and uses MIT-LICENSE.
