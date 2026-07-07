-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id serial PRIMARY KEY,
  full_name varchar(50) NOT NULL,
  email varchar(50) NOT NULL unique,
  role varchar(20) NOT NULL DEFAULT 'Football Fan' CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);
-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id serial primary key,
  fixture varchar(50) not null,
  tournament_category varchar(50) not null,
  base_ticket_price decimal(10, 2) not null check(base_ticket_price >= 0),
  match_status varchar(50) not null default 'Selling Fast' check (match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);



-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id serial primary key,
  user_id int not null,
  match_id int not null,
  seat_number int not null,
  payment_status varchar(20) check (payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
  total_cost int check (total_cost >= 0),
  foreign key (user_id) references users(user_id),
  foreign key (match_id) references matches(match_id)
);
