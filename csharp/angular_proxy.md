1. In the ClientApp directory (which is the root of the angular app directory) make a file called proxy.conf.json and copy the following into it:

```
{
  "/yelp": {
    "target": "https://api.yelp.com/v3",
    "secure": true,
    "changeOrigin": true,
    "pathRewrite": {
      "^/yelp": ""
    },
    "headers": {
      "Authorization": "Bearer SOMEBIGLONGTOKEN1234567890"
    }
  }
}
```

2. In that same directory open the file called angular.json, scroll down to the "serve" part around line 50, and add a "proxyConfig" part so it looks like this (see the 5th line in):
```
"serve": {
  "builder": "@angular-devkit/build-angular:dev-server",
  "options": {
    "browserTarget": "projectname:build",
    "proxyConfig": "./proxy.conf.json"
  },
  "configurations": {
    "production": {
      "browserTarget": "projectname:build:production"
    }
  }
},
```
	
3. Now change your API calls to call locally instead. For example,  myservice.service.ts might look like below. Notice you don't need to include the bearer header; I put that in the json file above.
	
```
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class RestaurantapiService {
  apiUrl: string = "/yelp/businesses/search?location=Lansing,MI";
  constructor(private http: HttpClient ) {

  }
  getAllRestaurants(): any {
    return this.http.get(this.apiUrl);
  }
}
```
