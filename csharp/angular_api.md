Sample API calls: one to our own server, one to the Star Wars API, and one to a DND API.

Template (app.component.html)
```html
<h1>My Todo</h1>

<div *ngFor="let item of thetasks">
  task: {{ item.task }} complete: {{ item.complete}}
</div>

<button (click)="loadSWData()">Star Wars Data</button>
<br />
<button (click)="loadDNDData()">DND</button>

<ng-container *ngIf="starwars != null">
  <h1>Star Wars</h1>
  {{ starwars.title }} <br />
  {{ starwars.episode_id}} <br />
  {{ starwars.opening_crawl }} <br />
  {{ starwars.director }}<br />
  First character:
    {{ starwars.characters[0] }}
  <h2>Characters</h2>
  <div *ngFor="let ch of starwars.characters">
    <a href="{{ ch }}">Character</a>
  </div>
</ng-container>

<ng-container *ngIf="dnd != null">
  <h1>DnD</h1>
  <h2>{{ dnd.name}}</h2>
  Hit_die: {{ dnd.hit_die }}<br />
  <h3>Proficiencies</h3>
  <div *ngFor="let prof of dnd.proficiencies">
    <a href="{{prof.url}}">{{prof.name}}</a>
  </div>
</ng-container>

```

Code Behind (app.component.ts)
```ts
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Todo } from './todo';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
  title = 'app';
  thetasks: Todo[] = [];
  starwars = null;
  dnd = null;

  http: HttpClient = null;

  constructor(http: HttpClient) {
    this.http = http;
    http.get<any>('/todo/test2').subscribe(result => {
      console.log(result);
      this.thetasks = result;
    }, error => {
        console.log(error);
    });
  }

  loadSWData() {

    this.http.get<any>('https://swapi.dev/api/films/1/').subscribe(result => {
      console.log(result);
      this.starwars = result;
      //alert(result.title);
      // this.thetasks = result; Get rid of this line
    }, error => {
      console.log(error);
    });

  }

  loadDNDData() {
    this.http.get<any>('https://www.dnd5eapi.co/api/classes/fighter').subscribe(result => {
      //console.log(result);
      this.dnd = result;
      console.log(this.dnd.proficiencies[0].name);
      //alert(result.title);
      // this.thetasks = result; Get rid of this line
    }, error => {
      console.log(error);
    });

  }

}
```


C# Model (create a Model folder in the project)
```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularDemo1.Model
{
    public class Todo
    {
        public string task { get; set; }
        public bool complete { get; set; }
    }
}

```

C# Controller (TodoController.cs)
```cs
using AngularDemo1.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularDemo1.Controllers
{
    [Route("Todo")]
    [ApiController]
    public class TodoController : ControllerBase
    {
        [HttpGet("test")]
        public string test()
        {
            return "Hello from Todo Controller";
        }

        [HttpGet("test2")]
        public List<Todo> test2()
        {
            List<Todo> result = new List<Todo>();
            result.Add(new Todo() { task = "Buy groceries", complete = true }) ;
            result.Add(new Todo() { task = "Vacuum house", complete = false });
            return result;
        }
    }
}
```
