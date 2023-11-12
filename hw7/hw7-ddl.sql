# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles
DROP TABLE IF EXISTS peopleroles
# ... 
SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar (255) not null,
    skills_description varchar (255) not null,
    skills_tag varchar (255) not null,
    skills_url varchar (255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)  # Added primary key constraint
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment)
VALUES
    (1, 'Programming', 'Coding in various languages', 'Skill 1', 'www.programming.com', 20),
    (2, 'Graphic Design', 'Creating visual content', 'Skill 2', 'www.design.com', 15),
    (3, 'Data Analysis', 'Analyzing and interpreting data', 'Skill 3', 'www.dataanalysis.com', 25),
    (4, 'Project Management', 'Managing projects and teams', 'Skill 4', 'www.projectmanagement.com', 30),
    (5, 'Communication', 'Effective communication skills', 'Skill 5', 'www.communication.com', 10),
    (6, 'Problem Solving', 'Analytical and critical thinking', 'Skill 6', 'www.problemsolving.com', 15),
    (7, 'Database Management', 'Managing and optimizing databases', 'Skill 7', 'www.database.com', 20),
    (8, 'Network Security', 'Securing computer networks', 'Skill 8', 'www.security.com', 25);



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL AUTO_INCREMENT,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

SELECT * from people

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_last_name, people_first_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined)
VALUES
    (1, 'Person 1', 'First 1', 'email1@example.com', 'linkedin.com/person1', 'headshot1.jpg', 'Discord#1', 'Bio 1', '2023-10-30'),
    (2, 'Person 2', 'First 2', 'email2@example.com', 'linkedin.com/person2', 'headshot2.jpg', 'Discord#2', 'Bio 2', '2023-10-31'),
    (3, 'Person 3', 'First 3', 'email3@example.com', 'linkedin.com/person3', 'headshot3.jpg', 'Discord#3', 'Bio 3', '2023-11-01'),
    (4, 'Person 4', 'First 4', 'email4@example.com', 'linkedin.com/person4', 'headshot4.jpg', 'Discord#4', 'Bio 4', '2023-11-02'),
    (5, 'Person 5', 'First 5', 'email5@example.com', 'linkedin.com/person5', 'headshot5.jpg', 'Discord#5', 'Bio 5', '2023-11-03'),
    (6, 'Person 6', 'First 6', 'email6@example.com', 'linkedin.com/person6', 'headshot6.jpg', 'Discord#6', 'Bio 6', '2023-11-04');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can be NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int AUTO_INCREMENT,
    skills_id int not null,
    people_id int not null,
    date_acquired date not null,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

-- Person 1 has skills 1, 3, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-10-30'), -- Skill 1
(3, 1, '2023-10-31'), -- Skill 3
(6, 1, '2023-11-01'); -- Skill 6

-- Person 2 has skills 3, 4, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(3, 2, '2023-11-02'), -- Skill 3
(4, 2, '2023-11-03'), -- Skill 4
(5, 2, '2023-11-04'); -- Skill 5

-- Person 3 has skills 1, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 3, '2023-11-05'), -- Skill 1
(5, 3, '2023-11-06'); -- Skill 5

-- Person 4 has no skills

-- Person 5 has skills 3, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(3, 5, '2023-11-07'), -- Skill 3
(6, 5, '2023-11-08'); -- Skill 6

-- Person 6 has skills 2, 3, 4
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(2, 6, '2023-11-09'), -- Skill 2
(3, 6, '2023-11-10'), -- Skill 3
(4, 6, '2023-11-11'); -- Skill 4

-- Person 7 has skills 3, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(3, 7, '2023-11-12'), -- Skill 3
(5, 7, '2023-11-13'), -- Skill 5
(6, 7, '2023-11-14'); -- Skill 6

-- Person 8 has skills 1, 3, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 8, '2023-11-15'), -- Skill 1
(3, 8, '2023-11-16'), -- Skill 3
(5, 8, '2023-11-17'), -- Skill 5
(6, 8, '2023-11-18'); -- Skill 6

-- Person 9 has skills 2, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(2, 9, '2023-11-19'), -- Skill 2
(5, 9, '2023-11-20'), -- Skill 5
(6, 9, '2023-11-21'); -- Skill 6

-- Person 10 has skills 1, 4, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 10, '2023-11-22'), -- Skill 1
(4, 10, '2023-11-23'), -- Skill 4
(5, 10, '2023-11-24'); -- Skill 5


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int not null,
    roles_name varchar(255) not null,
    roles_sort_priority int not null,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, roles_name, roles_sort_priority)
VALUES
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int AUTO_INCREMENT,
    people_id int not null,
    role_id int not null,
    date_assigned date not null,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(roles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

-- Person 1 is Developer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (1, 2, '2023-10-30');

-- Person 2 is Boss, Mentor
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 5, '2023-10-31');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (2, 6, '2023-10-31');

-- Person 3 is Developer and Team Lead
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 2, '2023-11-01');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (3, 4, '2023-11-01');

-- Person 4 is Recruit
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (4, 3, '2023-11-02');

-- Person 5 is Recruit
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (5, 3, '2023-11-03');

-- Person 6 is Developer and Designer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 2, '2023-11-04');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (6, 1, '2023-11-04');

-- Person 7 is Designer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (7, 1, '2023-11-05');

-- Person 8 is Designer and Team Lead
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 1, '2023-11-06');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (8, 4, '2023-11-06');

-- Person 9 is Developer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (9, 2, '2023-11-07');

-- Person 10 is Developer and Designer
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 2, '2023-11-08');
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES (10, 1, '2023-11-08');