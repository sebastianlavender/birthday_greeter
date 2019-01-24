require 'sinatra/base'
require './lib/person'

class BirthdayGreeter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/birthday' do
    @birthday = Person.new(params[:name])
    @birthday.set_date(params[:date])
    @birthday.set_month(params[:month])
    erb(:birthday_greeter)
  end

  run! if app_file == $0
end
