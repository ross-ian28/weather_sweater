class ForcastSerializer
  def self.get_forcast(data)
    {
      data: {
        id: nil,
        type: "forcast",
        attributes: {
          current_weather: {
            datetime: Time.at(data.current[:dt]).utc.strftime("%Y-%m-%d %H:%M:%S"),
            sunrise: Time.at(data.current[:sunrise]).utc.strftime("%Y-%m-%d %H:%M:%S"),
            sunset: Time.at(data.current[:sunset]).utc.strftime("%Y-%m-%d %H:%M:%S"),
            temperature: data.current[:temp],
            feels_like: data.current[:feels_like],
            humidity: data.current[:humidity],
            uvi: data.current[:uvi],
            visibility: data.current[:visibility],
            conditions: data.current[:weather][0][:description],
            icon: data.current[:weather][0][:icon]
          },
          daily_weather: data.daily.take(5).map do |day|
            {
              date: Time.at(day[:dt]).utc.strftime("%Y-%m-%d"),
              sunrise: Time.at(day[:sunrise]).utc.strftime("%Y-%m-%d %H:%M:%S"),
              sunset: Time.at(day[:sunset]).utc.strftime("%Y-%m-%d %H:%M:%S"),
              max_temp: day[:temp][:max],
              min_temp: day[:temp][:min],
              conditions: day[:weather][0][:description],
              icon: day[:weather][0][:icon]
            }
          end,
          hourly_weather: data.hourly.take(8).map do |hour|
            {
              time: Time.at(hour[:dt]).utc.strftime("%H:%M:%S"),
              temperature: hour[:temp],
              conditions: hour[:weather][0][:description],
              icon: hour[:weather][0][:icon]
            }
          end
        }
      }
    }
  end
end
