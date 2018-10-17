module DrivingsHelper
  def get_hours_from_date(date)
    case date.hour
      when 8
        "8.00-10.00"
      when 10
        "10.00-12.00"
      when 13
        "13.00-15.00"
      when 15
        "15.00-17.00"
      else "ошибка"
    end  
  end
end
