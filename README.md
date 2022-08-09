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

### Retrieve weather for a city
```
get /api/v1/forecast?location=city,state abbreviation
```

```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
### User Registration
```
post /api/v1/users
```
```
body:
  {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
  }
```

```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Login
```
post /api/v1/sessions
```
```
body:
  {
    "email": "whatever@example.com",
    "password": "password"
  }
```

```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Road Trip
```
post /api/v1/road_trip
```
```
body:
  {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }
```

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```
