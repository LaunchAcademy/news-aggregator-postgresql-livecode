class Article
  attr_accessor :title, :description, :url

  def initialize(title, description, url)
    @title = title
    @description = description
    @url = url
  end

  def self.all
    articles = []

    result = db_connection do |conn|
      conn.exec("SELECT * FROM articles;")
    end
    binding.pry

    result.each do |article_data|
      articles << Article.new(
        article_data["title"],
        article_data["description"],
        article_data["url"]
      )
    end
    articles
  end

  def self.create(article_params)
    result = db_connection do |conn|
      conn.exec_params("INSERT INTO articles(title, description, url) VALUES ($1, $2, $3)", [article_params["title"], article_params["description"], article_params["url"]])
    end
  end

  def self.find(id)

    result = db_connection do |conn|
      conn.exec("SELECT * FROM articles WHERE id=#{id}")
    end

    article = Article.new(
      result.to_a[0]["title"],
      result.to_a[0]["description"],
      result.to_a[0]["url"]
    )

  end
end
