# Calling/Consuming a Remote API in C#

First: Using the NuGet Package Manager, add the following package:

```
Microsoft.AspNet.WebApi.Client
```

(You can probably use the search term ```webapi.client```)

## Before Starting: Understanding the HttpClient

Before starting, make sure you understand how the HttpClient class works. For each remote API domain
you're connecting to, you should only need to create one instance of HttpClient. (This concept
is called a "singleton", where you only create one instance of a particular class.)

One way to accomplish this is by creating a private static member of HttpClient inside a DAL class,
and then provide either a public or private function for obtaining that instance. The first thing
the function will do is check if the instance exists. If not, create it. Then in either case, return
the instance. The code below will use this concept.

## UNDER CONSTRUCTION, REST COMING SOON...

