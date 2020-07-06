class Article < ActiveRecord::Base

  # attr_accessor :title, :description, :url

  # def initialize(title, description, url)
  #   @title = title
  #   @description = description
  #   @url = url
  # end

  # def self.all 
  #   array_of_pg_article_objects = db_connection do |connection_object| 
  #     connection_object.exec("SELECT * FROM articles")
  #   end

  #   articles_hashes = array_of_pg_article_objects.to_a

  #   final_article_objects_array = []

  #   articles_hashes.each do |article_hash| 
  #     final_article_objects_array << Article.new(article_hash["title"], article_hash["description"], article_hash["url"])
  #   end

  #   return final_article_objects_array
  # end

  # def self.find(id)
  #   result = db_connection do |connection_object| 
  #     connection_object.exec_params("SELECT * FROM articles WHERE id = #{id}")
  #   end

  #   article_hash = result[0]

  #   return Article.new(article_hash["title"], article_hash["description"], article_hash["url"])
  # end

  # def self.create(title, description, url)
  #   db_connection do |connection_object| 
  #     connection_object.exec_params("INSERT INTO articles (title, description, url) VALUES ($1, $2, $3)", [title, description, url])
  #   end

  # end

end
