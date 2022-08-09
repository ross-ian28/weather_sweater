class FutureForecast
  attr_reader :temp, :conditions

  def initialize(data)
    if data[:moonrise] == nil
      @temp = data[:temp]
    else
      @temp = data[:temp][:day]
    end
    
    @conditions = data[:weather][0][:description]
  end
end
