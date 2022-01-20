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

Setting up webclient:

```cs
public class DogAPI
{

	private static HttpClient _realClient = null;
	public static HttpClient MyHttp
	{
		get
		{
			if (_realClient == null)
			{
				_realClient = new HttpClient();
				_realClient.BaseAddress = new Uri("https://api.thedogapi.com/v1/"); // ADD YOUR OWN BASE ADDRESS HERE
				_realClient.DefaultRequestHeaders.Add("x-api-key",   // REPLACE WITH YOUR OWN API KEY STUFF
					"9a576995-4641-4b6b-9026-d14cf814ea57");
			}
			return _realClient;
		}
	}

	public static async Task<List<Breed>> GetBreeds(int count)
	{
		var connection = await MyHttp.GetAsync($"breeds?limit={count}");
		List<Breed> breeds = await connection.Content.ReadAsAsync<List<Breed>>();
		return breeds;
	}
}
```

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

