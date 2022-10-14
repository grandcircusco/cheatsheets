# JSON to C# Examples

JSON is always inside square brackets or curly brackets.

* Square brackets means you're getting back an array/list of something.
* Curly brackets means you're getting back a single object.

## List Examples
Here are some examples of a list:

A list of strings:
```js
[
    "hello",
    "world",
    "everybody"
]
```
in which case your API call would return a list of strings like so:
```cs
List<string> resp = await connection.Content.ReadAsAsync<List<string>>();
```

A list of integers:
```js
[
    10,
    20,
    30,
    40
]
```
in which case your API call would return a list of ints like so:
```cs
List<int> resp = await connection.Content.ReadAsAsync<List<int>>();
```

## Simple Object Example
Objects are inside curlies, and you might get back JSON like this:

```js
{
    "name": "First Rectangle",
    "length": 1.5,
    "width": 20.6
}
```

In C#, each object needs a class, so we need to create one. The JSON doesn't give us a name! We have to make one up. We could called it Michigan or Banana or whatever we like, but choose something that makes sense. And since this is an API call, you might add on the word "Response" to the name. How about RectangleResponse for this one.

We'll build each member line for line based on what we see:

```cs
class RectangleResponse {
    public string name {get;set;}
    public double length { get; set; }
    public double width { get; set; }
}
```

in which case your API call would return a single instance of RectangleResponse like so:
```cs
RectangleResponse resp = await connection.Content.ReadAsAsync<RectangleResponse>();
```

## Do you need all fields in an object?

No! If you don't need all the fields in a JSON object, only include the ones you need. For RectangleResponse, if you don't need name, then don't include it:

```cs
class RectangleResponse {
    public double length { get; set; }
    public double width { get; set; }
}
```

## A List of Objects

If you have a list and each is an object, you'll still create a class for the object. Suppose this is your JSON:

```js
[
    {
        "name": "First Rectangle",
        "length": 10,
        "width": 20
    },
    {
        "name": "Second Rectangle",
        "length": 30,
        "width": 25
    },
    {
        "name": "Another Rectangle",
        "length": 5,
        "width": 35
    }
]
```

You'll still create a class, but the return type will be a list. First, here's a class, same as above:

```cs
class RectangleResponse {
    public string name {get;set;}
    public double length { get; set; }
    public double width { get; set; }
}
```

But you'll get back from the API call a list of that class:

```cs
List<RectangleResponse> resp = await connection.Content.ReadAsAsync<List<RectangleResponse>>();
```

## A more complex class

Here's a single object in the JSON but some of its members are themselves objects. In that case you need to make a class for those inner objects as well.

```js
{
    "name": "Mars Rover",
    "code": 35,
    "info": {
        "units": "metric",
        "weight": 2547,
        "height": 2.3,
        "length": 5.2,
        "width": 4.8
    }
}
```

We need a class for the main object, as well as a class for the member called "info":

```cs
class RoverResponse {
    public string name {get;set;}
    public int code {get;set;}
    public InfoResponse info { get; set; }
}

class InfoResponse {
    public string unit {get;set;}
    public double weight {get;set;}
    public double height {get;set;}
    public double length {get;set;}
    public double width {get;set;}
}
```

And then your API call would look like this:

```cs
RoverResponse resp = await connection.Content.ReadAsAsync<RoverResponse>();
```

## Another Complex Object
Look closely at the "dimensions" member. It's a single object, which we'll need a class for.
Look closely at the "missions" member. It's an array of an objects, which we'll need a single class for.

```js
{
    "name": "Mars Rover 1",
    "dimensions": {
        "units": "metric",
        "weight": 2433.7,
        "height": 4.5
    },
    "missions": [
        {
            "name": "QWE100",
            "year": 2015
        },
        {
            "name":"ASDF200",
            "year": 2018
        }
    ],
    "rocks": [
        "Basanite",
        "Granite",
        "Obsidian"
    ]
}
```

And so we'll need three classes:

```cs
class RoverResponse {
    public string name {get;set;}
    public DimensionsResponse dimensions {get;set;}
    public List<MissionsResponse> missions {get;set;}
    public List<string> rocks {get;set;}
}

class DimensionsResponse {
    public string units {get;set;}
    public double weight {get;set;}
    public double height {get;set;}
}

class MissionsResponse {
    public string name {get;set;}
    public int year {get;set;}
}
```

And in this case we would get back from the API call a single instance of the outer class like so:
```cs
RoverResponse resp = await connection.Content.ReadAsAsync<RoverResponse>();
```

## Array of Complex Objects

And here's an example of an array with complex objects in it:

```js
[
    {
        "name": "Mars Rover",
        "planet": "Mars",
        "dimensions": {
            "units": "metric",
            "weight": 2547,
            "year_made": 2015
        }
    },
    {
        "name": "Cool Rover 2",
        "planet": "Venus",
        "dimensions": {
            "units": "metric",
            "weight": 2637,
            "year_made": 2022
        }
    }
]
```
We have to look at a single object and build a class from it. Each object in this case has a "dimensions" member that is itself a class as well. So we need two classes:

```cs
class AnotherRoverResponse {
    public string name { get; set; }
    public string planet { get; set; }
    public DimensionsResponse dimensions { get; set; }
}

public DimensionsResponse {
    public string units { get; set; }
    public int weight { get; set; }
    public int year_made { get; set; }
}
```
And in this case we would get back from the API call a List of the outer class like so:
```cs
List<AnotherRoverResponse> resp = await connection.Content.ReadAsAsync<List<AnotherRoverResponse>>();
```


