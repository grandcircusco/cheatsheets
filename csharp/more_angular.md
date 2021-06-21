Interface: todo.ts

```ts
export interface Todo {
    task: string;
    complete: boolean;
}
```

# Show Todo Component

Template: show-todo-component.html

```html
<div>

{{ theTodo.task }} 

<input type="checkbox" [(ngModel)]="theTodo.complete" />

<button (click)="deleteMe()">&#10060;</button>

</div>
```

Code Behind: show-todo-component.ts

```ts
import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { Todo } from '../interfaces/todo';

@Component({
  selector: 'app-show-todo',
  templateUrl: './show-todo.component.html',
  styleUrls: ['./show-todo.component.css']
})
export class ShowTodoComponent implements OnInit {

  @Input() theTodo: Todo = { task: '', complete: false};
  @Output() remove: EventEmitter<Todo> = new EventEmitter<Todo>(); // Output binding
  constructor() { }

  ngOnInit(): void {
  }

  deleteMe() {
    // This function triggers the remove event's emitter
    this.remove.emit(this.theTodo);
  }

}
```

# App Component

Template: app.component.html

```html
<h1>Todo List</h1>

<input [(ngModel)]="searchbox" type="text" /> <button (click)="clickSearch()">Search</button>

<ng-container *ngIf="searchResults.length > 0">
  <h2>Search Results</h2>
  <button (click)="clearSearch()">Clear Search</button>
  <ng-container *ngFor="let item of searchResults">
    <app-show-todo [theTodo]="item" (remove)="deleteOneTodo($event)"></app-show-todo>
  </ng-container>
</ng-container>

<ng-container *ngIf="searchResults.length == 0">
  <ng-container *ngFor="let item of thetasks">
    <app-show-todo [theTodo]="item" (remove)="deleteOneTodo($event)"></app-show-todo>
  </ng-container>
</ng-container>
```

Code-behind: app.component.ts

```ts
import { Component, Input } from '@angular/core';
import { Todo } from './interfaces/todo';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'taskdemo';
  @Input() searchbox: string = '';

  thetasks: Todo[] = [
    { task: 'Mow grass', complete: false },
    { task: 'Vacuum', complete: true },
    { task: 'Tune piano', complete: false },
    { task: 'Feed Donald Duck Grass', complete: false }
  ];

  searchResults: Todo[] = [];

  clickSearch() {
    let re = RegExp(this.searchbox, 'i'); // "i" is "case insensitive"
    //let results: Todo[] = [];
    this.searchResults.splice(0, this.searchResults.length);
    for (let i = 0; i<this.thetasks.length; i++) {
      if (this.thetasks[i].task.match(re)) {
        this.searchResults.push(this.thetasks[i]);
      }
    }
    //this.searchResults = results;
  }

  clearSearch() {
    this.searchResults.splice(0, this.searchResults.length);
    this.searchbox = '';
  }

  deleteOneTodo(whichTodo: Todo) {
    // Here's where we really delete the todo item
    for (let i = 0; i<this.thetasks.length; i++) {
      if (this.thetasks[i] == whichTodo) {
        this.thetasks.splice(i, 1);
        break;
      }
    }
    if (this.searchResults.length > 0) {
      this.clickSearch();
    }
  }

}
```
