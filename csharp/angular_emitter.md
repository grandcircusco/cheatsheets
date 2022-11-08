# Very short and simple Emitter demo.

We have two components: The main app component, and a component called child that will be inside the app component.

The child component will send a message up to the app (its parent) component. The message will just be a string, the word "Hello!"

The parent/app component will receive the message and show it in an alert box.

# Child Component

Here's the template (html) file:

```html
<div style="background-color:bisque; margin: .5em; padding: .5em;">
	I'm the child component! Click this button to send a message to the parent component.<br />
	<button (click)="sendMessage()">Send Message</button>
</div>
```

And here's the code (ts) file. Notice we create an EventEmitter that serves as the messenger in a variable called sender. The function called sendMessage sends the message up to the parent by simply calling its emit method. (We have a button in the template that calls the sendMessage function when clicked)

```ts
import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
    selector: 'app-child',
    templateUrl: './child.component.html',
    styleUrls: ['./child.component.css']
})
export class ChildComponent {

    @Output() sender: EventEmitter<string> = new EventEmitter<string>();

    sendMessage() {
        // We'll use the event emitter to send a message to the parent
        // We're just sending a string.
        this.sender.emit("Hello!");
    }
}
```

# App/Parent Component 

The parent component's HTML includes the child component, as well as an attribute whose name matches the name of the event emitter, "sender". It has parenthese around it, and in the double quotes we put code we want to run when the event is received. (See the end of this cheatsheet for more info.)

```html
<h1>Sender App!</h1>
I'm the parent component!

<app-child (sender)="processMessage($event)"></app-child>
```

And here's the code (ts) file containing the code that gets run when the event is received:

```ts
import { Component } from '@angular/core';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent {
    title = 'emitterdemo';
    processMessage(message: string) {
        alert(`I just received this message from the child: ${message}`)
    }
}
```

# Event Handling Comparison

Look at the similarities between this event handler in the parent component and a button click handler.

Example button handler:

```html
<button (click)="sendMessage()">Send Message</button>
```

Example emitter handler:

```html
<app-child (sender)="processMessage($event)"></app-child>
```

In BOTH cases, when the event is received ("click" or "sender") we call a function in our class.

When the component receives a click event from the button, in this code we call sendMessage.

When the component receives a custom emitter event (called sender in this case), we call processMessage.

