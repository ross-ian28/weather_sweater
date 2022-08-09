# About the project
 An application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

### Gems
   ![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
   ![capybara](https://img.shields.io/gem/v/capybara?label=capybara&style=flat-square)
   ![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
   ![figaro](https://img.shields.io/gem/v/figaro?color=blue&label=figaro)
   ![faraday](https://img.shields.io/gem/v/faraday?color=blue&label=faraday)

## Set Up
- Clone this repo
- `bundle install`
- `rails s`

## Database Creation
- `rails db:{create,migrate}`

## Api Keys
Sign up for api keys here

[Geocode Api](https://developer.mapquest.com/)

[OpenWeather Api](https://openweathermap.org/)

Put your key in the config/application.yml file in the format:

geocode_api_key: geocode key

weather_api_key: open weather key

## Testing Instructions
 - Clone this repo
 - in terminal
    * bundle install
    * bundle exec rspec

## End Points

```
{
  "data": {
        "id": "2511",
        "type": "item",
        "attributes" : {
          "name": "apple",
          "expiration": "2112-12-21"
        }
  }
}
```
