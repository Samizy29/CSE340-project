-- Create account_type enum
CREATE TYPE public.account_type AS ENUM (
  'Client',
  'Employee',
  'Admin'
);

-- Create classification table
CREATE TABLE public.classification (
  classification_id SERIAL PRIMARY KEY,
  classification_name VARCHAR(30) NOT NULL
);

-- Create account table
CREATE TABLE public.account (
  account_id SERIAL PRIMARY KEY,
  account_firstname VARCHAR(25) NOT NULL,
  account_lastname VARCHAR(25) NOT NULL,
  account_email VARCHAR(255) NOT NULL UNIQUE,
  account_password VARCHAR(255) NOT NULL,
  account_type public.account_type NOT NULL DEFAULT 'Client'
);

-- Create inventory table
CREATE TABLE public.inventory (
  inv_id SERIAL PRIMARY KEY,
  inv_make VARCHAR(30) NOT NULL,
  inv_model VARCHAR(30) NOT NULL,
  inv_year INT NOT NULL,
  inv_description TEXT NOT NULL,
  inv_image VARCHAR(200) NOT NULL,
  inv_thumbnail VARCHAR(200) NOT NULL,
  inv_price NUMERIC(9,0) NOT NULL,
  inv_miles INT NOT NULL,
  inv_color VARCHAR(30) NOT NULL,
  classification_id INT NOT NULL REFERENCES public.classification(classification_id)
);

-- Insert classifications
INSERT INTO public.classification (classification_name)
VALUES
  ('Custom'),
  ('Sport'),
  ('SUV'),
  ('Truck'),
  ('Sedan');

-- Insert inventory
INSERT INTO public.inventory 
  (inv_make, inv_model, inv_year, inv_description, inv_image, inv_thumbnail, inv_price, inv_miles, inv_color, classification_id)
VALUES
  ('GM', 'Hummer', 2006, 'Has small interiors but a huge exterior', '/images/hummer.jpg', '/images/hummer-tn.jpg', 58000, 65000, 'Charcoal', 3),
  ('Jeep', 'Wrangler', 2018, 'Has a great off-road capability', '/images/wrangler.jpg', '/images/wrangler-tn.jpg', 28000, 30000, 'Yellow', 3),
  ('Jeep', 'Gladiator', 2021, 'Has a great off-road capability', '/images/gladiator.jpg', '/images/gladiator-tn.jpg', 45000, 10000, 'Sarge Green', 4),
  ('Chevrolet', 'Camaro', 2018, 'Has a great engine', '/images/camaro.jpg', '/images/camaro-tn.jpg', 25000, 30000, 'Silver', 2),
  ('Ford', 'Mustang', 2019, 'Has a great engine', '/images/mustang.jpg', '/images/mustang-tn.jpg', 28000, 22000, 'Red', 2),
  ('Dodge', 'Challenger', 2020, 'Has a great engine', '/images/challenger.jpg', '/images/challenger-tn.jpg', 32000, 15000, 'Orange', 2),
  ('Batmobile', 'Tumbler', 2008, 'Great for nightly patrol', '/images/tumbler.jpg', '/images/tumbler-tn.jpg', 65000, 10000, 'Black', 1),
  ('DeLorean', 'DMC', 1981, 'Great for time travel', '/images/delorean.jpg', '/images/delorean-tn.jpg', 45000, 30000, 'Silver', 1),
  ('Willy', 'Jeep', 1944, 'Great for rough terrain', '/images/willy.jpg', '/images/willy-tn.jpg', 35000, 55000, 'Olive Green', 4),
  ('Ford', 'F-150', 2022, 'Has a great towing capacity', '/images/f150.jpg', '/images/f150-tn.jpg', 45000, 5000, 'Agate Black', 4),
  ('Chevrolet', 'Tahoe', 2020, 'Has a great towing capacity', '/images/tahoe.jpg', '/images/tahoe-tn.jpg', 45000, 20000, 'White', 3),
  ('Dodge', 'Charger', 2020, 'Has a great engine', '/images/charger.jpg', '/images/charger-tn.jpg', 35000, 20000, 'Black', 5);

  -- Query 4: Fix Hummer description
UPDATE public.inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- Query 6: Update image paths
UPDATE public.inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');