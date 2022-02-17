# To deploy a separate angular app with your ASP.NET app

## On the Angular side (Do this only once):

### Create an environment as shown here:

You will need two separate URLs, one for development and one for production. The production should just be relative URLs. The development will be of the form https://localhost:44377/. To accomplish this, open the two files in the environments folder:
	
environment.prod.ts: This one is for production and will just have relative paths

```
export const environment = {
  production: true,
  apiUrl: ''
};
```

enviornment.ts: This one is for development and will have the specific port number
	
```
export const environment = {
  production: false,
  apiUrl: 'https://localhost:44377' // Use whatever port your local app uses
};
```

### Update your API service call files as shown here:

Then your API services (such as myapi.service.ts) will need to be adjusted.

Add a line to import the environment file. (See below for details on how this works.)

```
import { environment } from '../environments/environment';
```

Then adjust all your API calls to build the path using the apiUrl member from the environment:

```
this.http.get<Product[]>(environment.apiUrl + '/product').subscribe(cb);
```

Now your angular app is ready.

## On the server side (Do this only once):

Open Startup.cs, and find the Configure function. Add the following two lines if they aren't already there:

```cs
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
	if (env.IsDevelopment())
	{
		app.UseDeveloperExceptionPage();
	}

	app.UseCors("LocalOriginsPolicy"); // (This came from the cheatsheet called CORS_CS_configuration.md)

	app.UseDefaultFiles(); // <--- ADD THIS ******

	app.UseStaticFiles(); // <--- ADD THIS ******
	
```

Then check if there is a wwwroot folder present. If not, right-click on the project name, and click Add -> New Folder. Call the folder wwwrooot.

## Time to Deploy (Do this every time you deploy a new version!)

1. Stop the angular server.

2. Build your angular code:

```
ng build
```

This will build a set of static files in the dist folder, which will in turn have a folder with the same name as your app, such as AngularApp. Switch into your angular app and open it in Windows File Explorer. You can do so from bash by typing

```
explorer ./dist/AngularApp
```

(replacing AngularApp with the name of the folder)

Then head over to Visual Studio. Right-click on the wwwroot folder and click Open Folder in File Explorer.

Delete any existing Angular files if you've done this before with this app. BE CAREFUL and ONLY delete the Angular files, not others! There will be seven files:

```
3rdpartylicenses.txt
favicon.ico
index.html
main.e412426e796becfb.js
polyfills.bc6727d9deca4a43.js
runtime.8f3c23399b996cd0.js
styles.ef46db3751d8e999.css
```

(The string of letters and numbers before .js and .css will be different. Each time you build, angular creates a new, unique string.)

Now drag all of these files from the dist/AngularApp folder into the wwwroot folder.

Done!

# Why do it this way when I could deploy the angular server?

Two reasons.

First: the angular server is not meant for deployment. It is not secure or scalable. It's meant for development only.

Second: Your angular app runs ENTIRELY in the browser. Angular apps do not do anything server-side. Your angular apps are a set of static JavaScript files that the browser reads in and runs.

So what does the server do? It's meant for debugging and quick recompiling only!

**To do otherwise demonstrates a fundamental misunderstanding of Angular's architecture.**

# How does the environment thing work?

Remember, all of your Angular code runs as static JavaScript code in the browser. The browser has no access to thngs like system environment variables, and therefore has no way to know "which" environment.ts file to load. So instead it takes place during compilation.

First, notice the two files export the same object called environment.

Next, when running the development server, Angular compiler intentionally packs environment.ts in with all the JavaScript files. Then, when you "import" this file, you'll get the environment.ts version.

However, when you build via ng build, the Angular compiler will intentionally pack environment.prod.ts with all the JavaScript files. That is, it packs in this other file instead. Then when you "import" the file using the exact same import line, you'll read the prod version instead. All with no change to the rest of your code.

