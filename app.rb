require 'sinatra'

@nombre = ''

get '/procesadorDeMail/:nombre' do
  @nombre = params[:nombre]
  erb :plantilla
  status 200
end