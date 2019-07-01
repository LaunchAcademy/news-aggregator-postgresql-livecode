I highly recommend using the `Article` class to create class methods to run your SQL queries for you. This is both best practice AND will help transition folks nicely into our upcoming ActiveRecord material as well. Here are the class methods I recommend:

```ruby
class Article

   # .....add attr_accessors as needed
   # .....add initialize


  def self.find(id)
      # - alternative constructor class method
      # - accepts an id as an argument
      # - returns a single article object whose id matches the given id
      # - uses a SELECT statement with a WHERE clause

  end

  def self.all
      # - alternative constructor class method
      # - accepts no argument
      # - returns an array of article objects
      # - uses `SELECT` statement

  end

  def self.create(title, url, description)
      # - utility class method AND alternate constructor: creates a new article record in our database
      # - accepts the parameters needed for a new Article record
      # - uses an INSERT statement to create a new article record
      # - returns the newly persisted article object
  end
end
```
