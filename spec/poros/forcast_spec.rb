require 'rails_helper'

RSpec.describe Forcast do
  it 'populates forcast fields from JSON response', :vcr do 
    data = {:current=>
    {:dt=>1659848283,
     :sunrise=>1659824984,
     :sunset=>1659876728,
     :temp=>90.7,
     :feels_like=>86.5,
     :humidity=>12,
     :uvi=>8.8,
     :visibility=>10000,
     :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]},
   :hourly=>
    [{:dt=>1659844800,
      :temp=>90.14,
      :feels_like=>86.04,
      :pressure=>1003,
      :humidity=>13,
      :dew_point=>32.72,
      :uvi=>7.54,
      :clouds=>80,
      :visibility=>10000,
      :wind_speed=>11.77,
      :wind_deg=>260,
      :wind_gust=>13.22,
      :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
      },
     {:dt=>1659848400,
      :temp=>90.7,
      :feels_like=>86.5,
      :pressure=>1003,
      :humidity=>12,
      :dew_point=>31.28,
      :uvi=>8.8,
      :clouds=>80,
      :visibility=>10000,
      :wind_speed=>13.29,
      :wind_deg=>255,
      :wind_gust=>15.73,
      :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}
    ],
    :daily=>
     [{:dt=>1659848400,
       :sunrise=>1659824984,
       :sunset=>1659876728,
       :temp=>{:day=>90.7, :min=>72.95, :max=>93.67, :night=>80.98, :eve=>92.53, :morn=>72.95},
       :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
     },
      {:dt=>1659934800,
       :sunrise=>1659911452,
       :sunset=>1659963047,
       :temp=>{:day=>95.11, :min=>75.43, :max=>98.55, :night=>82.54, :eve=>97.38, :morn=>75.52},
       :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]
     }
    ]
    }

    weather = Forcast.new(data)

    expect(weather).to be_a Forcast

    expect(weather.current[:dt]).to eq(data[:current][:dt])
    expect(weather.current[:weather][0][:description]).to eq(data[:current][:weather][0][:description])

    expect(weather.hourly[0][:dt]).to eq(data[:hourly][0][:dt])
    expect(weather.hourly[0][:weather][0][:description]).to eq(data[:hourly][0][:weather][0][:description])

    expect(weather.daily[0][:dt]).to eq(data[:daily][0][:dt])
    expect(weather.daily[0][:weather][0][:description]).to eq(data[:daily][0][:weather][0][:description])
  end
end
