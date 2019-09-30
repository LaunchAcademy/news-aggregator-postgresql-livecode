class Article
  def initialize(title, description, url)
    @title = title
    @description = description
    @url = url
  end

  def self.all
    query_result = db_connection do |conn|
      conn.exec(
        "SELECT title, description, url FROM articles"
      )
    end

    query_result.to_a
  end

  def self.find(id)
    query_result = db_connection do |conn|
      conn.exec(
        "SELECT title, description, url FROM articles WHERE id=#{id}"
      )
    end

    query_result.to_a[0]
  end

  def self.create(new_article_params)
    db_connection do |conn|
      conn.exec_params(
        "INSERT INTO articles(title, description, url) VALUES ($1, $2, $3)", [
          new_article_params["title"],
          new_article_params["description"],
          new_article_params["url"]
        ]
      )
    end
  end
end
