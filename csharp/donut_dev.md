Please note: I will be removing this from the cheatsheets at the end of the session.

In this code we're connecting to a *particular* child component by giving it a name in app.component.html, #MainDetail, and then a matching member called detailDonutComp in the app.component.ts. Notice how we're connecting the variable to the component using the @ViewChild(). Then in our code anytime we want to access the component's members, we just use the variable detailDonutComp (as in the loadDonutDetail function).

First here are the app.component.files.

Template - app.component.html

```html
<h1>Donuts and Devs</h1>

<div *ngFor="let donut of this.donuts">
  <div (click)="clickDetail(donut.id)">{{ donut.name }}</div> 
</div>

<app-donutdetail #MainDetail></app-donutdetail>
```

Code behind - app.component.ts

```ts
import { Component, ViewChild } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DonutdetailComponent } from './donutdetail/donutdetail.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'donutdev';
  http: HttpClient = null;
  donuts = null;
  @ViewChild('MainDetail') detailDonutComp: DonutdetailComponent = null;

  constructor(theHttp: HttpClient) {
    this.http = theHttp;
    this.loadDonuts();
  }

  loadDonuts() {
    this.http.get<any>('https://grandcircusco.github.io/demo-apis/donuts.json').subscribe(result => {
      this.donuts = result.results;
      console.log(this.donuts);
    }, error => {
      console.log(error);
    });    
  }

  clickDetail(id) {
    for (let i=0; i<this.donuts.length; i++) {
      if (this.donuts[i].id == id) {
        //alert(`found it! ${this.donuts[i].name} `);
        //alert(this.donuts[i].ref);
        this.loadDonutDetail(this.donuts[i]);
        return;
      }
    }
  }

  loadDonutDetail(obj) {
    this.http.get<any>(obj.ref).subscribe(result => {
      console.log(result);
      this.detailDonutComp.test();
      this.detailDonutComp.whichdonut = result;
    }, error => {
      console.log(error);
    });      
  }

}
```

Now the child component.

Template - donutdetail.component.html

```html
<div *ngIf="whichdonut != null">
    <h1>Donut Detail</h1>
    Name: {{ whichdonut.name }}<br />
    Calories: {{ whichdonut.calories }}<br />
    <img src="{{ whichdonut.photo }}" /><br />

    <button (click)="test()">Test</button>

</div>
```

Code behind - donutdetail.component.ts

```ts
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-donutdetail',
  templateUrl: './donutdetail.component.html',
  styleUrls: ['./donutdetail.component.css']
})
export class DonutdetailComponent implements OnInit {

  @Input() testnum = 0;
  whichdonut = null;

  constructor() {
  }

  ngOnInit(): void {
  }

  test() {
    console.log(this.whichdonut);
  }
}
```
