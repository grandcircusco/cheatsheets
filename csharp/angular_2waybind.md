Here's a quick demo for two-way binding. Try typing into the textbox and see what happens. Also the buttons connect to two simple functions; the first stores something in the variable, and the other just prints out what's in the variable. Notice the textbox and h1 update automatically when the first button is clicked. In our code we only need to interact with the variables. We never have to manually change the GUI.

**Template: app.component.html**
```html
<h1>{{ petname }}</h1>

<input [(ngModel)]="petname" type="text" />

<br /><br />

<button (click)="fillPetName()">Fill Pet Name</button>

<br /><br />

<button (click)="logPetName()">Log Pet Name</button>
<br /><br />
```

**Code behind: app.component.ts**
```ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'editapp';

  petname: string = 'Sally the Frog';

  fillPetName() {
    this.petname = 'Hello World';
  }

  logPetName() {
    console.log(this.petname);
  }
}
```
