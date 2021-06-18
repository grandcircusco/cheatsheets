Here's a quick demo for two-way binding. Try typing into the textbox and see what happens. Also the buttons connect to two simple functions; the first stores something in the variable, and the other just prints out what's in the variable. Notice the textbox and h1 update automatically when the first button is clicked. In our code we only need to interact with the variables. We never have to manually change the GUI.

# First: Update app.module.ts

Add the ```FormsModule``` to the imports array, and add the associated import statement at the top so it looks like this:

```ts
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser'; // =====ADD THIS LINE=====

import { AppComponent } from './app.component';
import { ShowPetComponent } from './show-pet/show-pet.component';

@NgModule({
  declarations: [
    AppComponent,
    ShowPetComponent
  ],
  imports: [
    BrowserModule,
    FormsModule // =====ADD THIS LINE, AND THE COMMA ON THE LINE BEFORE=====
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```


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
