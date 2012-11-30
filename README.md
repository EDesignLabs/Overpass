# Overpass

## Getting started

### Developing
- Install [node.js](http://nodejs.org/). If you're not a fan, don't worry--we're just using it to manage Javascript modules on the client side.  Nothing server side here!
- Install the [brunch framework](http://brunch.io/) globally

```
    npm install brunch -g
```

- Clone this repository

```
    git clone git://github.com/EDesignLabs/Overpass.git
    cd Overpass
```

- Install the modules Overpass needs

```
    npm install
```

- Fire up your brunch test server

```
    brunch w -s
```

- Check out [your handywork](http://localhost:3333) at http://localhost:3333 (or another port, if you changed it with the brunch `-p` option.)
- Try making a change to `app/assets/index.html` and saving the file.  Your browser refreshes automagically with the change! Brunch in action!
- Many changes can be made right inside the `app/assets` directory, which works pretty much like any other webroot.


### Deploying
- Install the [heroku toolbelt](https://toolbelt.heroku.com/). It's a ridiculously simple way to set up a test server.
- Create a heroku app from inside your Overpass repo's directory

```
    cd /path/to/Overpass
    heroku create
```

- Push Overpass to heroku

```
    git push heroku master
```

- Open your shiny new web app in the browser!

```
   heroku apps:open
```

## Details

### Languages

- [CoffeeScript](http://coffeescript.org/)
- [Stylus](http://learnboost.github.com/stylus/)
- [Handlebars](http://handlebarsjs.com/)

### Features

- [Swag v0.1.7](https://github.com/elving/swag)
- [Font Awesome v2.0](https://github.com/FortAwesome/Font-Awesome)
- [Modernizr v2.6.1](https://github.com/Modernizr/Modernizr)
- [Brunch Auto-Reload v1.3.2](https://github.com/brunch/auto-reload-brunch)
- [Backbone-Mediator](https://github.com/chalbert/Backbone-Mediator)
- [Lodash v0.8.2](https://github.com/bestiejs/lodash)
- [HTML5 Boilerplate v3.0.0](https://github.com/h5bp/html5-boilerplate)
- [Coffeelint 1.4.4](https://github.com/ilkosta/coffeelint-brunch)
