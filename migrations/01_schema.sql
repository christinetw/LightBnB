CREATE TABLE users(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE properties(
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INT REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  thumbnail_photo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  cost_per_night INT,
  parking_space INT,
  number_of_bathrooms INT,
  number_of_bedrooms INT,
  country VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN DEFAULT TRUE
  );

CREATE TABLE reservations(
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INT REFERENCES users(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE 
);

CREATE TABLE property_reviews(
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INT REFERENCES users(id) ON DELETE CASCADE,
  reservation_id INT REFERENCES reservations(id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE,
  rating SMALLINT,
  message TEXT
);

