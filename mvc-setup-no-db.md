# SPRING BOOT MVC SETUP GUIDE (NO DATABASE)

### 1. CREATE & DOWNLOAD FROM START.SPRING.IO
* Browse to [https://start.spring.io](https://start.spring.io)
* For WAR...
  * Expand "Options".
  * Change Packaging from Jar to War.
* Enter a group name, e.g. co.grandcircus
* Enter an artifact name, e.g. spring-lab
* Add Dependencies: Spring *Web* Starter, Spring Boot *DevTools*
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

```
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

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