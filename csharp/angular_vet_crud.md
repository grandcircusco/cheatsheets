(This is a work in progress; I'll update it as I clean up the code a bit.)

We have two components:
* app.component
  * This is our main component
  * It has a template (html) file and a code behind (ts) file.
  * We didn't add any CSS, so I'm not including the .css file (it's just blank)
* show-pet component
  * This component displays a single pet
  * It has a template (html) file, a code behind (ts) file, and a style (css) file
  * Look closely at the "mode" member variable and how I'm attaching it to a checkbox, and using it in a couple of ngIf blocks to toggle between view and edit mode.

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

# Main App Component

**Template: app.component.html**
```html
<h1>Welcome to the Vet</h1>

<div *ngIf="allpets.length == 0">
    No pets to show
</div>

<div *ngIf="allpets.length > 0">
    <div *ngFor="let nextpet of allpets">
        <app-show-pet [thispet]="nextpet" (remove)="removeThePet($event)"></app-show-pet>
    </div>
</div>

<div>
    <h2>Add New Pet</h2>
    Name: <input [(ngModel)]="addPetName" type="text" /><br />
    Species: <input [(ngModel)]="addPetSpecies" type="text" /><br />
    Age: <input [(ngModel)]="addPetAge" type="number" /><br />
    <button (click)="addPet()">Add Pet</button><br />
</div>

<button class="btn btn-primary" (click)="removePet()">Remove Pet</button>
<h2>Debug Stuff</h2>
<button (click)="printAllPets()">Print All Pets</button>
```

**Code Behind: app.component.ts**
```ts
import { Component, Input } from '@angular/core';
import { Pet } from './pet';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'vet';
  // Members for accessing text boxes in form
  @Input() addPetName: string = "";
  @Input() addPetSpecies: string = "";
  @Input() addPetAge: number = 0;

  allpets: Pet[] = [
    {
      name: 'Donald Duck',
      species: 'cat',
      age: 12
    },
    {
      name: 'Mickey Mouse',
      species: 'cat',
      age: 12
    },
    {
      name: 'Nellie',
      species: 'dog',
      age: 9
    }
  ];

  addPet() {
    //this.addPetName = "Hello World";
    /*console.log(this.addPetName);
    console.log(this.addPetSpecies);
    console.log(this.addPetAge);*/
    this.allpets.push(
      {
        name: this.addPetName,
        species: this.addPetSpecies,
        age: Number(this.addPetAge)
      }
    );
  }

  removePet() {
    this.allpets.pop();
  }

  removeThePet(thepet: Pet) {
    // This function will remove a specific pet
    for (let i=0; i<this.allpets.length; i++) {
      if (this.allpets[i] == thepet) {
        // Found it. Delete it!
        // To remove, we use "splice". We say which index and how many elements to remove
        this.allpets.splice(i, 1);
        return;
      }
    }
  }

  printAllPets() {
    console.log(this.allpets);
  }

}

```

# Show Pet Component

**Template: show-pet.component.html**

```html
<div class="OnePet">

    <input [(ngModel)]="mode" type="checkbox" /> Edit Mode

    <div *ngIf="mode == false">
        <div>Name: {{ thispet.name }}</div>
        <div>Species: {{ thispet.species }}</div>
        <div>Age: {{ thispet.age }}</div>
        <div><button (click)="deleteMe()">Delete</button></div>
    </div>


    <div *ngIf="mode == true">
        Edit Pet<br />
        <input [(ngModel)]="thispet.name" type="text" /><br />
        <input [(ngModel)]="thispet.species" type="text" /><br />
        <input [(ngModel)]="thispet.age" type="text" /><br />
    </div>

    <div *ngIf="thispet.species == 'cat'">
        <h2>Cats are awesome!</h2>
    </div>

</div>
```

**Code behind: show-pet.component.ts**

```ts
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Pet } from '../pet';

@Component({
  selector: 'app-show-pet',
  templateUrl: './show-pet.component.html',
  styleUrls: ['./show-pet.component.css']
})
export class ShowPetComponent implements OnInit {

  @Input() thispet: Pet = { name: '', species: '', age: 0 };

  @Output() remove: EventEmitter<Pet> = new EventEmitter<Pet>();

  @Input() mode: boolean = false;
  
  constructor() { }

  ngOnInit(): void {
  }

  deleteMe() {
    // Somehow, call the removeThePet function in the parent component
    this.remove.emit(this.thispet);
  }

}
```

**Styling: show-pet.component.css**

```css
.OnePet {
    margin: .5rem .5rem .5rem .5rem;
    padding: .5rem .5rem .5rem .5rem;
    background-color:bisque;
}
```

