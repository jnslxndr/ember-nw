# A simple Node-Webkit boilerplate for Ember apps

This boilerplate builds on top of [Tapas with Ember](https://github.com/mutewinter/tapas-with-ember) to build [node-webkit](https://github.com/rogerwang/node-webkit) apps.

A few important differences:

* You can use `coffee-script` (this boilerplate uses it)
* You can use `less` for styling
* Node-Webkit builds are easily done through the [grunt-node-webkit-builder](https://github.com/jens-a-e/grunt-node-webkit-builder) module
* `brunch` is used for fast script & asset compiling

## Getting started

To get startet, clone this repo with
```
git clone https://github.com/jens-a-e/ember-nw <new-project-name>
```

and `cd` into it
```
cd <new-project-name>
```

Install the needed build tools:

```
npm install -g grunt-cli brunch coffee-script scaffolt
```

## Initialize the project

To init the project run:

```
npm install
cake ember:install handlebars:install
```

to install all needed depenencies.

**Important!!**
You should also run

```
grunt build
```

**once before starting to develop**. This lets `grunt-node-webkit-builder` download all needed versions of `node-webkit` and set it up (on the first run, this might take some time). You can, of course, use a local version of `node-webkit`, but it is **not recommended** and without the cached version, builds wont work either! If you still want to do so, see the `scripts` section of the `package.json` file and adjust as you please.

`grunt-node-webkit-builder` will cache the downloads, so a build will only download the needed binaries once, if they are not present. The version can be specified in the `nodewebkit` config section of the `Gruntfile.js`.


After initializing development can, of course, take place in the browser with:

```
cake server
```

If you want to develop directyl with `node-webkit`, keep the `cake server`process running and open another tab in your terminal and run:

```
npm run nw-dev
```

This will launch the cached version of `node-webkit` with a console window opened and pick up any file changes via `live-reload`.


## Building

`grunt-node-webkit-builder` makes it easy to build your for multiple target-platforms without running virtual machines. To specify for which targtes you want to build, see the `nodewebkit` config section of the `Gruntfile.js`.

To build your app simply run `npm run build`. _DO NOT just run `grunt build` or `cake build`, it might cause trouble. Take a look at the `scripts` section in the `package.json` to see what `npm run build` does.

The builds are put into `build/releases/<app-name> - <app-version>/<platform>`.

If want timestamped builds, you can enable these in the `Gruntfile.js`as well.


## App specific NPM stuff

**THIS IS IMPORTANT!**

> There is a `package.json` in `app/assets` which is the `package.json` node-webkit will load. Put all your node-webkit config in there!

Also `npm` modules used by the app you are building live in the `app/assets`directory. _Note, that you have to `cd app/assets` and then `npm <cmd>` to `install/update/remove/...` any modules used by your app to work properly!_

This makes seperation of delopment and app dependencies cleaner.


## Bower

If you want to use `bower` that is optional and you have to set it up on your own.


## Generators & other goodies

A list of generators can be found in the [generators section](https://github.com/mutewinter/tapas-with-ember#generators) of the ['Tapas with Ember' Website](https://github.com/mutewinter/tapas-with-ember) as well as other tools & helpers.


# Thanks To

* [@mutewinter](https://github.com/mutewinter) for building [Tapas with Ember](https://github.com/mutewinter/tapas-with-ember)
* [@Emerson](https://github.com/Emerson) for getting me to stripping down this boilerplate

# Future

It would be great to actually use `ember-cli` for generating and initializing. Also reducing the amount of build tools used (grunt, brunch, scaffolt) would be a good thing. Unfortunatly there is no `ember build --watch` or `ember watch` which would put files into a directory to be picked up by `node-webkit`.
See [this discussion](http://discuss.emberjs.com/t/node-webkit-es6-amd-and-commonjs-resolved/) for more details. There is an [issue filed](https://github.com/stefanpenner/ember-cli/issues/292) for this feature though. Maybe it will get cleaner then.


# License

Releases to the public! Use at own risk. PRs are welcome!
