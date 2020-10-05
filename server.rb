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

get "/articles" do
  @articles = Article.all
  erb :index
end

get "/articles/new" do
  erb :new
end

post "/articles" do
  title = params["title"]
  description = params["description"]
  url = params["url"]
  Article.create(title, description, url)
  redirect "/articles"
end

get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :show
end
