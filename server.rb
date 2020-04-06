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

get "/" do
  redirect "/articles"
end

get "/articles" do
  @articles = Article.all
  
  # results = db_connection do |conn|
  #   conn.exec("SELECT title, description, url FROM articles")
  # end
  
  # @articles = []

  # results.each do |article|
  #   @articles << Article.new(
  #     article["title"],
  #     article["description"],
  #     article["url"]
  #   )
  # end

  erb :index
end

get "/articles/new" do
  erb :new
end

post "/articles/new" do
  Article.create(params)

  # title = params["title"]
  # description = params["description"]
  # url = params["url"] 

  # Article.create(title, description, url)
  
  # binding.pry

  # title = params["title"]
  # description = params["description"]
  # url = params["url"]
  
  # db_connection do |conn|
  #   conn.exec_params("INSERT INTO articles (title, description, url) VALUES ($1, $2, $3)", [title, description, url])
  # end

  redirect "/articles"
end

get "/articles/:id" do
  @article = Article.find(params[:id])

  # result = db_connection do |conn|
  #   conn.exec("SELECT * FROM articles WHERE id=#{params["id"]}")
  # end
  
  # @article = Article.new(
  #   result.to_a[0]["title"],
  #   result.to_a[0]["description"],
  #   result.to_a[0]["url"]
  # )
  
  # binding.pry
    
  erb :show
end
