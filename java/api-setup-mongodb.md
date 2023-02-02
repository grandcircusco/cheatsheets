# SPRING BOOT MVC SETUP GUIDE (MONGODB)

### 1. CREATE & DOWNLOAD FROM START.SPRING.IO
* Browse to [https://start.spring.io](https://start.spring.io)
* Select **Gradle - Groovy** Project
* Select the Spring Boot **version that starts with 2**, but not the snapshot.
* Enter a **group name**, e.g. co.grandcircus
* Enter an **artifact name**, e.g. spring-lab
* Change Packaging from Jar to **War**.
* Pick the latest Java Version if you have it.
* Add Dependencies: **Spring *Web*,** **Spring Boot *DevTools*,** **Spring Data *MongoDB***
* Click **Generate Project**. It will download a ZIP file.
* Unzip the file. This will create a folder.
* Move the folder to a location with your other projects. (You probably don't want to leave it in Downloads.)

### 2. IMPORT INTO ECLIPSE
* In Eclipse, select **File** > **Import**
* Select **Existing Gradle Project**
* For Project root directory, select the unzipped folder that you downloaded. Click finish.
* Wait for the import to complete. There is a progress bar near the bottom-right of Eclipse.

### 3. SECRET APPLICATION.PROPERTIES
Create an additional ``config/application.properties`` and .gitignore it. Your mongo connection URI should go here.
This is also a good place for any passwords or API keys or anything that should be different between group project members.

* Inside `src/main/resources`, create a new Folder called `config`.
* Inside the `config` folder create a new File called `application.properties`.
* Add your database connection info here. For example:

```
spring.data.mongodb.uri=mongodb+srv://admin:j39SnoDiEms7fN20@cluster0.end8n.mongodb.net/my_database
spring.data.mongodb.database=my_database
```
* Open `.gitignore`. You may need to open the Navigator view in Eclipse to see this hidden file.
* At the bottom of `.gitignore`, add this line: `src/main/resources/config/application.properties`.

### 4. CREATE A MODEL CLASS
* In `src/main/java`, inside your package, create a new Java class.
* Add one annotation on the class:
```java
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("flowers") // Or whatever collection name you want
public class Flower {
```
* Mark your id field inside the class:
```java
@Id
private String id;
```
* Include a full constructor with all members and a default constructor with no params

### 5. CREATE A DATA REPOSITORY
*WARNING*: For this step, you must create your Repository in the main package or in a subpackage of the main package of your app.

* In `src/main/java`, inside your package, create a new Java **interface**.
* Name it `<Something>Repository`
* It must extend `MongoRepository` using generic parameters for the entity type and the entity's ID type. For example, my entity is `Flower` and it has an ID of type `String`...

```java
public interface FlowerRepository extends MongoRepository<Flower, String> {

}
```
* Leave the body of the interface empty for now. It inherits all the methods you need to start; these methods are created automatically by Spring Data (which is not typical for interfaces -- normally you create the implementations of the interfaces).

### 6. CREATE A CONTROLLER
* In `src/main/java`, inside your package, create a new Java file.
* Name it `<Something>Controller`.
* Annotate the class with `@RestController`
* Add methods that return various kinds of data such as model objects, lists of objects, or void.
* Annotate the method with `@GetMapping("/some-url-path")`, `@PostMapping("/some-url-path")`, `@PutMapping("/some-url-path")`, `@DeleteMapping("/some-url-path")`, or `@PatchMapping("/some-url-path")`, using the URL path you want for this page (`"/"` for the root.

### 7. WIRE REPOSITORY TO CONTROLLER
* In your Controller, add a private field with the type of your Dao. Annotate this field with `@Autowired`.
* Within your controller methods, use this field to access the methods on your DAO.

For example:

```java
@Autowired
private FlowerRepository repo;
```

### 8. START SERVER
* Select the `___Application.java` file.
* Right-click. Select Run As... Java Application.
* Visit http://localhost:8080 in your browser.
