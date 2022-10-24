# Calling/Consuming a Remote API in C#

**Important: The approach here uses the newer packages for calling API and does not require parasing JSON. See notes at end for why we're using this approach.**

1. Install the ``Microsoft.AspNet.WebApi.Client`` package in NuGet. (You can search for ``webapi.client``).
2. Add a Singleton class as per the sample code below (just copy and paste into your DAL where it's noted)
3. When needing the instance of HttpClient, just grab the MyHttp property.
4. When a function makes an async call (such as MyHttp.GetAsync()), add the keyword async before your return type, and wrap the return type in Task<>. (If the return type is ``void``, just put ``Task`` not ``Task<void>``).
5. Any function that calls this function you just made must do the same -- add async and wrap return in Task<> and add the word ``await`` before the actual function call.

```cs
public class DogAPI
{

    // ====COPY AND PASTE STARTING HERE====
    private static HttpClient _realClient = null;
    public static HttpClient MyHttp
    {
        get
        {
            if (_realClient == null)
            {
                _realClient = new HttpClient();
                _realClient.BaseAddress = new Uri("https://api.thedogapi.com/v1/"); // ADD YOUR OWN BASE ADDRESS HERE
                // If you need to include an API key as a header:
                // (Find out the correct name; this one uses x-api-key.)
                _realClient.DefaultRequestHeaders.Add("x-api-key",   // REPLACE WITH YOUR OWN API KEY STUFF
                    "9a576995-4641-4b6b-9026-d14cf814ea57");
            }
            return _realClient;
        }
    }
    // ====END COPY AND PASTE====

    public static async Task<List<Breed>> GetBreeds(int count)
    {
        var connection = await MyHttp.GetAsync($"breeds?limit={count}");
        List<Breed> breeds = await connection.Content.ReadAsAsync<List<Breed>>();
        return breeds;
    }
}
```

Then inside the controller we need to make the calling function ``async`` and add the word ``await`` before we call ``DogAPI.GetBreeds``.

```cs
public async Task<IActionResult> Index()
{
    List<Breed> breeds = await DogAPI.GetBreeds(5);
    return View(breeds);
}

```


## Understanding the HttpClient

For each remote API domain you're connecting to, you should only need to create one instance of HttpClient. (This concept is called a "singleton", where you only create one instance of a particular class.) The HttpClient then manages all connections for you, a concept called pooling.

The following code demonstrates this:
* There's a private member called _realClient. This is where the actual instance is stored, but you won't use this anywhere in your code; instead you'll use the public property.
* The public property's getter checks if the private member exists; if not, it will create it. Then in either case it returns the private member.

***Tip**: Make sure the BaseAddress's Uri ends with a slash. Otherwise the URL will fall apart when the call is made.*

Notice in the function called GetBreeds we're using the MyHttp public property rather than accessing the _realClient private member directly.

Then we make the API call. ***Tip**: Do not start with a slash.*

* Put the word "async" before the API call.
* Put the word async before the return type
* Wrap the return type with Task< >. Note: Your return statement itself will still just return the basic type; don't wrap it in a Task< >. (See after the code for more detail.)
* Any function that calls this function must also be made async and return a Task.

## Even More Details if you're curious

Important: The API call (GetAsync) is what's known as *asynchronous*. You don't need to know much about it other than to remember to put the word ``await`` before the call like so:

```cs
List<Breed> breeds = await connection.Content.ReadAsAsync<List<Breed>>();
```

The only downside is that now this method needs to also be asynchronous. To do so, we put the word async before the return type, and we wrap the return type with Task:

```cs
public static async Task<List<Breed>> GetBreeds(int count)
```

However, when we do the actual return statement, we don't add a Task around it. Notice our return type is List<Breed> and that's all we return:

```cs
List<Breed> breeds = await connection.Content.ReadAsAsync<List<Breed>>();
return breeds;
```

This might seem like a mismatch but it is indeed correct.


## What if the return type is void?

Then you just put Task for the return type. See the following section for an example.

## Quick Console App

Just like with any other app, you need to add the ``Microsoft.AspNet.WebApi.Client`` NuGet package. And notice also that we added the ``async`` keyword before the return type in ``Main``. And notice that the return type is normally ``void`` with the ``Main``, so instead we just return ``Task``.


```cs
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace APIConsole
{
    class Program
    {
        static async Task Main(string[] args)
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://zoo-animal-api.herokuapp.com/");
            string response = await client.GetStringAsync("animals/rand/3");
            Console.WriteLine(response);
        }
    }
}
```

# Notes regarding framework best practices.

As per the note in this link, https://learn.microsoft.com/en-us/dotnet/api/system.net.httpwebrequest?view=net-7.0

Microsoft no longer recommends using ``HttpWebRequest`` and instead recommends the above approach using HttpClient. Here's the quote:

> We don't recommend that you use ``HttpWebRequest`` for new development. Instead, use the ``System.Net.Http.HttpClient`` class.

