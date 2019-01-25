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
    if @birthday.real_date
      erb(:birthday_greeter)
    else
      redirect '/error'
    end
  end

  get '/error' do
    erb(:error)
  end

  run! if app_file == $0
end
