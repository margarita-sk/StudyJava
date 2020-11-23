# Тhe test task for the development of a web service which gives the outfit advises according to the weather in the particular location(city)

The service must implement 2 ednpointa:
1. Saving information about the temperature interval with the appropriate selection of clothing.
2. Getting information about the proposed set of things for a specific city.

Example 1. Saving information about the temperature interval with the appropriate selection of clothes (the operation is available only to the system administrator).
Temperature - [0, +10] Clothes - boots, insulated jacket, pants, shirt Temperature - [+ 25, + 35] Clothes - shorts, T-shirt, cap, sneakers, etc.

Example 2. Obtaining information about the proposed set of things for a specific city (the operation is publicly available and does not require authorization / authentication).
Input - Miami Output - shorts, T-shirt, cap Input - Vladivostok Output - boots, an insulated jacket, pants, shirt, etc.

Requirements:
- java 14+
- Servlet API
- using a relational database
- the information about temperature and city must be obtained from open APIs.
- use the JDBC API for working with the database.
- primitive UI.
- the project must be hosted on github with launch instructions and related documentation


### Building and running the program:

- Maven version 4 was used for building 
- When building, you should also connect libraries from the webapp/WEB-INF /lib folder
- Apache Tomcat v9.0.20.0 was used to deploy the application
- The application has been tested on Windows 10 OS, JVM version 1.8.0
- The program was performed in a war file using the IDE tools

**Database:**

For local deploying was used SQLite as the database. The weather.db file is located at src / main / resources.

For deploying the application on web hosting was used MySQL.

The selection is done in the src/main/resources/config.propertie file.

By default, the application is configured for local deployment, for web hosting it was necessary to uncomment db.type = webhosting and db.type = local should be commented out.

To work on web hosting, according to the documentation, after deployment, a local configuration file mydb.cfg was created with settings for connecting to the database.


------------------------------

You can change the log4j path in src/main/resources/log4j.propertie file: log4j.appender.file.File="path".

------------------------------
To make it easier to check the operation of the application, the WeatherApp.war file is already build and attached to the project.

You can see how the application works on the website: <http://weather-tips.mycloud.by/>


To login as an administrator use
- login - admin
- password - 12345


To login as a moderator use
- login - moderator
- password - 1111 

The credentials of the moderator, administrator and unauthorized user are shown in the picture
![credentials](https://github.com/margarita-sk/StudyJava/blob/master/credentials.png)
