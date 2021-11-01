# Cleaning out the VS Angular Project to get started

### Delete WeatherForecast.cs
### Delete WeatherForecastController.cs

### Inside ClientApp, expand src/app: Delete two folders - counter, fetch-data
### Open app.module.ts
Delete the imports for the three components:
```ts
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
```
Delete the components from the declarations aray
```ts
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent, // DELETE
    FetchDataComponent // DELETE
  ],
```
Delete all three items from the routermodule
```ts
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent },
```   

**Save the file**

### Expand the nav-menu folder and open its html file. Delete the last two of the LI elements:
```ts
<li class="nav-item" [routerLinkActive]="['link-active']">
  <a class="nav-link text-dark" [routerLink]="['/counter']">Counter</a>
</li>

<li class="nav-item" [routerLinkActive]="['link-active']">
  <a class="nav-link text-dark" [routerLink]="['/fetch-data']"
    >Fetch data</a
  >
</li>
```
(Keep the first one so you don't need to have to remember how to format this HTML)

**Save the file**

