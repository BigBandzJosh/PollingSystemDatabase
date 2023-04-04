/*Did this work?*/

CREATE DATABASE PollingSystem;
BEGIN TRANSACTION;
GO
CREATE TABLE PollingSystem (
    PollingSystemID int NOT NULL IDENTITY(1,1),
    PollName varchar(50) NOT NULL,
    PRIMARY KEY (PollingSystemID)
);
GO
CREATE TABLE Admins (
    AdminID int NOT NULL IDENTITY(1,1),
    AdminName varchar(50) NOT NULL, 
    AdminPassword varchar(50) NOT NULL, 
    PollingSystemID int NOT NULL,
    PRIMARY KEY (AdminID),
    FOREIGN KEY (PollingSystemID) REFERENCES PollingSystem(PollingSystemID)

);
GO
CREATE TABLE PollingStation (
    PollingStationID int NOT NULL IDENTITY(1,1),
    PollingStationName varchar(50) NOT NULL,
    PollingStationAddress varchar(50) NOT NULL,
    PollingStationStatus varchar(50) NOT NULL,
    PollingSystemID int NOT NULL,
    PRIMARY KEY (PollingStationID),
    FOREIGN KEY (PollingSystemID) REFERENCES PollingSystem(PollingSystemID)
);
GO
CREATE TABLE Voter (
    VoterID int NOT NULL IDENTITY(1,1),
    VoterName varchar(50) NOT NULL,
    VoterAddress varchar(50) NOT NULL,
    VoterAge int NOT NULL,
    VoterGender varchar(50) NOT NULL,
    VoterPassword varchar(50) NOT NULL,
    VoterStatus varchar(50) NOT NULL,
    PollingStationID int NOT NULL,
    PRIMARY KEY (VoterID),
    FOREIGN KEY (PollingStationID) REFERENCES PollingStation(PollingStationID)
);
GO
CREATE TABLE Candidate (
    CandidateID int NOT NULL IDENTITY(1,1),
    CandidateName varchar(50) NOT NULL,
    CandidateAddress varchar(50) NOT NULL,
    CandidateAge int NOT NULL,
    CandidateGender varchar(50) NOT NULL,
    CandidateStatus varchar(50) NOT NULL,
    PollingSystemID int NOT NULL,
    PRIMARY KEY (CandidateID),
    FOREIGN KEY (PollingSystemID) REFERENCES PollingSystem(PollingSystemID)
);
GO
CREATE TABLE Vote (
    VoteID int NOT NULL IDENTITY(1,1),
    VoterID int NOT NULL,
    CandidateID int NOT NULL,
    PollingStationID int NOT NULL,
    PRIMARY KEY (VoteID),
    FOREIGN KEY (VoterID) REFERENCES Voter(VoterID),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
    FOREIGN KEY (PollingStationID) REFERENCES PollingStation(PollingStationID)
);
GO
COMMIT TRANSACTION;

BEGIN TRANSACTION;
GO
INSERT INTO PollingSystem (PollName) 
VALUES ('Election 2024');

INSERT INTO Admins (AdminName, AdminPassword, PollingSystemID)
VALUES ('Admin', 'Password', 1),
('Admin2', 'Password2', 1),
('Admin3', 'Password3', 1);

INSERT INTO PollingStation (PollingStationName, PollingStationAddress, PollingStationStatus, PollingSystemID) 
VALUES ('PollingStation1', 'Address1', 'Open', 1),
('PollingStation2', 'Address2', 'Open', 1),
('PollingStation3', 'Address3', 'Open', 1);

INSERT INTO Voter (VoterName, VoterAddress, VoterAge, VoterGender, VoterPassword, VoterStatus, PollingStationID)
VALUES  ('Jim', 'Address00', 28, 'Male', 'VoterPassword', 'Active', 1),
('Josh', 'Address01', 27, 'Male', 'VoterPassword', 'Active', 2),
  ('Jane', 'Address02', 32, 'Female', 'VoterPassword', 'Active', 1),
  ('John', 'Address03', 25, 'Male', 'VoterPassword', 'Active', 2),
  ('Janet', 'Address04', 41, 'Female', 'VoterPassword', 'Active', 2),
  ('Bob', 'Address05', 22, 'Male', 'VoterPassword', 'Active', 1),
  ('Alice', 'Address06', 28, 'Female', 'VoterPassword', 'Active', 3),
  ('Charlie', 'Address07', 35, 'Male', 'VoterPassword', 'Active', 2),
  ('David', 'Address08', 29, 'Male', 'VoterPassword', 'Active', 1),
  ('Eve', 'Address09', 27, 'Female', 'VoterPassword', 'Active', 3),
  ('Frank', 'Address10', 48, 'Male', 'VoterPassword', 'Active', 2),
  ('Grace', 'Address11', 31, 'Female', 'VoterPassword', 'Active', 1),
  ('Henry', 'Address12', 44, 'Male', 'VoterPassword', 'Active', 3),
  ('Ivy', 'Address13', 36, 'Female', 'VoterPassword', 'Active', 2),
  ('Jack', 'Address14', 23, 'Male', 'VoterPassword', 'Active', 3),
  ('Karen', 'Address15', 39, 'Female', 'VoterPassword', 'Active', 1),
  ('Leo', 'Address16', 26, 'Male', 'VoterPassword', 'Active', 2),
  ('Maggie', 'Address17', 30, 'Female', 'VoterPassword', 'Active', 3),
  ('Nate', 'Address18', 33, 'Male', 'VoterPassword', 'Active', 1),
  ('Olivia', 'Address19', 37, 'Female', 'VoterPassword', 'Active', 2),
  ('Paul', 'Address20', 50, 'Male', 'VoterPassword', 'Active', 3),
  ('Quinn', 'Address21', 29, 'Female', 'VoterPassword', 'Active', 1),
  ('Ryan', 'Address22', 24, 'Male', 'VoterPassword', 'Active', 2),
  ('Samantha', 'Address23', 42, 'Female', 'VoterPassword', 'Active', 3),
  ('Tom', 'Address24', 38, 'Male', 'VoterPassword', 'Active', 1),
  ('Uma', 'Address25', 43, 'Female', 'VoterPassword', 'Active', 2),
  ('Victor', 'Address26', 34, 'Male', 'VoterPassword', 'Active', 3);


INSERT INTO Candidate (CandidateName, CandidateAddress, CandidateAge, CandidateGender, CandidateStatus, PollingSystemID)
VALUES ('Candidate1', 'CandAddress1', 55, 'Female', 'Active', 1),
  ('Candidate2', 'CandAddress2', 42, 'Male', 'Active', 1),
  ('Candidate3', 'CandAddress3', 33, 'Male', 'Active', 1);
  
INSERT INTO Vote (VoterID, CandidateID, PollingStationID)
VALUES (1, 2, 1),
   (2, 2, 2),
   (3, 2, 1),
   (4, 2, 2),
   (5, 2, 2),
   (6, 3, 3),
   (7, 1, 3),
   (8, 3, 1),
   (9, 2, 3),
   (10, 2, 2),
   (11, 1, 1),
   (12, 3, 3),
   (13, 2, 2),
   (14, 1, 1),
   (15, 2, 2),
   (16, 2, 3),
   (17, 1, 2),
   (18, 2, 1),
   (19, 3, 3),
   (20, 1, 3),
   (21, 2, 1),
   (22, 3, 2),
   (23, 1, 1),
   (24, 2, 3),
   (25, 3, 1);
    COMMIT TRANSACTION;


        /*Update Candidate*/
        UPDATE Candidate SET CandidateName = 'Jane' WHERE CandidateID = 1;
        UPDATE Candidate SET CandidateName = 'Josh' WHERE CandidateID = 2;
        UPDATE Candidate SET CandidateName = 'Steve' WHERE CandidateID = 3;

        /*Update Voter*/
        UPDATE Voter SET VoterName = 'Luna' WHERE VoterID = 1;

        /*Update Admin Login Credentials*/
        UPDATE Admins SET AdminName = 'JoshTheAdmin', AdminPassword = 'adminpass' WHERE AdminID = 1;

        /*To delete a specific voter from the database*/
        DELETE FROM Voter WHERE VoterID = 1;

        /*Select 2 highest voted candidates*/
        SELECT TOP 2 CandidateName, COUNT(VoteID) AS Votes
        FROM Candidate
        INNER JOIN Vote ON Candidate.CandidateID = Vote.CandidateID
        GROUP BY CandidateName
        ORDER BY Votes DESC;

        /*Select lowest voted candidates*/

        SELECT TOP 1 CandidateName, COUNT(VoteID) AS Votes
        FROM Candidate
        INNER JOIN Vote ON Candidate.CandidateID = Vote.CandidateID
        GROUP BY CandidateName
        ORDER BY Votes ASC;

        /*Candidate who got between 5 to 15 votes*/
        SELECT CandidateName, COUNT(VoteID) AS Votes
        FROM Candidate
        INNER JOIN Vote ON Candidate.CandidateID = Vote.CandidateID
        GROUP BY CandidateName
        HAVING COUNT(VoteID) BETWEEN 5 AND 15;

        /*Voting record for each registered candidate*/
        SELECT CandidateName, COUNT(VoteID) AS Votes
        FROM Candidate
        INNER JOIN Vote ON Candidate.CandidateID = Vote.CandidateID
        GROUP BY CandidateName;

        /*Winning candidate name*/
        SELECT TOP 1 CandidateName, COUNT(VoteID) AS Votes
        FROM Candidate
        INNER JOIN Vote ON Candidate.CandidateID = Vote.CandidateID
        GROUP BY CandidateName
        ORDER BY Votes DESC;


        /*Voting record for each registered voter*/
        SELECT VoterName, COUNT(VoteID) AS Votes
        FROM Voter
        INNER JOIN Vote ON Voter.VoterID = Vote.VoterID
        GROUP BY VoterName;
        


        
        





      





