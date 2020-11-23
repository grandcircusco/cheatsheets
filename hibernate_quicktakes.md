
### start.spring.io dependencies:
* Spring Boot DevTools
* SpringWeb
* MySQL Driver
* Spring Data JPA

### Add this to the pom.xml

```
		<!-- Added for JSP Rendering! -->
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
### application.properties
SUGGESTION: Copy from one of your own projects and change the server.port. But if you need a fresh one, here's a copy:
```
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
# This next line is optional, but recommended. You will probably want to give each app a different server port.
# If you want to use this line, uncomment it by removing the #
#server.port=8081

# Database Connection
# Update this with your own IP (if not localhost), and your username and password
spring.datasource.url=jdbc:mysql://localhost:3306/db_demos?useSSL=false&serverTimezone=America/Detroit
spring.datasource.username=root
spring.datasource.password=password

# This optional property indicates whether hibernate automatically creates database tables for us
# Set it to create or update, start the app, then set it back to none.
spring.jpa.hibernate.ddl-auto=none
# If using ddl-auto, be sure to specify this dialect for MySQL
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
# If you want to see the SQL statements being sent to the server, uncomment the following line:
#logging.level.org.hibernate.SQL=DEBUG

```

### Folder for views

Put under src/main
```
webapp/WEB-INF/views
```

### Data Class (Entity) needs these lines. DO NOT SKIP THE TABLE NAME THING!!!
Before the class:
```
@Entity
@Table(name="flower")
```
Inside the class if you want an integer primary key that autoincrements:
```
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private long id = 0;
```

### DAO Repository Interface
```
public interface FlowerRepository extends JpaRepository<Flower, Long> {

}
```

### Controller
Put before the controller class:
```
@Controller
```

Put just inside the controller class each repository; give them each a unique variable name:
```
@Autowired
private FlowerRepository rep;
```

### Views
Add the tag libs if you plan to use the c tags or fmt tags:
```
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

### Suggestion!

Add a println line to your *application.java file's main, similar to this:
```java
	public static void main(String[] args) {
		SpringApplication.run(CarprepApplication.class, args);
		System.out.println("ASSSESSMENT 6");
	}
```







