# DOM Cheat Sheet
Basic straight JavaScript DOM stuff.

### Find Elements on the Page
Returns one element:

```js
let el = document.getElementById("some-id"); // Don't use '#'
let el = document.querySelector("some .css.selector");
let parent = el.parentElement;
```

Returns a [NodeList](https://developer.mozilla.org/en-US/docs/Web/API/NodeList) or [HTMLCollection](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection) (both like an array) of elements:

```js
let els = document.getElementsByClassName("some-class"); // Don't use '.'
let divs = document.getElementsByTagName("div");
let els = document.querySelectorAll("some .css.selector");
let children = el.childElements;
```

### Modify an Element
Set

```js
el.setAttribute("href", "http://example.com");
el.innerHTML = "Hello <em>World</em>!";
el.innerText = "Hello World"; // you'll also see el.textContent = "Hello World";
inputEl.value = "Some Value"; // Set value of a input element
inputEl.value = ""; // Clear an input element
el.classList.add("some-class"); // Adds a class
el.classList.remove("some-class"); // Removes a class
el.style.backgroundColor = "red"; // individual CSS property (use camel case)
```

Get

```js
let type = el.getAttribute("type");
let html = el.innerHTML;
let value = inputEl.value; // get what the user typed into an input
```

### Create an Element
```js
// Step 1: Create a basic element.
let el = document.createElement("a");
// Step 2: Set appropriate content and attributes.
el.innerHTML = "Click Me";
el.setAttribute("href", "http://example.com");
// Step 3: Add the element to the page at the appropriate location.
parentEl.appendChild(el);
```

Or use [insertAdjacentHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML)
```js
existingEl.insertAdjacentHTML("beforebegin", "<p>Some HTML</p>");
existingEl.insertAdjacentHTML("afterbegin", "<p>Some HTML</p>");
existingEl.insertAdjacentHTML("beforeend", "<p>Some HTML</p>");
existingEl.insertAdjacentHTML("afterend", "<p>Some HTML</p>");
```

### Listen for an Event
```js
el.addEventListener("click", (event) => {
    // Code here runs every time the element is clicked.
});
```

or in HTML

```html
<button type="button" onclick="myFunction()">Click Me</button>
<button type="button" onclick="anyJavaScript.here++">Click Me</button>
```