require 'rubygems'
require 'sinatra'
require 'tilt/erb'
require 'gon-sinatra'
require 'sinatra/reloader' if development?

module MyChat
  class SinatraApp < Sinatra::Base

    register Gon::Sinatra

    Tilt.register Tilt::ERBTemplate, 'html.erb'

    # enable :reloader

    # set :environment, :development

    set :environment, :production
    set :bind, 'shrouded-cliffs-5129.herokuapp.com'

    get '/' do
      erb :index
    end
  end
end
