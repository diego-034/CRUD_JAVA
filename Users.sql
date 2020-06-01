CREATE TABLE Users
   (
      id int IDENTITY(1,1) PRIMARY KEY,
      name varchar(255),
      password varchar(255),
	  state bit,
      document varchar(255)
   )