-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

DROP TABLE IF EXISTS articles;

-- Define your schema here:

CREATE TABLE articles(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  url VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO articles(title, description, url, created_at, updated_at)
VALUES
  ('Real Canadians Own a Cow', 'Canadians are more country than you', 'cowsrule.com', NOW(), NOW()),
  ('This Just In: Canada Has Too Many Lakes', 'More than all counties combined', 'lakesforever.gov', NOW(), NOW()),
  ('Justin Trudeau: A Life', 'Good guy, good policies, great smile', 'www.trudeau.com', NOW(), NOW()),
  ('Best Dessert You Dont Know: Nanaimo Bar', 'rural decadence in every bite', 'deliciousecstasy.gov', NOW(), NOW());
