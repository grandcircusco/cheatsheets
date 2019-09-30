# SPRING BOOT MVC SETUP GUIDE (HIBERNATE)

### 1. CREATE & DOWNLOAD FROM START.SPRING.IO
* Browse to [https://start.spring.io](https://start.spring.io)
* For WAR...
  * Expand "Options".
  * Change Packaging from Jar to War.
* Enter a group name, e.g. co.grandcircus
* Enter an artifact name, e.g. spring-lab
* Add Dependencies: Spring *Web* Starter, Spring Boot *DevTools*, *MySQL* Driver, Spring Data *JPA*
* Click Generate Project. It will download a ZIP file.
* Unzip the file.

### 2. IMPORT INTO ECLIPSE
* In Eclipse, select File > Import
* Select Existing Maven Projects
* For Root Directory, select the unzipped folder that you downloaded. Click finish.
* Wait for the import to complete. There is a progress bar near the bottom-right of Eclipse.

### 3. ADD MAVEN DEPENDENCIES
* Open `pom.xml`. Select the pom.xml sub-tab at the bottom (if applicable). Within the `<dependencies>` tag, add the following

```xml
<!-- Added for JSP Rendering -->
<dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>jstl</artifactId>
</dependency>
<dependency>
	<groupId>org.apache.tomcat.embed</groupId>
	<artifactId>tomcat-embed-jasper</artifactId>
	<scope>provided</scope>
</dependency>
```

### 4. CONFIGURE APPLICATION.PROPERTIES
* Open `src/main/resources/application.properties`.
* Add the following. (HINT: Make sure there are no spaces at the beginning or end of the lines.)
  * Change the database schema (`db_demos`) if need be.
  * Change the password to your MySQL password.

```
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# Database Connection
spring.datasource.url=jdbc:mysql://localhost:3306/db_demos?useSSL=false&serverTimezone=America/Detroit
spring.datasource.username=root
spring.datasource.password=password

# This optional property indicates whether hibernate automatically creates database tables for us
# Set it to create or update, start the app, then set it back to none.
spring.jpa.hibernate.ddl-auto=none
# If using ddl-auto, be sure to specify this dialect for MySQL
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
```

#### 4b. SECRET APPLICATION.PROPERTIES (OPTIONAL)
If you have any passwords or API keys or anything that should be different between group project members, create an additional config/application.properties and .gitignore it.

* Inside `src/main/resources`, create a new Folder called `config`.
* Inside the `config` folder create a new File called `application.properties`.
* Add your database connection info here. For example:

```
spring.datasource.url=jdbc:mysql://localhost:3306/db_demos?useSSL=false&serverTimezone=America/Detroit
spring.datasource.username=root
spring.datasource.password=password
```
* Open `.gitignore`. You may need to open the Navigator view in Eclipse to see this hidden file.
* At the bottom of `.gitignore`, add this line: `src/main/resources/config/application.properties`.

### 5. CREATE A CONTROLLER
* In `src/main/java`, inside your package, create a new Java file.
* Name it `<Something>Controller`.
* Annotate the class with `@Controller`
* Add a method that returns a `ModelAndView`.
* Annotate the method with `@RequestMapping("/some-url-path")`, using the URL path you want for this page (`"/"` for the home page.
* Return a new `ModelAndView` that gives the name of your view JSP file without the ".jsp" extension.

### 6. CREATE A VIEW
* In `src/main` create three nested folders: `webapp/WEB-INF/views`. (HINT: A common mistake is to put this in src rather than src/main. Also if you copy-paste, use care that the folders you create do not contain leading or trailing spaces.)
* Within this views folder, select New > Other…. Select JSP File. * Select a filename that matches the name you returned from your controller, but has the ".jsp" extension.
* Within this JSP, use EL (e.g. `${model}`).
* Optionally, add the JSTL library by adding the following code at the top of the file.

```xml
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
```

### 7. ANNOTATE ENTITY (A.K.A. POJO, DTO, JAVA BEAN)
*WARNING*: For this step, you must create your entities in the main package or in a subpackage of the main package of your app.

* Add `@Entity` annotation to the class.
* Add `@Id` and `@GeneratedValue(strategy=GenerationType.IDENTITY)` to the id field.
* Add `@Table` and `@Column` annotations as needed to adjust database table and column definitions.
* (All of these annotations are in the `javax.persistence` package.)

### 8. CREATE A DAO
*WARNING*: For this step, you must create your DAO/Repository in the main package or in a subpackage of the main package of your app.

#### Option 1: Using EntityManager
* In `src/main/java`, inside your package, create a new Java class.
* Name it `<Something>Dao`.
* Annotate the class with `@Repository` and `@Transactional`
* Create a private field of type `EntityManager` named `em`. Annotate this field with `@PersistenceContext`.
* Create public methods for each of your database operations.
* (`@Transactional`, `PersistenceContext`, and `EntityManager` are in the `javax.persistence` package.)

#### Option 2: Using JpaRepository
* In `src/main/java`, inside your package, create a new Java interface.
* Name it `<Something>Repository`
* It must extend `JpaRepository` using generic parameters for the entity type and the entity's ID type. For example, my entity is `Flower` and it has an ID of type `Long`...

```java
public interface FlowerRepository extends JpaRepository<Flower, Long> {

}
```
* Leave the body of the interface empty for now. It inherits all the methods you need to start.

### 9. WIRE DAO TO CONTROLLER
* In your Controller, add a private field with the type of your Dao. Annotate this field with `@Autowired`.
* Within your controller methods, use this field to access the methods on your DAO.
