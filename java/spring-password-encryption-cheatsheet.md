# Java Encryption Outline

## IMPORTANT:

Unless you work full time as a security professional/expert, you are NOT a security expert. I’m not a security expert. Therefore, do NOT attempt to build your own or “roll your own” security system. Use established libraries that have been tested and approved by the actual security professionals. This is one of the few times we do NOT attempt it on our own. Also, make sure you always follow the established best practices.

## Registration:

1. Encrypt the password using BCrypt

2. Save encrypted data to database

##  Login

1. Encrypt the entered password using BCrypt

2. Ask BCrypt to do the comparison for you

## Why?

1. This is a one-way encryption. You can’t “decrypt”

2. Each time you encrypt the password, you will not get the same results as the previous time, but BCrypt has the tools to see if they “match”

## How?

Complete demo here: https://github.com/jeffcogswell/JavaOct20Week8/tree/main/passworddemo

MainController.java code file here: https://github.com/jeffcogswell/JavaOct20Week8/blob/main/passworddemo/src/main/java/co/grandcircus/passworddemo/MainController.java

**1. Add the following to the pom file's dependencies:**

```
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
	<dependency>
		<groupId>org.springframework.security</groupId>
		<artifactId>spring-security-test</artifactId>
		<scope>test</scope>
	</dependency>
```

**2. Modify the annotation in your main app class. Change it from:**

```
@SpringBootApplication
public class MyApplication {
```

to:

```
@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class MyApplication {
```


**3. Create an instance of BCryptPasswordEncoder. (I made mine a static member of the controller; however, if you have multiple controller files, better would be to put it in a service and auto-wire it.)**

```
@Controller
public class MainController {
	public static BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
```


**4. To encode the password for registration call the encoder’s “encode” function, e.g.**

```
pw = pwEncoder.encode(pw);
```

This returns a string. Then:

Save that string in the database table (in the example, see the postregister function in MainController)

**5. To compare a password for login, load the existing encrypted password from the database table, and use the encoder’s “matches” function. (See the postlogin function in the MainController of the example). E.g.**


```
	// Locate the user by email address
	PWUser user = pwrep.findOneByEmail(email);
	if (user != null) {
		// Found the user. Check the password.
		if (pwEncoder.matches(password, user.getPassword())) {
			// They match. We're good.
			session.setAttribute("user", user.getEmail());
			return "redirect:/profile";
		}
	}
```
