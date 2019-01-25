require 'date'

class Person
  attr_reader :name, :date

  def initialize(name)
    @name = name
    @month = nil
    @date = nil
  end

  def set_month(month)
    @month = month.to_i
  end

  def show_month
    Date::MONTHNAMES[@month]
  end

  def set_date(date)
    @date = date.to_i
  end

  def is_birthday
    same_month
    same_date
  end

  def days_till_birthday
  bday = Date.new(todays_date.year, @month, @date)
  bday = bday.next_year if todays_date >= bday
  (bday - todays_date).to_i
  end

  def real_date
    Date.valid_date?(todays_date.year, @month, @date)
  end


  private

  def todays_date
    Date.today
  end

  def same_month
    todays_date.month == @month
  end

  def same_date
    todays_date.day == @date
  end
end
