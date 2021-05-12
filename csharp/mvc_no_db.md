# MVC Sample

This app will maintain a product list. The users will be able to add a product and list all products.

Start with the model:

### Product.cs

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsApp.Models
{
    public class Product
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string SKU { get; set; }
        public decimal Price { get; set; }

        public static List<Product> AllProducts = new List<Product>();
    }
}
```

Then the controller. (I deleted parts that weren't needed from the default project template.) Notice we have THREE actions. These are thre three entry points into our program; each gets a URL through which we can call it.

### HomeController.cs

```cs
using Microsoft.AspNetCore.Mvc;
using ProductsApp.Models;
using System.Diagnostics;

namespace ProductsApp.Controllers
{
    public class HomeController : Controller
    {

        public IActionResult Index()
        {
            return View(Product.AllProducts);
        }

        public IActionResult ProductForm()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddProduct(Product newprod)
        {
            if (newprod.Price == 0)
            {
                return Content("That is not a valid price");
            }
            Product.AllProducts.Add(newprod);
            // Don't do this:
            //return View("Index", Product.AllProducts);
            return RedirectToAction("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
```

Then two pages: One for the index, where we list the products, and that's a form for entering a new product. The form goes with TWO actions: One displays the form, and one is a URL that runs in response to clicking the form; that action saves the data in the list.

### Index.cshtml

```html
@model List<Product>
@{
    ViewData["Title"] = "Home Page";
}
<h1>Product App</h1>

@foreach (Product prod in Model)
 {
    <div>@prod.Name : @prod.Price</div>
 }

<a href="/home/ProductForm">Add Product</a>
```

### ProductForm.cshtml
```html
@{
    ViewData["Title"] = "ProductForm";
}

<h1>Product Form</h1>

<form method="post" action="/home/AddProduct">
    Name: <input type="text" name="Name" /><br />
    Description: <input type="text" name="Description" /><br />
    SKU: <input type="text" name="SKU" /><br />
    Price: <input type="text" name="Price" /><br />
    <input type="submit" />
</form>

```


