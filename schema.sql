-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

DROP TABLE IF EXISTS articles;

-- Define your schema here:

CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  url VARCHAR(255) NOT NULL
);

INSERT INTO articles(title, description, url)
VALUES
  ('Best dumplings in Boston', 'What it sounds like', 'www.boutdatbao.com'),
  ('Pizza time', 'Where to go to get a great slice', 'www.ernestos.com'),
  ('Spiciest dishes', 'The most painful dishes to eat in the city', 'www.eastcoasthellnightrip.com');
