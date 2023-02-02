# SPRING BOOT MVC SETUP GUIDE (MYSQL)

### 1. CREATE & DOWNLOAD FROM START.SPRING.IO
* Browse to [https://start.spring.io](https://start.spring.io)
* Select **Gradle - Groovy** Project
* Select the Spring Boot **version that starts with 2**, but not the snapshot.
* Enter a group name, e.g. co.grandcircus
* Enter an artifact name, e.g. spring-lab
* Change Packaging from Jar to War.
* Pick the latest Java Version if you have it.
* Add Dependencies: Spring *Web*, Spring Boot *DevTools*, ***MySQL* Driver**, **Spring Data *JPA***
* Click Generate Project. It will download a ZIP file.
* Unzip the file. This will create a folder.
* Move the folder to a location with your other projects. (You probably don't want to leave it in Downloads.)

### 2. IMPORT INTO ECLIPSE
* In Eclipse, select **File** > **Import**
* Select **Existing Gradle Project**
* For Project root directory, select the unzipped folder that you downloaded. Click finish.
* Wait for the import to complete. There is a progress bar near the bottom-right of Eclipse.

### 3. ADD GRADLE DEPENDENCIES
* Open `build.gradle`. Within the `dependencies {}` section, add the following

```groovy
// added for JSP rendering
implementation 'javax.servlet:jstl'
providedRuntime 'org.apache.tomcat.embed:tomcat-embed-jasper'
```

To apply these changes...
* Right-click `build.gradle`
* Select Gradle... Refresh Gradle Project

### 4. CONFIGURE APPLICATION.PROPERTIES
* Open `src/main/resources/application.properties`.
* Add the following. (HINT: Make sure there are no spaces at the beginning or end of the lines.)

```properties
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
# This next line is optional. If you want to run multiple servers at once, give each app a different server port.
# If you want to use this line, uncomment it by removing the #
#server.port=8081

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
# This optional property indicates whether hibernate automatically creates schema tables for us
# Set it to create or update, start the app, then set it back to none.
spring.jpa.hibernate.ddl-auto=none
```

#### 4b. SECRET APPLICATION.PROPERTIES
If you have any database passwords or API keys or anything that should be different between group project members, create an additional `config/application.properties` and `.gitignore` it.

* Inside `src/main/resources`, create a new Folder called `config`.
* Inside the `config` folder create a new File called `application.properties`.
* Add your database connection info here. For example:
  * Change the schema (`db_demos`) if need be.
  * Change the password to your MySQL password.

```properties
# Database Connection
# Update this with your own IP (if not localhost), schema, and your username and password
spring.datasource.url=jdbc:mysql://localhost:3306/db_demos?useSSL=false&serverTimezone=America/Detroit
spring.datasource.username=root
spring.datasource.password=password
```
* Open `.gitignore`. You may need to open the Navigator view in Eclipse to see this hidden file.
* At the bottom of `.gitignore`, add this line: `src/main/resources/config/application.properties`.

### 5. CREATE A DATA CLASS (called an entity)
* In `src/main/java`, inside your package, create a new Java class.
* Add this annotation before the class: (All of these annotations are in the `javax.persistence` package.)
```java
@Entity
public class Flower {
```
* If you want an autoincrement identity column, add this inside the class:
```java
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
```
* Include a full constructor with all members and a default constructor with no params

### 6. CREATE A REPOSITORY
*WARNING*: For this step, you must create your Repository in the main package or in a subpackage of the main package of your app.

* In `src/main/java`, inside your package, create a new Java interface.
* Name it `<Something>Repository`
* It must extend `JpaRepository` using generic parameters for the entity type and the entity's ID type. For example, my entity is `Flower` and it has an ID of type `Long`...

```java
public interface FlowerRepository extends JpaRepository<Flower, Long> {

}
```
* Leave the body of the interface empty for now. It inherits all the methods you need to start; these methods are created automatically by the JPA (which is not typical for interfaces -- normally you create the implementations of the interfaces).

### 7. CREATE A CONTROLLER
* In `src/main/java`, inside your package, create a new Java file.
* Name it `<Something>Controller`.
* Annotate the class with `@Controller`
* Add a method that returns a `String`.
* Annotate the method with `@RequestMapping("/some-url-path")`, using the URL path you want for this page (`"/"` for the home page.
* Return a String that gives the name of your view JSP file without the ".jsp" extension.

### 8. CREATE A VIEW
* In `src/main` create three nested folders: **`webapp/WEB-INF/views`**. (HINT: A common mistake is to put this in src rather than src/main. Also if you copy-paste, use care that the folders you create do not contain leading or trailing spaces.)
* Within this views folder, select New > Other…. Select JSP File. * Select a filename that matches the name you returned from your controller, but has the ".jsp" extension.
* Within this JSP, use EL (e.g. `${model}`).
* Optionally, add the JSTL library by adding the following code at the top of the file.

```xml
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

```
### 9. WIRE DAO TO CONTROLLER
* In your Controller, add a private field with the type of your Dao. Annotate this field with `@Autowired`.
* Within your controller methods, use this field to access the methods on your DAO.

For example:

```java
@Autowired
private FlowerRepository repo;
```

### 10. START SERVER
* Select the `___Application.java` file.
* Right-click. Select Run As... Java Application.
* Visit http://localhost:8080 in your browser.

### AUTOMATICALLY CREATE DATABASE TABLES (OPTIONAL)
After you have created and annotated your models, Hibernate can automatically create matching database tables for you.

* In `src/main/resources/application.properties`, change `spring.jpa.hibernate.ddl-auto` to `update`.
* If your app is not already running, start it. (If it was already running it would automatically restart.) When it starts up, it will create the tables it needs. You can check, if you want, by going to MySQLWorkbench and refreshing the tables view.
* Go back to `src/main/resources/application.properties` and set `spring.jpa.hibernate.ddl-auto` back to `none`.
* If models change later, repeat this process. Switch ddl-auto to `update`, restart, then set it back to `none`.
