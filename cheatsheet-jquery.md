# jQuery Cheat Sheet
How to use jQuery to manipulate the DOM.

### Find Elements on the Page
```js
let elements = $("some .css.selector");
```

### Modify an Element
Set

```js
el.attr("href", "http://example.com");
el.html("Hello <em>World</em>!");
el.text("Hello World!");
el.addClass("some-class"); // or removeClass or toggleClass
inputEl.val("Some Value"); // Set value of a input element
inputEl.val(""); // Clear an input element
```

Get

```js
let type = el.attr("type");
let html = el.html();
let text = el.text();
let value = inputEl.val(); // get what the user typed into an input
```

### Create an Element
```js
// Step 1: Create a basic element.
let el = $("<a>");
// Step 2: Set appropriate content and attributes.
el.text("Click Me");
el.attr("href", "http://example.com");
// Step 3: Add the element to the page at the appropriate location.
parentEl.append(el);
```

or

```js
// Step 1: Create a fully formed element.
let el = $('<a href="http://example.com">Click Me</a>');
// Step 2: Add the element to the page at the appropriate location.
parentEl.append(el);
```

or

```js
parentEl.append('<a href="http://example.com">Click Me</a>');
```

### Listen for an Event
```js
el.on("click", (event) => {
    // Code here runs every time the element is clicked.
});
```