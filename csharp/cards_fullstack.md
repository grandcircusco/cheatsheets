Here's a full stack version of the Card API system.

You'll need to create a new Angular program in Visual Studio. Use the steps shown in a separate cheetsheat for clearing out the extra "weather" stuff from the app. 
Then add a new controller of API Empty type called CardContoller.cs. Then add two components, deck and hand. Here's the code:

**CardController.cs**

```cs
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace NewCardDemo.Controllers
{
    [Route("card")]
    [ApiController]
    public class CardController : ControllerBase
    {
        [HttpGet("newdeck")]
        public async Task<Object> GetNewDeck()
        {
            // We could just return the json variable and skip
            // all the anonymous object stuff.
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://deckofcardsapi.com");
            var response = await client.GetAsync("/api/deck/new/shuffle/?deck_count=1");
            string json = await response.Content.ReadAsStringAsync();
            var definition = new { deck_id = "" }; // This is the cookie cutter for what we want out of the JSON object
            var card_info = JsonConvert.DeserializeAnonymousType(json, definition);
            return card_info;
        }

        [HttpGet("gethand/{id}")]
        public async Task<string> GetHand(string id)
        {
            // test: 7mb1gfxj03te
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://deckofcardsapi.com");
            var response = await client.GetAsync($"/api/deck/{id}/draw/?count=5");
            string json = await response.Content.ReadAsStringAsync();
            return json;
        }
    }
}
```

**Deck Component's Template deck.component.html**

```html
<h2>Ready for a new deck?</h2>

<button (click)="getNewDeck()">Yes!</button>

<div style="font-weight: bold; color: green">{{ message }}</div>
```

**Deck Component's Code Behind deck.component.ts**

```ts
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-deck',
  templateUrl: './deck.component.html',
  styleUrls: ['./deck.component.css']
})
/** deck component*/
export class DeckComponent {
/** deck ctor */
  message = "";
  http: HttpClient = null;

  constructor(theHttp: HttpClient) {
    this.http = theHttp;
  }

  getNewDeck() {
    this.http.get<any>('/card/newdeck').subscribe(result => {
      console.log(result);
      window["deck_id"] = result.deck_id;
      this.message = `You have a new deck! The ID is ${result.deck_id}`;
    }, error => {
      console.log(error);
    });

  }


}
```

**Hand Component's Template hand.component.html**

```html
<h2>Ready to draw?</h2>
<button (click)="getNewHand()">Yes!</button>
<br />
<ng-container *ngFor="let card of myhand">
  <img [src]="card.image" />
</ng-container>
```

**Hand Component's Code Behind hand.component.ts**

```ts
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-hand',
  templateUrl: './hand.component.html',
  styleUrls: ['./hand.component.css']
})
/** hand component*/
export class HandComponent {
  http: HttpClient = null;
  myhand = null;
  /** hand ctor */
  constructor(theHttp: HttpClient) {
    this.http = theHttp;
  }

  getNewHand() {
    if (!window["deck_id"]) {
      alert('Please create a deck first!');
      return;
    }

    console.log(window["deck_id"]);
    this.http.get<any>(`/card/gethand/${window["deck_id"]}`).subscribe(result => {
      console.log(result);
      this.myhand = result.cards;
    }, error => {
      console.log(error);
    });
  }
}

```

**app.module.ts**
```ts
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { DeckComponent } from './deck/deck.component';
import { HandComponent } from './hand/hand.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    DeckComponent,
    HandComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent },
      { path: 'deck', component: DeckComponent },
      { path: 'hand', component: HandComponent}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

**home.component.html**

For this one, we just cleared out what was originally in it and replaced it with a nice message

```html
<h2>Welcome to the Card Game</h2>
```

**nav-menu.component.html**

Here we add the links to our different "pages", home, deck, and hand.

```html
<header>
  <nav
    class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3"
  >
    <div class="container">
      <a class="navbar-brand" [routerLink]="['/']">NewCardDemo</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target=".navbar-collapse"
        aria-label="Toggle navigation"
        [attr.aria-expanded]="isExpanded"
        (click)="toggle()"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse"
        [ngClass]="{ show: isExpanded }"
      >
        <ul class="navbar-nav flex-grow">
          <li class="nav-item"
              [routerLinkActive]="['link-active']"
              [routerLinkActiveOptions]="{ exact: true }">
            <a class="nav-link text-dark" [routerLink]="['/']">Home</a>
          </li>

          <li class="nav-item" [routerLinkActive]="['link-active']">
            <a class="nav-link text-dark" [routerLink]="['deck']">New Deck</a>
          </li>
          <li class="nav-item" [routerLinkActive]="['link-active']">
            <a class="nav-link text-dark" [routerLink]="['hand']">Draw Hand</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
```
