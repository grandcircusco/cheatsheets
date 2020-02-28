# Heroku Deployment

### 1. Configure Heroku

1. Sign up for a heroku account and install heroku on your computer.

2. In command line, navigate to your express app folder and run this, replacing app-name-here with the subdomain you want for your app. You will have to pick an app name that is unique in the world!

   `heroku create app-name-here`

3. Then run this to set up a database for this app.
   `heroku addons:create heroku-postgresql:hobby-dev --app app-name-here`

### 2. Configure pgAdmin to connect to your database

1. Log into the Heroku website. Select your project. Click the Heroku Postgres link. Click settings. Click "View Credentials...". This is the information you need to connect.
2. Open pgAdmin. Right click "Servers" >> Create >> Server...
3. Select a name (e.g. Heroku app-name-here). Select the "Connection" tab. Using the information from Heroku, fill in Host name, port, Maintenance database (heroku database), Username, and Password.
4. Click Save.
5. When you expand the server, you'll see a massive list of databases. You'll have to scroll to find yours. They're listed alphabetically.

### 3. Set up your Express app to work on Heroku

1. Locally, you always run Express on port 3000, but on Heroku it needs to run on a different port. Change the bottom of your server.js file to:

```javascript
// define the port
const DEFAULT_PORT = 3000;
// Use Heroku's PORT or default to 3000.
const port = process.env.PORT || DEFAULT_PORT;
// run the server
app.listen(port, () => console.log(`Listening on port: ${port}.`));
```

2. Create a file named `Procfile`. Fill it with the following.
   `web: node server.js`

3. Update your `package.json`

   1. Add this

      ```json
        "engines": {
          "node": "12.x"
        },
      ```

   2. Add this to the scripts:
      `"start": "node server.js"`

### 4. Set up your Express app to work with Heroku database

1. Install `dotenv` in dev mode. This reads environment variables from a `.env` file.

   `npm install dotenv --save-dev`

2. Change your connection file to the following. This will look to the .env file for database connection information. 

   ```javascript
   const { Pool } = require('pg');
   try {
     // When not running via Heroku, this will load the .env file.
     require('dotenv').config();
   } catch (e) {
     // When running with Heroku, dotenv doesn't need to be available.
   }
   const connectionString = process.env.DATABASE_URL;
   const pool = new Pool({
     connectionString: connectionString,
     ssl: !connectionString.includes('localhost')
   });
   
   module.exports = pool;
   ```

3. Create a `.env` file. A connection string for local and another one for heroku. Comment out the one you don't want to use right now with a "#".

   ```bash
   DATABASE_URL=postgres://postgres:password@localhost:5432/database-name
   # DATABASE_URL=postgres://asldkfunasduhf:c94c71c1be50eb2b9523f01bb568414d92c48910c823092ecb340a8e0fc79a4e@ec2-123-231-113-57.compute-1.amazonaws.com:5432/8910c823092ec5
   ```

   1. The first line is the local connection. Use this exactly, but replace the password (if yours is different) and the database-name.
   2. The second line is the heroku connection. Copy this from the URI on the Heroku credentials page.

4. DON'T COMMIT YOUR .env FILE! It contains secrets that hackers would love to have. Add it to your `.gitignore` file now. This means that if you're in a group, each group member will need to independently create a copy of this file. (You can send it on slack.)

### 5. Deploy to Heroku

1. If your project is not already a Git repo, `git init`.
2. Verify that heroku remote is configured: `git remote -v`. You should see heroku in the list.
   1. If not, `git remote add heroku YOUR-HEROKU-GIT-URL`. You can find the "Heroku Git URL" in the settings tab for your app on Heroku's website.
3. Add & Commit files to Git.
4. Push files to Heroku.
   `git push heroku master`
5. If deployment is successful, the API URL will be printed to the terminal.
6. Your Express API should now be up and running in the cloud. Test it to make sure. Go to `https://your-app-here.herokuapp.com/students` (or replace /students with one of your API endpoint URLs.)

### 6. Configure Your Angular app to connect to your Heroku-deployed API

1. Add your local base URL AND your Heroku base URL to `environments/environment.ts`. Name it whatever makes sense. Comment out the one you don't want to use right now. e.g.

   ```js
   export const environment = {
     production: false,
     studentsApiBaseUrl: "http://localhost:3000"
     // studentsApiBaseUrl: "https://api-app-name.herokuapp.com"
   };
   ```

2. Add ONLY your Heroku base URL to `environments/environments.prod.ts`. Name it the same. e.g.

   ```js
   export const environment = {
     production: true,
     studentsApiBaseUrl: "https://api-app-name.herokuapp.com"
   };
   ```

3. The above steps specify the different options for API URLs. Now in your Angular service, write the code to use these.

   ```typescript
   import { environment } from 'src/environments/environment';
   
   export class StudentApiService {
     // Store the appropriate base URL. Angular automatically selects the right environment file.
     private readonly BASE_URL = environment.studentsApiBaseUrl;
   ```

4. Then in the individual service methods use the `BASE_URL` property in URLs.

   ```typescript
   return this.http.get<Student[]>(`${this.BASE_URL}/students`);
   ```

5. When running locally, run `ng serve` as usual. Update `environment.ts` anytime you want to switch which API you are using. Simply uncomment one and comment out the other.

6. When deploying to surge.sh, use `ng build --prod`. This will use the Heroku API URL.

### 7. Deploy Angular with Surge

1. Build the Angular app.
   `ng build --prod`
2. Navigate to the `dist` folder and then the folder for your project inside that.
3. If using routing, rename the `index.html` file to `200.html`.
4. Deploy to surge by running `surge`. Specify the the domain of your project, starting with `https://` and ending with `.surge.sh`.

