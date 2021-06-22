# Using Proxies in ASP.NET Core

## Step 1: Add the NuGet package called AspNetCore.Proxy

Note: Do NOT add the one called Microsoft.AspNetCore.Proxy. It should only be called AspNetCore.Proxy.

## Step 2: Add the initialize code

Open **Startup.cs**. Add the AddProxies line to the ConfigureServices function as shown here:

```cs
public void ConfigureServices(IServiceCollection services)
{
    services.AddProxies(); // ADD THIS LINE
    services.AddControllersWithViews();
}
```

## Step 3: Add the proxies

The following example shows two different proxies, one to the Reddit API and one to the DnD API.

For the Reddit API, we will convert incoming API calls of the form /reddit/SOMETHING to the subreddit API like so: https://www.reddit.com/r/SOMETHING/.json.
Thus, to load the AWW redit, you would simply call back to your server with /reddit/AWW.

For the DnD API, we're responding to multiple path levels. For example (you'll need to set the port number according to your app; in this example it's 44308):

https://localhost:44308/dnd/classes/barbarian will load https://www.dnd5eapi.co/api/classes/barbarian

https://localhost:44308/dnd/proficiencies/skill-animal-handling will load https://www.dnd5eapi.co/api/proficiencies/skill-animal-handling

Place the code inside the Configure function, just after the UseEndpoints stuff like so:

```cs
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
    // Bunch of other code already here
    app.UseEndpoints(endpoints =>
    {
        endpoints.MapControllerRoute(
            name: "default",
            pattern: "{controller=Home}/{action=Index}/{id?}");
    });
    // PUT THE FOLLOWING CODE UNDER THE UseEndpoints stuff as shown here
    app.UseProxies(proxies =>
    {
        // Example of single parameter (using Reddit)
        // e.g. localhost/reddit/aww will go to www.reddit.com/r/aww
        proxies.Map("/reddit/{subr}", proxy => proxy.UseHttp((_, args) => $"https://www.reddit.com/r/{args["subr"]}/.json" ));

        // Example of multiple parameters (using DnD API)
        proxies.Map("/dnd/{**rest}", proxy => proxy.UseHttp((_, args) =>
            $"https://www.dnd5eapi.co/api/{args["rest"]}"
        ));
    });

}

```


