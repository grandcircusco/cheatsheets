# SPRING BOOT MVC SETUP GUIDE (NO DATABASE)

### 1. CREATE & DOWNLOAD FROM START.SPRING.IO
* Browse to [https://start.spring.io](https://start.spring.io)
* Select **Gradle - Groovy** Project
* Select the Spring Boot **version that starts with 2**, but not the snapshot.
* Enter a group name, e.g. co.grandcircus
* Enter an artifact name, e.g. spring-lab
* Change Packaging from Jar to War.
* Pick the latest Java Version if you have it.
* Add Dependencies: Spring *Web*, Spring Boot *DevTools*
* Click Generate Project. It will download a ZIP file.
* Unzip the file. This will create a folder.
* Move the folder to a location with your other projects. (You probably don't want to leave it in Downloads.)

### 2. IMPORT INTO ECLIPSE
* In Eclipse, select **File** > **Import**
* Select **Existing Gradle Project**
* For Project root rirectory, select the unzipped folder that you downloaded. Click finish.
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
```

### 5. CREATE A CONTROLLER
* In `src/main/java`, inside your package, create a new Java file.
* Name it `<Something>Controller`.
* Annotate the class with `@Controller`
* Add a method that returns a `String`.
* Annotate the method with `@RequestMapping("/some-url-path")`, using the URL path you want for this page (`"/"` for the home page.
* Return a String that gives the name of your view JSP file without the ".jsp" extension.

### 6. CREATE A VIEW
* In `src/main` create three nested folders: `webapp/WEB-INF/views`. (HINT: A common mistake is to put this in src rather than src/main. Also if you copy-paste, use care that the folders you create do not contain leading or trailing spaces.)
* Within this views folder, select New > Other…. Select JSP File. * Select a filename that matches the name you returned from your controller, but has the ".jsp" extension.
* Within this JSP, use EL (e.g. `${model}`).
* Optionally, add the JSTL library by adding the following code at the top of the file.

```xml
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
```

### 7. START SERVER
* Select the `___Application.java` file.
* Right-click. Select Run As... Java Application.
* Visit http://localhost:8080 in your browser.
