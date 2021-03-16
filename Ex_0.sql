CREATE TABLE area
(
  areaId INT NOT NULL,
  areaName VARCHAR(20) NOT NULL,
  PRIMARY KEY (areaId)
);

CREATE TABLE city
(
  cityName VARCHAR(20) NOT NULL,
  areaId INT NOT NULL,
  PRIMARY KEY (cityName),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE agent
(
  agentID INT NOT NULL,
  agentName VARCHAR(20) NOT NULL,
  Rating INT NOT NULL,
  HireYear INT NOT NULL,
  bossID INT NOT NULL,
  salary INT NOT NULL,
  areaId INT NOT NULL,
  PRIMARY KEY (agentID),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE client
(
  clientID INT NOT NULL,
  clientName VARCHAR(20) NOT NULL,
  phoneNr INT NOT NULL,
  address VARCHAR(20) NOT NULL,
  agentID INT NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE schedule
(
  meetingTime DATE NOT NULL,
  agentID INT NOT NULL,
  clientID INT NOT NULL,
  PRIMARY KEY (meetingTime, agentID, clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (clientID) REFERENCES client(clientID)
);
