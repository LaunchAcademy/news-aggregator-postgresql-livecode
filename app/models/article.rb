require "pry"

class Article 
  attr_accessor :title, :description, :url

  def initialize(id, title, description, url)
    @id = id
    @title = title
    @description = description
    @url = url
  end

  def self.all
    sql_articles = db_connection do |connection_object|
      connection_object.exec("SELECT * FROM articles;")
    end

    article_objects = []
    sql_articles.to_a.each do |article_hash| 
      article_objects << Article.new(article_hash["id"], article_hash["title"], article_hash["description"], article_hash["url"])
    end

    return article_objects
  end 

  def self.create(title, description, url)

    result_of_create = db_connection do |connection_object|
      connection_object.exec_params('INSERT INTO articles (title, description, url) VALUES ($1, $2, $3)', [title, description, url])
    end

  end

  def self.find(id)
     sql_article = db_connection do |connection_object|
      connection_object.exec("SELECT * FROM articles WHERE id = #{id};")
    end
    
    article_hash = sql_article[0]

    return Article.new(article_hash["id"], article_hash["title"], article_hash["description"], article_hash["url"])
  end
end




















# class Article
#   attr_accessor :title, :description, :url
#
#   def initialize(title, description, url)
#     @title = title
#     @description = description
#     @url = url
#   end
#
#   def self.all
#     article_hashes = db_connection do |conn|
#       conn.exec("SELECT title, description, url FROM articles")
#     end
#
#     article_objects = []
#
#     article_hashes.each do |article_hash|
#       article_objects << Article.new(
#         article_hash["title"],
#         article_hash["description"],
#         article_hash["url"]
#       )
#     end
#     return article_objects
#   end
#
#   def self.create(article_params)
#     title = article_params["title"]
#     description = article_params["description"]
#     url = article_params["url"]
#
#     db_connection do |conn|
#       conn.exec_params("INSERT INTO articles(title, description, url) VALUES ($1, $2, $3)", [title, description, url])
#     end
#   end
#
#   def self.find(id)
#     article_query_array = db_connection do |conn|
#       conn.exec("SELECT * FROM articles WHERE id = '#{id}'")
#     end
#
#     article_hash = article_query_array[0]
#
#     Article.new(article_hash["title"], article_hash["description"], article_hash["url"])
#   end
#
# end
#
#
#
#
#
#
#
# # def self.find(id)
# #
# # end
# #
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# # articles = db_connection { |conn| conn.exec("SELECT * FROM articles") }
# #
# # article_objects = []
# #
# # articles.each do |article|
# #   article_objects << Article.new(article["title"], article["description"], article["url"])
# # end
#
#
# # conn.exec_params("INSERT INTO pets (name) VALUES ($1)", [pet])
