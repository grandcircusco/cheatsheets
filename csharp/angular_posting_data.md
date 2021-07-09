# Posting Data from an Angular front end to an ASP.NET Core Backend Controller

There are two main ways you will pass data into a control using POST:

* Using an instance of a class for the function parameter

```cs
public bool AddUserFavorite(Favorite favobj) {
```

* Using mulitple parameters of basic types such as string or int or double

```cs
public bool AddUserFavorite(string username, int donut, string donutname) {
```

The first is handy if you have a class created such as Favorite. But if you haven't created a class,
you can instead pass parameters in individually as in the second. Here's how to do it.

# Posting Data as a single object

On the server side, we need to add the FromBody attribute to our controller function:

```cs
HttpPost("add")]
public bool AddUserFavorite([FromBody] Favorite fav)
{
	DAL.AddUserFavorite(fav.username, fav.donut, fav.donutname);
	return true;
}
```


On the client Angular side, we can pass the data as a single JSON object:

```ts
addFavorite(id, donutname) {
	this.http.post<any>(`/favorite/add`, { username: this.username, donut: id, donutname: donutname} , {
	}).subscribe(results => {
		console.log(results);
	});
}
```



# Posting Data as Individual Parameters

**TIP: This is good if you just want to pass a single parameter such as an email address or ID or something**

On the server side, we need to add the FromForm attirbute to our controller function:

```cs
[HttpPost("add")]
public bool AddUserFavorite([FromForm] string username, [FromForm] int donut, [FromForm] string donutname)
{
	DAL.AddUserFavorite(username, donut, donutname);
	return true;
}
```

To post data as individual parameters, we need to use a FormData object in our Angular code like so:

```ts
addFavorite(id, donutname) {
	let myformdata = new FormData();
	myformdata.append('username', this.username);
	myformdata.append('donut', id);
	myformdata.append('donutname', donutname);
	this.http.post<any>(`/favorite/add`, myformdata , {
	}).subscribe(results => {
		console.log(results);
	});
}
```




## Technical Details

In both cases the data gets passed in through the "body" part of the HTTP request. It's just text, just 
like a website passing an HTML page back to the browser. The difference is in how it's formatted and
how a particular header is set.

In the first example, the data is passed in using a form approach. The data is divided up like this:

```
------WebKitFormBoundaryioT2Jj0LmUbigQZZ
Content-Disposition: form-data; name="username"

jeffc
------WebKitFormBoundaryioT2Jj0LmUbigQZZ
Content-Disposition: form-data; name="donut"

1
------WebKitFormBoundaryioT2Jj0LmUbigQZZ
Content-Disposition: form-data; name="donutname"

Glazed
------WebKitFormBoundaryioT2Jj0LmUbigQZZ--
```

This all happens behind the scenes by the various Angular JavaScript libraries.

Further, there's a header that Angular and JavaScript set explaining to the server how the data is constructed:

```
content-type: multipart/form-data; boundary=----WebKitFormBoundaryioT2Jj0LmUbigQZZ
```

The first part says it's form data. The second part is a "boundary" that goes between each piece of form data.

The server then receives this data and is able to break it up, and then figure out which parameters go with
which data.

For the second part, Angular and JavaScript just passes a JSON object back to the server in string form like this:

```js
{"username":"jeffc","donut":1,"donutname":"Glazed"}
```

And it uses this content type:

```
content-type: application/json
```

On the server side, the ASP.NET Core reads the content-type to figure out what to do next.

If it sees a
content-type of multipart/form-data, it parses through the body and constructs the parameters. It
matches the members by name to the parameters in the contoller function as long as there is a "FromForm"
attribute on the parameters, and calls the function.

Or, if it sees application/json, it builds an actual object and passes that object into the function,
as long as there is a "FromBody" attribute on the parameters.
