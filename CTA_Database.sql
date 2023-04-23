-- create schema 425deliverable3;
-- use 425deliverable3;

CREATE TABLE operator (
    operator_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    hire_date DATE
);

CREATE TABLE bus_schedule (
    bus_schedule_id INT PRIMARY KEY,
    route VARCHAR(5000) NOT NULL
);


CREATE TABLE train_schedule (
    train_schedule_id INT PRIMARY KEY,
    route VARCHAR(5000) NOT NULL
);

CREATE TABLE bus_stop (
    stop_id INT PRIMARY KEY,
    stop_name VARCHAR(255) NOT NULL,
    direction VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE line (
    line_id INT PRIMARY KEY,
    green BOOLEAN DEFAULT FALSE NOT NULL,
    red BOOLEAN DEFAULT FALSE NOT NULL,
    blue BOOLEAN DEFAULT FALSE NOT NULL,
    brown BOOLEAN DEFAULT FALSE NOT NULL,
    purple BOOLEAN DEFAULT FALSE NOT NULL,
    yellow BOOLEAN DEFAULT FALSE NOT NULL,
    pink BOOLEAN DEFAULT FALSE NOT NULL,
    orange BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE bus (
    bus_id INT PRIMARY KEY,
    stop_id INT NOT NULL,
    operator_id INT NOT NULL,
    bus_schedule_id INT NOT NULL,
    FOREIGN KEY (stop_id) REFERENCES bus_stop(stop_id),
    FOREIGN KEY (operator_id) REFERENCES operator(operator_id),
    FOREIGN KEY (bus_schedule_id) REFERENCES bus_schedule(bus_schedule_id)
);



CREATE TABLE train_station (
    station_id INT PRIMARY KEY,
    line_id INT NOT NULL,
    station_name VARCHAR(255) NOT NULL,
    ada BOOLEAN DEFAULT FALSE,
    location VARCHAR(255),
    FOREIGN KEY (line_id) REFERENCES line(line_id)
);

CREATE TABLE train (
    train_id INT PRIMARY KEY,
    line_color VARCHAR(255) NOT NULL,
    station_id INT NOT NULL,
    operator_id INT NOT NULL,
    train_schedule_id INT NOT NULL,
    FOREIGN KEY (station_id) REFERENCES train_station(station_id),
    FOREIGN KEY (operator_id) REFERENCES operator(operator_id),
    FOREIGN KEY (train_schedule_id) REFERENCES train_schedule(train_schedule_id)
);











INSERT INTO operator (operator_id, first_name, last_name, gender, hire_date)
VALUES 
(1, 'John', 'Doe', 'Male', '1995-12-31'),
(2, 'Jane', 'Smith', 'Female', '1992-06-15'),
(3, 'Peter', 'Johnson', 'Male', '1997-09-20'),
(4, 'Sarah', 'Lee', 'Female', '1998-11-10'),
(5, 'Mark', 'Nguyen', 'Male', '1990-02-25'),
(6, 'Jessica', 'Wang', 'Female', '1991-01-01'),
(7, 'William', 'Garcia', 'Male', '1994-03-12'),
(8, 'Emily', 'Liu', 'Female', '1996-07-02'),
(9, 'Brian', 'Chen', 'Male', '1993-05-17'),
(10, 'Amanda', 'Taylor', 'Female', '1999-12-05'),
(11, 'David', 'Wilson', 'Male', '1990-06-28'),
(12, 'Karen', 'Li', 'Female', '1992-03-14'),
(13, 'Richard', 'Gonzalez', 'Male', '1997-08-22'),
(14, 'Stephanie', 'Adams', 'Female', '1995-01-30'),
(15, 'Jason', 'Kim', 'Male', '1998-02-18'),
(16, 'Lauren', 'Davis', 'Female', '1996-09-05'),
(17, 'Andrew', 'Brown', 'Male', '1994-04-12'),
(18, 'Rachel', 'Ng', 'Female', '1993-11-03'),
(19, 'James', 'Harris', 'Male', '1996-06-30'),
(20, 'Megan', 'Chan', 'Female', '1997-09-01'),
(21, 'Christopher', 'Gupta', 'Male', '1992-10-18'),
(22, 'Catherine', 'Park', 'Female', '1998-08-08'),
(23, 'Daniel', 'Lee', 'Male', '1995-03-25'),
(24, 'Melissa', 'Nguyen', 'Female', '1999-05-10'),
(25, 'Kevin', 'Kim', 'Male', '1991-12-20'),
(26, 'Adam', 'Miller', 'Male', '1991-04-22'),
(27, 'Olivia', 'Garcia', 'Female', '1994-08-11'),
(28, 'Michael', 'Wang', 'Male', '1997-10-07'),
(29, 'Samantha', 'Brown', 'Female', '1993-12-16'),
(30, 'Joshua', 'Johnson', 'Male', '1992-01-05'),
(31, 'Isabella', 'Lee', 'Female', '1998-09-08'),
(32, 'Christopher', 'Chen', 'Male', '1990-07-18'),
(33, 'Victoria', 'Nguyen', 'Female', '1995-05-23'),
(34, 'Matthew', 'Kim', 'Male', '1996-02-11'),
(35, 'Gabriella', 'Liu', 'Female', '1999-03-28'),
(36, 'Nicholas', 'Huang', 'Male', '1994-11-14'),
(37, 'Emma', 'Gao', 'Female', '1992-09-01'),
(38, 'Tyler', 'Zhang', 'Male', '1997-06-09'),
(39, 'Natalie', 'Cheng', 'Female', '1991-08-04'),
(40, 'Brandon', 'Wong', 'Male', '1996-04-12'),
(41, 'Hannah', 'Zhao', 'Female', '1993-02-25'),
(42, 'Anthony', 'Lau', 'Male', '1990-12-14'),
(43, 'Madison', 'Wu', 'Female', '1992-07-09'),
(44, 'Eric', 'Chu', 'Male', '1999-01-11'),
(45, 'Alexandra', 'Tang', 'Female', '1995-09-02'),
(46, 'Jacob', 'Chang', 'Male', '1998-03-28'),
(47, 'Sophia', 'Zhou', 'Female', '1996-06-10'),
(48, 'Benjamin', 'Lin', 'Male', '1997-05-21'),
(49, 'Avery', 'Xu', 'Female', '1994-04-17'),
(50, 'Christopher', 'Yu', 'Male', '1999-11-02');

#---------------------------------------------------------------------------

#created using real data
INSERT INTO bus_stop(stop_id, stop_name, direction, location)
VALUES
(68, 'Jackson & Franklin', 'Eastbound', '(41.878051°, -87.635401°)'),
(69, 'Jackson & Financial Place', 'Eastbound', '(41.878081°, -87.632868°)'),
(73, 'Michigan & Van Buren/Congress', 'Southbound', '(41.876271°, -87.624396°)'),
(75, 'Michigan & Van Buren', 'Northbound', '(41.87669°, -87.62416°)'),
(76, 'Michigan & Jackson', 'Northbound', '(41.878135°, -87.624193°)'),
(77, 'Adams & Wabash', 'Westbound', '(41.879575°, -87.625884°)'),
(80, 'Adams & Wells', 'Westbound', '(41.879426°, -87.634024°)'),
(200, 'Harrison & Morgan', 'Eastbound', '(41.874283°, -87.651938°)'),
(206, 'Harrison & Halsted', 'Westbound', '(41.874441°, -87.64775°)'),
(312, 'Roosevelt & Canal', 'Eastbound', '(41.867139°, -87.638826°)'),
(358, 'Roosevelt & Homan', 'Westbound', '(41.866418°, -87.71027°)'),
(397, 'Madison & Laramie', 'Eastbound', '(41.88027°, -87.75526°)'),
(409, 'Madison & Pulaski', 'Eastbound', '(41.880614°, -87.725823°)'),
(442, 'Washington & Jefferson', 'Eastbound', '(41.88311°, -87.642848°)'),
(449, 'Washington & Wabash', 'Eastbound', '(41.883159°, -87.625966°)'),
(455, 'Madison & Clinton', 'Westbound', '(41.881947°, -87.641043°)'),
(465, 'Madison & Ashland', 'Westbound', '(41.881523°, -87.666567°)'),
(523, 'Chicago & Cicero', 'Eastbound', '(41.894906°, -87.745937°)'),
(530, 'Chicago & Pulaski', 'Eastbound', '(41.89529°, -87.726211°)'),
(548, 'Chicago & Western', 'Eastbound', '(41.895662°, -87.687019°)'),
(552, 'Chicago & Damen', 'Eastbound', '(41.895831°, -87.677192°)'),
(556, 'Chicago & Ashland', 'Eastbound', '(41.895993°, -87.667474°)'),
(590, 'Grand & Fairbanks/Columbus', 'Westbound', '(41.891862°, -87.620009°)'),
(594, 'Fairbanks & Huron', 'Northbound', '(41.894886°, -87.620252°)'),
(597, 'Chicago & Mies Van Der Rohe', 'Westbound', '(41.896838°, -87.621709°)'),
(599, 'Chicago & Michigan', 'EB bound', '(41.8968°, -87.624493°)'),
(601, 'Chicago & State (Red Line)', 'WB bound', '(41.896741°, -87.628022°)'),
(606, 'Chicago & Franklin (Brown line)', 'WB bound', '(41.896669°, -87.635534°)'),
(617, 'Chicago Blue Line Station', 'WB bound', '(41.896353°, -87.655108°)'),
(622, 'Chicago & Ashland', 'WB bound', '(41.896151°, -87.667079°)'),
(648, 'Chicago & Pulaski', 'WB bound', '(41.895445°, -87.725901°)'),
(672, 'Grand & Oak Park', 'EB bound', '(41.923518°, -87.795414°)'),
(738, 'Grand & Halsted/Milwaukee (Blue Line)', 'EB bound', '(41.891115°, -87.647777°)'),
(759, 'Grand & Streeter', 'WB bound', '(41.892011°, -87.612125°)'),
(765, 'Grand & Dearborn', 'WB bound', '(41.891714°, -87.629467°)'),
(949, 'North Ave & Western', 'WB bound', '(41.91039°, -87.687029°)'),
(1023, 'Sheridan & Pratt', 'SB bound', '(42.005364°, -87.660998°)'),
(1027, 'Sheridan & Loyola (Red Line)', 'SB bound', '(42.001423°, -87.66086°)'),
(1033, 'Sheridan & Granville', 'SB bound', '(41.994419°, -87.655598°)'),
(1034, 'Sheridan & Glenlake', 'SB bound', '(41.992167°, -87.655528°)'),
(1036, 'Sheridan & Ardmore', 'SB bound', '(41.987459°, -87.655379°)'),
(1037, 'Sheridan & Hollywood', 'SB bound', '(41.985339°, -87.655319°)'),
(10257, 'Cicero & 13th Street', 'Southbound', 'Northwest Corner'),
(10280, 'Cicero & 13th Street', 'Northbound', 'Southeast Corner'),
(10258, 'Cicero & 14th Street', 'Southbound', 'Northwest Corner'),
(10279, 'Cicero & 14th Street', 'Northbound', 'Southeast Corner'),
(10278, 'Cicero & 15th Street', 'Northbound', 'Eastside of the Street'),
(10259, 'Cicero & 15th Street', 'Southbound', 'Northwest Corner'),
(10277, 'Cicero & 16th Street', 'Northbound', 'Southeast Corner'),
(14219, 'Cicero & 16th Street', 'Southbound', 'Southwest Corner'),
(10261, 'Cicero & 18th Street', 'Southbound', 'Northwest Corner'),
(10276, 'Cicero & 18th Street', 'Northbound', 'Southeast Corner'),
(18366, 'Cicero & 19th Street', 'Northbound', 'Northeast Corner'),
(18363, 'Cicero & 19th Street', 'Southbound', 'Southwest Corner'),
(10264, 'Cicero & 21st Place (Pink Line)', 'Southbound', 'Northwest Corner'),
(10274, 'Cicero & 21st Street', 'Northbound', 'Southeast Corner'),
(17992, 'Cicero & 23rd Street', 'Northbound', 'Eastside of the Street'),
(18364, 'Cicero & 23rd Street', 'Southbound', 'Southwest Corner'),
(6301, 'Cicero & 24th Place Terminal', 'Eastbound', 'Bus Terminal'),
(18102, 'Cicero & Adams', 'Northbound', 'Eastside of the Street'),
(10247, 'Cicero & Adams', 'Southbound', 'Northwest Corner'),
(10208, 'Cicero & Addison', 'Southbound', 'Northwest Corner'),
(10329, 'Cicero & Addison', 'Northbound', 'Southeast Corner'),
(10318, 'Cicero & Altgeld', 'Northbound', 'Southeast Corner'),
(15396, 'Cicero & Altgeld', 'Southbound', 'Southwest Corner'),
(14641, 'Cicero & Armitage', 'Northbound', 'Northeast Corner'),
(10224, 'Cicero & Armitage', 'Southbound', 'Northwest Corner'),
(10303, 'Cicero & Augusta', 'Northbound', 'Southeast Corner'),
(18095, 'Cicero & Augusta', 'Southbound', 'Southwest Corner'),
(10324, 'Cicero & Barry', 'Northbound', 'Southeast Corner'),
(15395, 'Cicero & Barry', 'Southbound', 'Southwest Corner'),
(10316, 'Cicero & Belden', 'Northbound', 'Southeast Corner'),
(18608, 'Cicero & Belden', 'Southbound', 'Southwest Corner'),
(10202, 'Cicero & Belle Plaine', 'Southbound', 'Northwest Corner'),
(10336, 'Cicero & Belle Plaine', 'Northbound', 'Southeast Corner'),
(10325, 'Cicero & Belmont', 'Northbound', 'Southeast Corner'),
(14771, 'Cicero & Belmont', 'Southbound', 'Southwest Corner'),
(10337, 'Cicero & Berteau', 'Northbound', 'Eastside of the Street'),
(15189, 'Cicero & Berteau', 'Southbound', 'Southwest Corner'),
(10204, 'Cicero & Byron', 'Southbound', 'Northwest Corner'),
(10333, 'Cicero & Byron', 'Northbound', 'Southeast Corner'),
(10265, 'Cicero & Cermak', 'Southbound', 'Southwest Corner'),
(10272, 'Cicero & Cermak (Pink Line)', 'Northbound', 'Southeast Corner'),
(10301, 'Cicero & Chicago', 'Northbound', 'Southeast Corner'),
(15299, 'Cicero & Chicago', 'Southbound', 'Southwest Corner'),
(10250, 'Cicero & Congress', 'Southbound', 'Northwest Corner'),
(10287, 'Cicero & Congress Parkway', 'Northbound', 'Southeast Corner'),
(10209, 'Cicero & Cornelia', 'Southbound', 'Northwest Corner'),
(10328, 'Cicero & Cornelia', 'Northbound', 'Southeast Corner'),
(15222, 'Cicero & Cortland', 'Northbound', 'Eastside of the Street'),
(10225, 'Cicero & Cortland', 'Southbound', 'Northwest Corner'),
(10338, 'Cicero & Cullom', 'Northbound', 'Eastside of the Street'),
(10200, 'Cicero & Cullom', 'Southbound', 'Northwest Corner'),
(10223, 'Cicero & Dickens', 'Southbound', 'Northwest Corner'),
(10314, 'Cicero & Dickens', 'Northbound', 'Southeast Corner'),
(14824, 'Cicero & Diversey', 'Northbound', 'Northeast Corner'),
(10216, 'Cicero & Diversey', 'Southbound', 'Northwest Corner'),
(18101, 'Cicero & Division', 'Northbound', 'Northeast Corner'),
(18094, 'Cicero & Division', 'Southbound', 'Southwest Corner'),
(10283, 'Cicero & Fifth Avenue', 'Northbound', 'Northeast Corner'),
(10254, 'Cicero & Fifth Avenue', 'Southbound', 'Westside of the Street'),
(14773, 'Cicero & Fullerton', 'Northbound', 'Northeast Corner'),
(14974, 'Cicero & Fullerton', 'Southbound', 'Southwest Corner'),
(10215, 'Cicero & George', 'Southbound', 'Northwest Corner'),
(10322, 'Cicero & George', 'Northbound', 'Southeast Corner'),
(10206, 'Cicero & Grace', 'Southbound', 'Northwest Corner'),
(10331, 'Cicero & Grace', 'Northbound', 'Southeast Corner'),
(7991, '42nd Place & Lake Park', 'Westbound', 'Northeast Corner'),
(8020, '42nd Street & Halsted', 'Westbound', 'Northeast Corner'),
(8004, '43rd Green Line Station', 'Westbound', 'Northside of the Street'),
(16065, '43rd Street & Berkeley', 'Eastbound', 'Southeast Corner'),
(16199, '43rd Street & Calumet (Green Line)', 'Eastbound', 'Southwest Corner'),
(7997, '43rd Street & Cottage Grove', 'Westbound', 'Northeast Corner'),
(8060, '43rd Street & Cottage Grove', 'Eastbound', 'Southwest Corner'),
(7996, '43rd Street & Drexel', 'Westbound', 'Northwest Corner'),
(8062, '43rd Street & Drexel', 'Eastbound', 'Southeast Corner'),
(7994, '43rd Street & Ellis', 'Westbound', 'Northeast Corner'),
(8063, '43rd Street & Ellis', 'Eastbound', 'Southwest Corner'),
(18290, '43rd Street & Indiana', 'Westbound', 'Northwest Corner'),
(17542, '43rd Street & Indiana', 'Eastbound', 'Southeast Corner'),
(8002, '43rd Street & King Drive', 'Westbound', 'Northeast Corner'),
(8003, '43rd Street & King Drive', 'Westbound', 'Northwest Corner'),
(8055, '43rd Street & King Drive', 'Eastbound', 'Southeast Corner'),
(8054, '43rd Street & King Drive', 'Eastbound', 'Southwest Corner'),
(8010, '43rd Street & LaSalle', 'Westbound', 'Northwest Corner'),
(14562, '43rd Street & Lake Park', 'Eastbound', 'Southwest Corner'),
(7998, '43rd Street & Langley', 'Westbound', 'Northeast Corner'),
(8059, '43rd Street & Langley', 'Eastbound', 'Southwest Corner'),
(17552, '43rd Street & Michigan', 'Westbound', 'Northwest Corner'),
(17551, '43rd Street & Michigan', 'Eastbound', 'Southeast Corner'),
(8012, '43rd Street & Princeton', 'Westbound', 'Northeast Corner'),
(8045, '43rd Street & Princeton', 'Eastbound', 'Southeast Corner'),
(8000, '43rd Street & St. Lawrence', 'Westbound', 'Northeast Corner'),
(8057, '43rd Street & St. Lawrence', 'Eastbound', 'Southwest Corner'),
(17543, '43rd Street & State', 'Westbound', 'Northwest Corner'),
(8049, '43rd Street & State', 'Eastbound', 'Southeast Corner'),
(8001, '43rd Street & Vincennes', 'Westbound', 'Northeast Corner'),
(8056, '43rd Street & Vincennes', 'Eastbound', 'Southwest Corner'),
(8011, '43rd Street & Wentworth', 'Westbound', 'Northwest Corner'),
(8175, '47th Red Line Station', 'Eastbound', 'Southside of the Street'),
(2398, '3400 S State', 'Southbound', 'Westside of the Street'),
(15756, '4900 S State', 'Northbound', 'Eastside of the Street'),
(2414, '4900 S State', 'Southbound', 'Westside of the Street'),
(2314, '5000 S State', 'Northbound', 'Eastside of the Street'),
(2415, '5000 S State', 'Southbound', 'Westside of the Street'),
(2312, '5200 S State', 'Northbound', 'Eastside of the Street'),
(2417, '5200 S State', 'Southbound', 'Westside of the Street'),
(2301, '6200 S State', 'Northbound', 'Eastside of the Street'),
(2428, '6200 S State', 'Southbound', 'Westside of the Street'),
(2435, '69th Red Line Station', 'Westbound', 'Northside of the Street'),
(2453, '8600 S Lafayette', 'Southbound', 'Westside of the Street'),
(14001, '95th Red Line Station', 'Eastbound', 'Bus Terminal'),
(589, 'Grand & McClurg', 'Westbound', 'Northwest Corner'),
(760, 'Grand & Peshtigo', 'Westbound', 'Northside of the Street'),
(16028, 'Grand & Rush', 'Westbound', 'Northwest Corner'),
(761, 'Grand & St. Clair', 'Westbound', 'Northeast Corner'),
(756, 'Illinois & Lake Shore', 'Eastbound', 'Southside of the Street'),
(754, 'Illinois & McClurg', 'Eastbound', 'Southwest Corner'),
(755, 'Illinois & Peshtigo', 'Eastbound', 'Southside of the Street'),
(14775, 'Illinois & State', 'Eastbound', 'Southeast Corner'),
(751, 'Illinois (Lower) & Michigan', 'Eastbound', 'Southwest Corner'),
(17071, 'Illinois (Lower) & St. Clair', 'Eastbound', 'Southwest Corner'),
(2436, 'Lafayette & 70th Street', 'Southbound', 'Northwest Corner'),
(2437, 'Lafayette & 71st Street', 'Southbound', 'Southwest Corner'),
(2438, 'Lafayette & 72nd Street', 'Southbound', 'Northwest Corner'),
(2439, 'Lafayette & 73rd Street', 'Southbound', 'Northwest Corner'),
(2440, 'Lafayette & 74th Street', 'Southbound', 'Northwest Corner'),
(2441, 'Lafayette & 75th Street', 'Southbound', 'Northwest Corner'),
(2442, 'Lafayette & 76th Street', 'Southbound', 'Northwest Corner'),
(2443, 'Lafayette & 77th Street', 'Southbound', 'Northwest Corner'),
(2444, 'Lafayette & 78th Street', 'Southbound', 'Northwest Corner'),
(2446, 'Lafayette & 79th Street', 'Southbound', 'Southwest Corner'),
(2447, 'Lafayette & 80th Street', 'Southbound', 'Northwest Corner'),
(2448, 'Lafayette & 81st Street', 'Southbound', 'Northwest Corner'),
(2449, 'Lafayette & 82nd Street', 'Southbound', 'Northwest Corner'),
(2450, 'Lafayette & 83rd Street', 'Southbound', 'Northwest Corner'),
(2451, 'Lafayette & 84th Street', 'Southbound', 'Northwest Corner'),
(2452, 'Lafayette & 85th Street', 'Southbound', 'Northwest Corner'),
(2454, 'Lafayette & 87th Street', 'Southbound', 'Southwest Corner'),
(2455, 'Lafayette & 88th Street', 'Southbound', 'Westside of the Street'),
(2457, 'Lafayette & 91st Street', 'Southbound', 'Northwest Corner'),
(2458, 'Lafayette & 92nd Street', 'Southbound', 'Northwest Corner'),
(2459, 'Lafayette & 93rd Street', 'Southbound', 'Northwest Corner'),
(2460, 'Lafayette & 94th Street', 'Southbound', 'Northwest Corner'),
(758, 'Navy Pier Terminal', 'Northbound', 'Bus Terminal'),
(2354, 'State & 11th Street', 'Northbound', 'Southeast Corner'),
(15563, 'State & 11th Street', 'Southbound', 'Westside of the Street'),
(2352, 'State & 13th Street', 'Northbound', 'Southeast Corner'),
(2377, 'State & 13th Street', 'Southbound', 'Westside of the Street'),
(2350, 'State & 14th Place', 'Northbound', 'Southeast Corner'),
(2378, 'State & 14th Street', 'Southbound', 'Northwest Corner'),
(2351, 'State & 14th Street', 'Northbound', 'Southeast Corner'),
(2379, 'State & 15th Street', 'Southbound', 'Northwest Corner'),
(2349, 'State & 16th Street', 'Northbound', 'Southeast Corner'),
(15357, 'State & 16th Street', 'Southbound', 'Southwest Corner'),
(14761, 'State & 18th Street', 'Northbound', 'Northeast Corner'),
(2382, 'State & 18th Street', 'Southbound', 'Southwest Corner'),
(2342, 'State & 23rd Street', 'Northbound', 'Southeast Corner'),
(2387, 'State & 23rd Street', 'Southbound', 'Westside of the Street'),
(15360, 'State & 24th Street', 'Northbound', 'Northeast Corner'),
(15359, 'State & 24th Street', 'Southbound', 'Westside of the Street'),
(14852, 'State & 26th Street', 'Northbound', 'Northeast Corner'),
(2390, 'State & 26th Street', 'Southbound', 'Northwest Corner'),
(2338, 'State & 27th Street', 'Northbound', 'Eastside of the Street'),
(14483, '1100 S Columbus (Pedestrian Underpass)', 'Northbound', 'Eastside of the Street'),
  (4872, '1100 S Columbus (Pedestrian Underpass)', 'Southbound', 'Westside of the Street'),
  (17057, '1111 East 60th Street', 'Eastbound', 'Southside of the Street'),
  (7137, '5000 S Lake Park', 'Northbound', 'Eastside of the Street'),
  (7175, '5000 S Lake Park', 'Southbound', 'Westside of the Street'),
  (1514, '5800 S Stony Island', 'Northbound', 'Eastside of the Street'),
  (14458, '60th Street & Blackstone', 'Eastbound', 'Southside of the Street'),
  (15431, '60th Street & Cottage Grove', 'Westbound', 'Northeast Corner'),
  (15432, '60th Street & Cottage Grove', 'Eastbound', 'Southeast Corner'),
  (14032, '60th Street & Ellis', 'Westbound', 'Northeast Corner'),
  (14019, '60th Street & Ellis', 'Eastbound', 'Southeast Corner'),
  (17902, '60th Street & Kenwood', 'Eastbound', 'Southwest Corner'),
  (15428, '60th Street & Kimbark', 'Westbound', 'Northside of the Street'),
  (14885, '60th Street & Stony Island', 'Eastbound', 'Southwest Corner'),
  (17903, '60th Street & University', 'Westbound', 'Northwest Corner'),
  (14020, '60th Street & University', 'Eastbound', 'Southeast Corner'),
  (15429, '60th Street & Woodlawn', 'Westbound', 'Northeast Corner'),
  (15433, '60th Street & Woodlawn', 'Eastbound', 'Southwest Corner'),
  (18050, '915 E. 60th Street', 'Eastbound', 'Southside of the Street'),
  (4883, 'Balbo & Columbus', 'Westbound', 'Northwest Corner'),
  (4871, 'Balbo & Columbus', 'Eastbound', 'Southwest Corner'),
  (4884, 'Balbo & Michigan', 'Westbound', 'Northeast Corner'),
  (4870, 'Balbo & Michigan', 'Eastbound', 'Southeast Corner'),
  (15482, 'Balbo & State', 'Westbound', 'Northeast Corner'),
  (14645, 'Balbo & State', 'Eastbound', 'Southeast Corner'),
  (2505, 'Cottage Grove & 52nd Street', 'Northbound', 'Southeast Corner'),
  (2555, 'Cottage Grove & 52nd Street', 'Southbound', 'Westside of the Street'),
  (2504, 'Cottage Grove & 53rd Street', 'Northbound', 'Southeast Corner'),
  (2556, 'Cottage Grove & 53rd Street', 'Southbound', 'Westside of the Street'),
  (2503, 'Cottage Grove & 54th Street', 'Northbound', 'Southeast Corner'),
  (2557, 'Cottage Grove & 54th Street', 'Southbound', 'Westside of the Street');



#--------------------------------------------------------------------------------------
#implemented 35,54,29,2,43
INSERT INTO bus_schedule(bus_schedule_id, route) 
VALUES
(35,'7650,7668,7428,17694,7430,7447,7426,7451,17769,7443,17696,17770,7442,17690,7441,17691,17693,7429,7448,12950,7445,7425,7452,7431,7446,17768,17695,17961,3133,3065,3132,3066,7627,3131,3067,7647,7671,7658,7416,7461,7652,18204,7629,7657,7661,7636,7681,7631,7686,18206,7674,15315,15520,7649,7669,2528,2533,7687,15179,7465,7645,7673,7417,7460,15316,7684,7646,18205,7641,7677,15180,7464,7653,7665,7648,15234,2534,7418,7459,7640,7678,7635,14953,7643,7675,7642,15413,7419,7458,15181,7415,7462,7656,7662,15936,7663,4432,14134,15436,15434,15435,15182,7786,7789,7788,15183,7809,7808,7787,4433,4176,4264,4266,4265,6301,10408,10339,10407,18367,10406,10341,17698,17692,7628,17448,2527,4486,1610,7689,7688,7638,7680'),
(54,'10257,10280,10258,10279,10278,10259,10277,14219,10261,10276,18366,18363,10264,10274,17992,18364,6301,18102,10247,10208,10329,10318,15396,14641,10224,10303,18095,10324,15395,10316,18608,10202,10336,10325,14771,10337,15189,10204,10333,10265,10272,10301,15299,10250,10287,10209,10328,15222,10225,10338,10200,10223,10314,14824,10216,18101,18094,10283,10254,14773,14974,10215,10322,10206,10331,10226,10311,10251,10286,10307,10230,10297,10240,10237,10300,10235,10302,15857,10203,10334,18099,10248,15832,10241,10229,10308,10285,10292,14772,10295,18097,10309,10228,15446,18096,15758,15255,10199,10253,10284,10306,10231,16031,10256,15479,10210,10211,10326,10320,17881,10304,10233,10249,10288,10227,10310,18100,18098,10207,10330,10323,15242,10218,10319,10252'),
(29,'2398,15756,2414,2314,2415,2312,2417,2301,2428,2435,2453,14001,590,589,760,16028,761,759,756,754,755,14775,751,17071,2436,2437,2438,2439,2440,2441,2442,2443,2444,2446,2447,2448,2449,2450,2451,2452,2454,2455,2457,2458,2459,2460,758,2354,15563,2352,2377,2350,2378,2351,2379,2349,15357,14761,2382,2342,2387,15360,15359,14852,2390,2338,2391,2337,2392,2336,2393,2394,2335,2395,2334,2333,2396,18488,18489,2331,18238,2399,16198,16197,16120,17023,2327,2402,2325,2404,15467,2405,2322,2407,14851,2408,2409,2320,15469,17408,2318,2411,2317,14860,2316,2413,18043,14850,15512,2418,2310,2419,2307,2422,18404,2423,2305,2424,2304,14858,2426,2303,2302,2427,2300,2429,2299,2430,2298,2431,2297,2432,2295,2434,2294,2293,2292,2291,15247,2288,2287,15248,2285,15867,2283,2282,2281,18606,2278,2277,2276,15194,2274,2273,2271,2270,18605,18016,2355,17592,1115,2357,2343,2386,2345,15358,1439,2309,2420,2308,2421,2367,15052,1431,2368,1429,2359,1423,1438,1117,2370,2296,15982,1427,2326,14768,17590,1437,2353,2376,1430,1113,1425'),
(2,'14483,4872,17057,7137,7175,1514,14458,15431,15432,14032,14019,17902,15428,14885,17903,14020,15429,15433,18050,4883,4871,4884,4870,15482,14645,2505,2555,2504,2556,2503,2557,15148,2558,2501,2559,15164,2560,2499,2561,2498,2562,2506,2554,1646,1527,1645,1638,1533,1639,1528,1644,1529,1643,1525,1530,1642,15671,587,590,589,760,759,756,754,755,5033,5040,5039,5034,5038,5035,5037,5036,1121,1123,1122,1103,1102,1101,14510,14510,18620,5013,5004,5005,9188,1115,1439,15052,1431,1429,1423,1438,1117,1427,1437,1430,1113,1425,1515,1656,1513,1658,1421'),
(8,'5951,5776,5953,5774,5918,5812,8020,5848,4448,5804,5926,5924,5806,4615,17904,5914,17905,5912,5815,18215,18213,18212,5817,16050,17157,5908,17123,5907,5820,5906,5821,5822,5905,5823,5904,5903,17595,5902,5825,5900,5827,5092,5150,5090,17170,5091,17060,5088,17158,5087,5155,5086,16127,5898,5829,17378,5830,5831,5896,5895,15023,5833,5894,17951,17950,5835,5892,5838,5889,17400,5839,5840,5887,14856,5841,5842,5885,5884,17373,15872,15873,15874,15875,5879,15876,5850,5878,5852,5876,14495,14496,5854,5874,5855,5873,5856,5872,5857,5871,5870,14818,5869,5859,5860,17231,5861,15085,15086,5866,5863,17510,5864,3681,17472,5970,14901,5761,5967,5959,5769,18469,18468,1349,5957,5762,5966,14906,15406,5779,18571,15354,5941,15347,14911,14908,5759,5969,5921,5809,18240,5772,14909,14907,15151,15273,15363,5788,5780,5947,5149,5792,5891,5836,5890,5837,5963,5765,4638,5936,18009,5799,15356,15350,17487,18436,440,15008,5877,17953,5802,5928,15274,5790,5931,15352,5950,15407,15405,16125,5901,14863,4618,4639,18011,15351,14777,17366,5093,5760,5968,5961,5767,14487,4640,17390,5756,5771,5956,14910,5764,5775,5952,5768,5960,5881,5917,5917,18184,205,5757'),
(26,'5255,5264,5258,5261,5257,5262,14156,15240,15239,12267,12238,12269,12236,12272,12233,12275,12231,14483,4872,12273,12232,12271,12234,15309,7040,7043,7038,7045,7041,15391,7046,15147,7044,7047,7066,7017,7067,7016,7372,7256,7370,7258,9453,9452,15238,7367,7261,4883,4871,4884,4870,582,597,15282,7014,7068,15253,7069,7070,7012,7071,7011,7072,7010,15678,7073,7074,7008,7359,7270,7358,7271,7357,7272,7356,7273,7355,7274,7366,7262,7263,7365,7264,7364,7265,7363,15084,7266,7267,7361,17043,7015,17545,7260,1126,1121,1100,1123,1586,1122,1103,1125,14485,1102,1110,76,1105,2188,15241,18396,1101,1124,1119,1104,1120,14488,73,1106,7035,7048,7034,7049,7033,7050,7032,7051,7030,7053,7029,7054,7028,7055,7027,7056,7026,7057,7025,7058,7024,7059,7022,15031,7021,7062,7020,7063,7019,7064,7018,7065,7023,7060,7031,7052,12230,6990,7093,6989'),
(21,'15739,7494,7491,7493,6891,6907,6906,14193,6967,6970,6945,6893,17124,6895,6903,6896,6902,6900,6957,6980,6877,6921,6846,6953,6862,6937,6958,6979,15797,6925,14646,6952,15692,14891,6981,17188,17187,14879,14892,5117,5122,18443,14069,16113,6976,16193,6947,6884,6914,6966,6971,6880,6918,6964,6973,6867,6932,2190,6885,6912,17205,17189,15140,6911,6889,6908,6887,6910,6888,6909,6861,6938,6897,6901,6883,6915,15306,15307,6959,6978,16195,17686,18649,6950,18444,6924,15965,6855,6944,15862,15863,6869,6930,6913,6863,6936,15691,18353,14845,6665,6858,6941,6960,6977,6962,6975,6872,15780,6879,6919,15827,6881,6917,6859,17687,6851,6948,15778,15779,5116,15305,18445,6965,6972,6865,6934,18441,18442,5124,18051,18052,17397,2193,14559,2192,1568,1567,16112,6968'),
(12,'15921,326,313,379,259,381,257,332,307,17223,17224,11575,15918,12803,15278,12805,1579,18318,14760,14207,13191,14206,14203,373,265,375,263,376,262,377,261,380,258,355,283,18395,14976,334,305,14981,14982,349,17122,327,312,382,17059,15938,278,17425,17441,15377,315,344,13192,17517,17516,353,285,17396,14459,358,17636,362,275,18174,310,366,272,356,14955,367,17440,370,268,368,270,369,17427,300,17206,260,361,277,16104,16103,301,335,17003,17084,15362,333,306,341,298,365,14954,336,303,354,284,357,17637,364,274,359,279,16139,316,350,288,337,302,351,287,348,15983,343,296,342,297,16140,14874,14205,14204,15415,15414'),
(50,'8752,8755,8751,8756,14135,4485,4433,8616,8622,8617,8621,8969,8615,8623,8620,8618,15132,8970,1802,8880,8900,8898,8882,8897,8883,8884,8896,8885,8895,8889,8891,8757,8750,17274,17273,8831,8946,8817,8958,8749,8758,8816,8959,8844,8933,8922,16045,8836,8941,8952,8825,8835,8942,8824,8953,8753,14961,8828,8949,8863,8915,14489,8888,8858,8920,8931,8846,8839,8938,44,8832,8945,8845,8932,8890,8823,8954,8843,8934,14975,14963,4954,8819,8961,8619,18321,8841,8864,8914,8838,8939,8829,8948,8917,15902,8872,8907,8881,8899,8862,8916,8859,8919,8857,8921,8951,8827,111,15449,18623,8913,14962,4955,15226,8910,17267,8929,8849,8822,8955,8873,8906,8860,8918,8874,8905,8853,8925,8902,8878,8901,8833,8944,18508,8851,8834,8943,8821,8956,8876,8904,8855,8923,8847,8930,8911,8912,17272,8830,8947,8842,8935,8837,8940,8820,8957,8960,8815,15869,15199,15200,8805,4802,4789,4803,4788,4804,4787,4486,8875'),
(43,'7991,8020,8004,16065,16199,7997,8060,7996,8062,7994,8063,18290,17542,8002,8003,8055,8054,8010,14562,7998,8059,17552,17551,8012,8045,8000,8057,17543,8049,8001,8056,8011,8175,8175,7993,8018,5093,6476,6473,6473,7989,8013,8044,8016,8041,8014,8043,5148,17149,8017,8040,16057,16057,17520,17520,6514,6515,6515'), 
(28,'14155,14483,4872,7137,7175,1522,1650,1519,1653,1514,12713,17046,1108,4732,77,80,4883,4871,4884,4870,1524,1648,1523,14461,70,69,68,71,72,5033,15915,5040,5039,5034,5038,5035,7135,7176,7134,17646,7133,7178,7179,7132,7131,7180,5037,5036,1586,14485,75,73,7213,1521,1651,1520,1652,1518,1654,1655,1517,1649,7130,7181,1515,1656,1513,1658,1512,1659,1511,1660,1510,1661,5320,5201,5318,5202,15804,5317,5203,14948,7182,7128,17656,7184,7127,7185,7126,14819,7186,7187,7124,15083,7188,7189,7122,7190,7121,7191,7120,7192,7119,7118,7193,7114,7197,7198,7113,7199,7112,7200,7111,7201,7110,7202,7109,7203,7108,7204,7107,7205,7106,7206,7105,7104,17870,7208,7103,7102,12020,7101,7210,7100,7211,7115,7196,5316,7117,7116,7194,7195,18252'),
(171,'17057,10569,10561,10566,10570,17563,10567,10563,10572,15752,18012,13197,14019,17902,14020,15433,17423,14033,14034,17846,1521,1520,1518,15919,15816,16036'),
(172,'17057,18012,13197,14019,17902,14020,15433,17423,1646,1523,1528,1644,1525,1647,16116,15671,14886,14033,14034,17846,14039,14036,14043,14040,14041,15818,15817'),
(192,'14023,13195,13197,5009,5024,4992,15164,17646,455,316,16140'),
(65,'820,772,741,828,685,15517,15516,778,735,783,730,784,729,18376,18375,833,680,797,18642,15338,720,829,16083,798,18323,821,692,766,788,725,765,15672,808,15560,590,769,744,738,15557,703,18377,18374,789,724,813,700,802,15175,814,15559,819,694,695,818,815,698,693,771,742,817,696,822,691,3883,689,688,3824,809,704,790,723,823,690,826,15450,686,830,683,832,681,589,834,15336,15335,15334,15337,15256,14774,836,677,15174,736,837,14810,838,15270,842,671,670,782,731,668,840,17567,14809,672,791,18646,781,14588,785,728,776,737,760,812,17159,780,15135,794,18644,16028,800,714,844,669,811,702,761,764,759,805,708,739,796,717,15340,18645,787,726,786,727,747,756,754,755,14775,18495,751,17071,18220,14162'),
(56,'17146,12593,12505,12592,15773,12594,12504,12591,12507,10204,10333,10206,10331,10207,10330,5505,17773,17771,17772,5520,5518,5516,14101,455,18126,18124,18123,450,15016,5450,14564,18569,5537,17900,5442,5569,18424,5584,15198,5554,17013,5527,17834,18358,15216,15215,5529,5496,5440,5585,5458,5562,17413,5489,17136,5525,5500,5474,15045,15041,5435,5590,15341,5502,17959,5462,5535,5490,5459,5568,3725,17011,17015,17135,5503,18578,5443,5454,5572,5559,5467,18425,5452,5447,5580,5445,5446,5579,5444,5581,5578,5448,5589,5436,5567,5591,17175,5545,15233,5558,15922,5468,5550,5475,5566,5586,14617,5533,5492,15847,5481,5478,5546,18359,5487,17014,15214,15213,5494,5460,5469,5557,5466,5560,5561,5465,17477,5456,5438,5587,5552,5534,5491,5544,5553,5577,5547,17917,5588,5437,5563,15845,15846,5463,443,18122,445,442,446,448,449'),
(70,'2041,2032,2090,1983,1898,1897,2037,2059,2014,1970,14597,15014,2068,2005,17982,17975,2079,17976,2051,2022,16095,15191,2038,5370,2056,15372,2043,18156,2063,14776,2053,2020,2072,2001,15042,1993,2048,17184,17978,1992,14571,17977,15368,15374,2064,2009,2074,15829,2084,1989,2075,14570,17979,15805,15962,1985,2086,1987,2089,1984,17980,1986,2034,2092,1981,17185,17186,2045,2028,2093,15463,18165,14565,2094,1979,2096,1977,17981,1976,2102,1971,2101,1972,16081,2055,15369,18163,18162,2060,2013,2098,1975,2083,1990,2073,2000,2069,2004,2042,2076,1997,2082,1991,2100,1973,2070,2003,15676,2033,14569,14596,2061,17131,18412'),
(57,'3855,3883,689,3824,3856,248,246,247,3846,3862,3834,3874,3826,3882,17883,17882,3851,3857,3832,3876,3839,3869,3841,3867,3849,3852,3830,3878,3837,3871,3835,3873,17884,3848,3868,15013,3829,3879,3844,3864,3842,3866,3845,3880,15012,3838,3870,3831,3877,3847,3833,3875,3850,3858,3827,3881,3843,3865,15126,3854,16166'),
(72,'15417,1002,1004,845,957,887,17000,902,987,16035,939,903,17128,890,950,893,15283,15011,18481,882,975,870,924,923,928,18622,14428,913,961,850,851,15397,15375,846,954,889,933,15376,875,964,880,946,897,17129,888,967,15483,17130,17125,968,18476,847,16101,974,871,14832,14831,934,18477,18475,874,971,15276,976,15484,18492,18493,929,916,977,868,963,881,947,896,978,867,849,17864,863,18491,865,856,981,18494,984,861,986,17921,988,989,985,860,990,945,898,993,992,852,14171,16102,996,1001,998,1000,919,997,848,18570,895,16142,915,941,901,17439,15149,854,951,15958,999,927,918,910,959,885,965,879,883,857,17127,17126,17654,891,926,920,949,894,943,899,942,900,8611,1005'),
(74,'1283,1286,1246,1326,15232,17254,1278,1294,1243,1329,1240,1332,17403,14812,1252,1320,15207,1306,1340,1236,18348,18347,15517,15516,18319,18306,1224,1348,1255,1317,1258,1314,1248,1324,1259,1313,1264,1308,1263,1309,1261,1311,1265,1307,1250,1322,1262,1310,17923,1267,1305,1270,1302,15986,1304,1253,1319,1269,1303,1273,1299,1271,1301,1272,15844,1275,1297,1277,1295,1279,1293,1280,1292,15462,1296,14589,14590,1281,1291,1282,15257,1238,1334,1257,1315,1227,1345,1233,1241,18088,1327,17922,1346,6597,17253,18305,1249,1323,1256,1316,1251,1321,1228,1260,1312,1242,1330,18086,1333,1339,1225,842,671,670,668,840,17567,14809,672,844,669,1349,1353,1352,1350,1351'),
(84,'11483,11500,11441,11503,11438,11471,11470,11473,11468,11427,11509,11432,11510,11431,11511,11430,11512,11429,11513,11428,17156,14876,11490,11451,11487,11454,11498,11443,11508,11433,11482,14556,11506,11435,11491,11450,11495,11446,11505,11436,11507,11434,11496,11445,11504,14966,11499,11442,11494,11447,11485,11456,15208,11440,11480,11461,11479,11462,11488,11453,11439,11492,11449,11502,11497,11444,11458,11489,11452,11486,11455,11493,11448,11481,11460,18264,11464,11474,11467,11463,11478,11465,11476,11466,11475,11484,11457'),
(78,'11425,11300,17943,17393,18166,15518,1814,1813,1935,1936,15519,11426,11298,11306,11424,11301,18066,18067,11305,11423,11299,11386,11341,14828,17944,11415,11312,11383,14813,11380,11347,15885,16109,15949,11336,15688,11324,11364,17610,18626,11396,11331,11422,11384,11343,11376,11393,11334,17045,11371,18627,11351,11387,11340,11397,11330,11400,11327,11398,11329,11389,11338,11402,11325,11399,11328,11404,11323,11407,11320,11405,11322,11392,11335,14827,18453,11410,11317,11408,11319,11409,11318,11412,11315,11363,11414,11313,11416,11311,11417,11310,11413,11314,11406,11321,11418,11309,11419,11420,17523,11421,11307,11378,11349,11395,11332,11372,18641,18640,17945,11342,15814,11388,11339,11394,11333,11390,11337,11379,17609,11374,11353,11401,11326,11373,11354,14477,4945,4910,4941,18580,4914,4917,4916,4943,4912,11362,4915'),
(1,'1564,1606,7684,12713,17046,1108,4732,77,80,1563,1562,16119,1560,15314,67,14461,70,69,68,71,72,1581,1590,1579,1592,18318,1593,14760,1595,1575,1596,1573,1598,1570,16014,15313,17243,1568,1602,1567,1603,1566,1604,1565,1605,1607,1608,1609,1610,1583,1588,1582,1589,1584,1587,15312,1599,1574,1597,1586,14485,1580,1591,75,73'),
(3,'15739,7494,7491,7493,2180,2195,2197,2201,7686,2166,2203,2150,2219,2980,2818,2981,2817,17754,18630,2190,18353,582,597,15282,593,584,595,17397,2193,2181,2194,2179,2196,2178,2198,2171,2170,2199,2168,2169,17300,2167,2202,2165,2204,2164,2205,2161,2208,2160,2209,2159,2210,2158,2211,2157,2212,2156,2213,2155,2214,2154,2215,2153,2216,2152,2217,2151,2218,2149,2220,2148,2221,2145,2224,15486,2225,2143,2226,2142,2227,2228,2141,2140,2229,2139,2230,2231,2138,15537,2137,2232,2136,2233,2135,2234,2131,2238,2130,2239,2129,2240,2128,2241,17381,2242,2126,2243,2125,2244,2124,2245,2123,2246,2122,2247,2121,17363,2120,2249,2119,2250,2118,2251,2117,2252,2116,2253,2115,2254,2114,2255,2113,2256,2112,2257,18432,2258,2110,2259,2109,2260,2107,2262,2106,2263,16001,2132,2237,2108,2261,2147,2222,2146,2223,2134,2235,2133,2236,2162,2207,2163,2206,14559,2192,1581,1590,1579,1592,18318,1593,14760,1595,1575,1596,1573,1598,1568,1567,1583,1588,2816,7529,7530,7531,1582,1589,1584,1587,15312,1126,1574,1597,1121,1100,1123,1586,1122,1103,1125,14485,1102,1110,76,1105,2188,15241,18396,1101,1124,1119,1580,1591,1104,1120,14488,73,1106,7732,15999'),
(37,'14210,6351,572,6363,2042,4619,15020,14426,4623,1348,6597,14461,1403,1400,1402,1456,1401,6611,6715,6714,15437,6712,14762,6608,6718,4627,6713,6610,6716,4626,18402,6609,6728,6723,17140,6601,6725,6721,6605,6600,6726,17139,6724,6719,6607,6599,6727,84,15864,17712,6730,4635,5020,5021,6613,4636,4630,4633,4628,4634,6614,4632');

-- -----------------------------------------------------------------------------------------------

INSERT INTO train_schedule(train_schedule_id, route)
VALUES
(1, 'Howard, Jarvis, Morse, Loyola, Granville, Thorndale, Bryn Mawr, Argyle, Wilson, Sheridan, Addison, Belmont, Fullerton, North/Clybourn, Clark/Division, Chicago, Grand, Lake, Monroe, Jackson, Harrison, Roosevelt, Cermak-Chinatown, Sox-35th, 47th, Garfield, 63rd, 69th, 79th, 87th, 95th/Dan Ryan'),
(2,'95th/Dan Ryan, 87th, 79th, 69th, 63rd, Garfield, 47th, Sox-35th, Cermak-Chinatown, Roosevelt, Harrison, Jackson, Monroe, Lake, Grand, Chicago, Clark/Division, North/Clybourn, Fullerton, Belmont, Addison, Sheridan, Wilson, Argyle, Bryn Mawr, Thorndale, Granville, Loyola, Morse, Jarvis, Howard'),
(3,'Midway, Pulaski, Kedzie, Western, 35th/Archer, Ashland, Halsted, Roosevelt, Harold Washington Library-State/Van Buren, LaSalle/Van Buren, Quincy, Washington/Wells, Clark/Lake, State/Lake, Washington/Wabash, Adams/Wabash'),
(4,'Adams/Wabash, Washington/Wabash, State/Lake, Clark/Lake, Washington/Wells, Quincy, LaSalle/Van Buren, Harold Washington Library-State/Van Buren, Roosevelt, Halsted, Ashland, 35th/Archer, Western, Kedzie, Pulaski, Midway'),
(5,'Dempster-Skokie, Oakton-Skokie, Howard'),
(6,'Howard, Oakton-Skokie, Dempster-Skokie'),
(7,'Ashland/63rd, Halsted, Garfield, 51st, 47th, 43rd, Indiana, 35th-Bronzeville-Iit, Cermak-Mccormick Place, Roosevelt, Adams/Wabash, Washington/Wabash, State/Lake, Clark/Lake, Clinton, Morgan-Lake, Ashland-Lake, California, Kedzie, Conservatory-Central Park Drive, Pulaski, Cicero, Laramie, Central, Austin, Ridgeland, Oak Park, Harlem/Lake'),
(8,'Harlem/Lake, Oak Park, Ridgeland, Austin, Central, Laramie, Cicero, Pulaski, Conservatory-Central Park Drive, Kedzie, California, Ashland-Lake, Morgan-Lake, Clinton, Clark/Lake, State/Lake, Washington/Wabash, Adams/Wabash, Roosevelt, Cermak-McCormick Place, 35th-Bronzeville-IIT, Indiana, 43rd, 47th, 51st, Garfield, Halsted, Garfield, Ashland/63rd'),
(9,'Harlem/Lake, Oak Park, Ridgeland, Austin, Central, Laramie, Cicero, Pulaski, Conservatory-Central Park Drive, Kedzie, California, Ashland-Lake, Morgan-Lake, Clinton, Clark/Lake, State/Lake, Washington/Wabash, Adams/Wabash, Roosevelt, Cermak-McCormick Place, 35th-Bronzeville-IIT, Indiana, 43rd, 47th, 51st, Garfield, King Drive, East 63rd-Cottage Grove'),
(10,'East 63rd-Cottage Grove, King Drive, Garfield, 51st, 47th, 43rd, Indiana, 35th-Bronzeville-IIT, Cermak-McCormick Place, Roosevelt, Adams/Wabash, Washington/Wabash, State/Lake, Clark/Lake, Clinton, Morgan-Lake, Ashland-Lake, California, Kedzie, Conservatory-Central Park Drive, Pulaski, Cicero, Laramie, Central, Austin, Ridgeland, Oak Park, Harlem/Lake'),
(11,'O\'Hare, Rosemont, Cumberland, Harlem (O\'Hare), Jefferson Park, Montrose, Irving Park, Addison, Belmont, Logan Square, California, Western (O\'Hare), Damen, Division, Chicago (O\'Hare), Grand, Clark/Lake, Washington, Monroe, Jackson, LaSalle, Clinton, UIC-Halsted, Racine, Illinois Medical District, Western-Forest Park Branch, Kedzie-Homan, Pulaski, Cicero, Austin, Oak Park, Harlem-Forest Park Branch, Forest Park'),
(12,'Forest Park, Harlem-Forest Park Branch, Oak Park, Austin, Cicero, Pulaski, Kedzie-Homan, Western-Forest Park Branch, Illinois Medical District, Racine, UIC-Halsted, Clinton, LaSalle, Jackson, Monroe, Washington, Clark/Lake, Grand, Chicago (O\'Hare), Division, Damen, Western (O\'Hare), California, Logan Square, Belmont, Addison, Irving Park, Montrose, Jefferson Park, Harlem (O\'Hare), Cumberland, Rosemont, O\'Hare'),
(13,'Linden, Central, Noyes, Foster, Davis, Evanston, Main, South Boulevard, Howard'),
(14,'Howard, South Boulevard, Main, Evanston, Davis, Foster, Noyes, Central, Linden'),
(15,'54th/Cermak, Cicero, Kostner, Pulaski, Central Park, Kedzie, California, Western, Damen, 18th, Polk, Ashland, Morgan, Racine, Clinton, Clark/Lake, State/Lake, Washington/Wabash, Adams/Wabash, Harold Washington Library-State/Van Buren, LaSalle/Van Buren, Quincy, Washington/Wells'),
(16,'Washington/Wells, Quincy, LaSalle/Van Buren, Harold Washington Library-State/Van Buren, Adams/Wabash, Washington/Wabash, State/Lake, Clark/Lake, Clinton, Racine, Morgan, Ashland, Polk, 18th, Damen, Western, California, Kedzie, Central Park, Pulaski, Kostner, Cicero, 54th/Cermak'),
(17,'Kimball, Kedzie, Francisco, Rockwell, Western, Damen, Montrose, Irving Park, Addison, Paulina, Southport, Belmont, Wellington, Diversey, Fullerton, Armitage, Sedgwick, Chicago, Merchandise Mart, Washington/Wells, Quincy, LaSalle/Van Buren, Harold Washington Library-State/Van Buren, Adams/Wabash, Madison/Wabash, Randolph/Wabash, State/Lake, Clark/Lake'),
(18,'Clark/Lake, State/Lake, Randolph/Wabash, Madison/Wabash, Adams/Wabash, Harold Washington Library-State/Van Buren, LaSalle/Van Buren, Quincy, Washington/Wells, Merchandise Mart, Chicago, Sedgwick, Armitage, Fullerton, Diversey, Wellington, Belmont, Southport, Paulina, Addison, Irving Park, Montrose, Damen, Western, Rockwell, Francisco, Kedzie, Kimball');
-- -------------------------------------------------

INSERT INTO line (line_id, green, red, blue, brown, purple, yellow, pink, orange)
VALUES
(1, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(2, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(3, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE),
(4, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE),
(5, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
(6, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
(7, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE),
(8, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE),
(9, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
(10, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE),
(11, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(12, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(13, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(14, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(15, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(16, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(17, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE),
(18, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE),
(19, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
(20, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
(21, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
(22, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE),
(23, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE),
(24, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE), #exist for debug purposes
(25, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE); #exist for debug purposes

-- ---------------------------------------------------------------------------------------

INSERT INTO train_station (station_id, line_id, station_name, ada, location)
VALUES
(40420, 7, 'Cicero (Pink Line)', true, '(41.85182, -87.745336)'),
(40780, 7, 'Central Park (Pink Line)', true, '(41.853839, -87.714842)'),
(40940, 1, 'Halsted (Green Line)', true, '(41.778943, -87.644244)'),
(40230, 3, 'Cumberland (Blue Line)', true, '(41.984246, -87.838028)'),
(40470, 3, 'Racine (Blue Line)', false, '(41.87592, -87.659458)'),
(41310, 4, 'Paulina (Brown Line)', true, '(41.943623, -87.670907)'),
(40830, 7, '18th (Pink Line)', true, '(41.857908, -87.669147)'),
(40380, 10, 'Clark/Lake (Blue, Brown, Green, Orange, Purple & Pink lines)', true, '(41.885737, -87.630886)'),
(41280, 3, 'Jefferson Park (Blue Line)', true, '(41.970634, -87.760892)'),
(40530, 9, 'Diversey (Brown & Purple lines)', true, '(41.932732, -87.653131)'),
(41500, 4, 'Montrose (Brown Line)', true, '(41.961756, -87.675047)'),
(40350, 3, 'UIC-Halsted (Blue Line)', true, '(41.875474, -87.649707)'),
(41120, 1, '35th-Bronzeville-IIT (Green Line)', true, '(41.831677, -87.625826)'),
(40520, 5, 'Foster (Purple Line)', false, '(42.05416, -87.68356)'),
(40040, 14, 'Quincy/Wells (Brown, Orange, Purple & Pink lines)', true, '(41.878723, -87.63374)'),
(40360, 4, 'Southport (Brown Line)', true, '(41.943744, -87.663619)'),
(41300, 2, 'Loyola (Red Line)', true, '(42.001073, -87.661061)'),
(41230, 2, '47th (Red Line)', true, '(41.810318, -87.63094)'),
(41380, 2, 'Bryn Mawr (Red Line)', false, '(41.983504, -87.65884)'),
(40980, 3, 'Harlem (Blue Line - Forest Park Branch)', false, '(41.87349, -87.806961)'),
(40900, 18, 'Howard (Red, Purple & Yellow lines)', true, '(42.019063, -87.672892)'),
(41070, 1, 'Kedzie (Green Line)', true, '(41.884321, -87.706155)'),
(41140, 1, 'King Drive (Green Line)', true, '(41.78013, -87.615546)'),
(40290, 1, 'Ashland/63rd (Green Line)', true, '(41.77886, -87.663766)'),
(40450, 2, '95th/Dan Ryan (Red Line)', true, '(41.722377, -87.624342)'),
(40670, 3, 'Western (Blue Line - O\'Hare Branch)', true, '(41.916157, -87.687364)'),
(40660, 9, 'Armitage (Brown & Purple lines)', true, '(41.918217, -87.652644)'),
(41400, 22, 'Roosevelt (Red, Orange & Green lines)', true, '(41.867368, -87.627402)'),
(41320, 20, 'Belmont (Red, Brown & Purple lines)', true, '(41.939751, -87.65338)');

-- -------------------------------------------------------------------------------
insert into bus(bus_id, stop_id, operator_id, bus_schedule_id)
values
(1, 8054, 1, 43),
(2, 14562, 2, 43),
(3, 8059, 3, 43),
(4, 17551, 4, 43),
(5, 8012, 5, 43),
(6, 10257, 6, 54),
(7, 10280, 7, 54),
(8, 10258, 8, 54),
(9, 10279, 9, 54),
(10, 10278, 10, 54),
(11, 2415, 11, 29),
(12, 2453, 12, 29),
(13, 589, 13, 29),
(14, 14775, 14, 29),
(15, 17071, 15, 29),
(16, 14483, 16, 2),
(17, 17057, 17, 2),
(18, 7137, 18, 2),
(19, 1514, 19, 2),
(20, 15431, 20, 2),
(21, 7991, 21, 43),
(22, 8004, 22, 43),
(23, 7997, 23, 43),
(24, 7994, 24, 43),
(25, 8002, 25, 43);

-- ---------------------------------------


INSERT INTO train(train_id, line_color, station_id, operator_id, train_schedule_id)
VALUES
(1, 'red', 41300, 26, 1),
(18, 'red', 41230, 43, 1),
(24, 'red', 40450, 49, 2),
(10, 'red', 41380, 35, 2),
(2, 'orange', 40380, 27, 3),
(19, 'orange', 40040, 44, 3),
(9, 'orange', 41400, 34, 4),
(3, 'yellow', 40900, 28, 5),
(12, 'green', 41140, 37, 6),
(4, 'green', 40940, 29, 7),
(13, 'green', 40290, 38, 8),
(15, 'green', 41120, 40, 9),
(21, 'green', 41070, 46, 10),
(5, 'blue', 40230, 30, 11),
(16, 'blue', 40470, 41, 12),
(6, 'purple', 40520, 31, 13),
(14, 'purple', 40660, 39, 14),
(23, 'blue', 40670, 48, 13),
(25, 'blue', 40980, 50, 14),
(7, 'pink', 40420, 32, 15),
(17, 'brown', 41310, 42, 18),
(8, 'brown', 41500, 33, 17),
(22, 'brown', 40360, 47, 17),
(11, 'pink', 40780, 36, 16),
(20, 'pink', 40830, 45, 15);

-- 

#SQL STATEMENTS

#1 finds train stations that are not ADA complient
SELECT *
FROM train_station
WHERE train_station.ada = FALSE;

#2 gives the operators information displayed as last, first, gender
SELECT last_name, first_name, gender
FROM operator;

#3 gives operators that operate trains
SELECT DISTINCT operator.*
FROM operator
INNER JOIN train ON operator.operator_id = train.operator_id;

#4 this finds the number of buses that stop at each bus stop
SELECT stop_name, COUNT(*) AS num_buses
FROM bus_stop
JOIN bus ON bus.stop_id = bus_stop.stop_id
GROUP BY stop_name;


#5 gives operators that have been working since before 2012
SELECT *
FROM operator
WHERE hire_date < '1997-01-01';

#6 gives bus number and its route
SELECT bus.bus_id, bus_schedule.route
FROM bus
INNER JOIN bus_schedule ON bus.bus_schedule_id = bus_schedule.bus_schedule_id;

#7 gives trains and their routes
SELECT train.train_id, train_schedule.route
FROM train
INNER JOIN train_schedule ON train.train_schedule_id = train_schedule.train_schedule_id;

#8 gives all the stations that service the red line
SELECT *
FROM train_station ts
INNER JOIN line l ON ts.line_id = l.line_id
WHERE l.red = TRUE;

#9 this finds all buses operated by operators with a last name starting with "S"
SELECT b.*, o.first_name, o.last_name
FROM bus b
JOIN operator o ON b.operator_id = o.operator_id
WHERE o.last_name LIKE 'S%';

#10 this finds all train stations on the green line that are ADA accessible
SELECT *
FROM train_station
WHERE line_id = 1 AND ada = TRUE;