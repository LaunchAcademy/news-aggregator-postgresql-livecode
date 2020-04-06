require "pry"
class Article
  attr_accessor :title, :description, :url

  def initialize(title, description, url)
    @title = title
    @description = description
    @url = url
  end

  def self.all
    results = db_connection do |conn|
      conn.exec("SELECT title, description, url FROM articles;")
    end
  
    articles = []

    results.each do |article|
      articles << Article.new(
        article["title"],
        article["description"],
        article["url"]
      )
    end

    return articles
  end

  def self.create(article_params)
    title = article_params["title"]
    description = article_params["description"]
    url = article_params["url"]

    new_article = nil

    db_connection do |conn|
      conn.exec_params("INSERT INTO articles (title, description, url) VALUES ($1, $2, $3);", [title, description, url])
      new_article = conn.exec("SELECT * FROM articles WHERE title='#{title}' AND description='#{description}' AND url='#{url}'")[0]
    end

    article = Article.new(
      new_article["title"],
      new_article["description"],
      new_article["url"]
    )

    return article
  end

  def self.find(article_id)
    result = db_connection do |conn|
      conn.exec("SELECT * FROM articles WHERE id=#{article_id}")
    end
  
    article = Article.new(
      result.to_a[0]["title"],
      result.to_a[0]["description"],
      result.to_a[0]["url"]
    )
  
    return article
  end
end