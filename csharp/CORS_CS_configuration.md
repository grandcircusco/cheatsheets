## For .NET 3.1

To allow CORS from your server-side app, open Startup.cs.

First, add the commented lines to your ConfigureServices function:

```cs
public void ConfigureServices(IServiceCollection services)
{
	services.AddControllers();

	// Add the following!
	services.AddCors(
		options =>
		{
			options.AddPolicy(
				name: "LocalOriginsPolicy",
				builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
			);
		}
	);
	// Add the above!
  
}
```

Then add a UseCors call to the Configure function after the isDevelopment stuff, like so:

```cs
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
	if (env.IsDevelopment())
	{
		app.UseDeveloperExceptionPage();
	}

	// Add the folloing line! (The string must match what was added above!)
	app.UseCors("LocalOriginsPolicy");
```

## For .NET 6

Put this into the program.cs:
```cs
builder.Services.AddCors(options =>
	{
		options.AddPolicy(name: "LocalOriginsPolicy",
			builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
		);
		}
	);
```
then add this further down like normal
```cs
app.UseCors("LocalOriginsPolicy");
```
