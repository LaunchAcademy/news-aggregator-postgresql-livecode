require "sinatra"
require "pg"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./app/models/article"

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get '/' do
  redirect '/articles'
end

get '/articles/new' do
  erb :new
end

# Fill out routes below!

get '/articles' do
  @articles = Article.all

  erb :index
end

get '/articles/:id' do
  @article = Article.find(params["id"])

  erb :show
end


post "/articles" do
  Article.create(params)

  redirect '/articles'
end
