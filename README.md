# elm-live playgrounds

The goal of Elm is to make developing Frontend programs for the Web the best it can be. With the release of Elm 0.19 there are four ways to build programs in Elm that run in the browser with the main focus of improving the workflow building SPAs

If you are not familiar with Elm and want to really understand more of what is going on then I highly recommend [https://guide.elm-lang.org/](https://guide.elm-lang.org/). It is THE best walkthrough for a language/framework/etc I have ever read. It not only explains the how, but honestly talks through the why with the pros and cons.

However, you may not have the time or need to read through it so I do my best to walkthrough each of the scenarios below.

## Usage

For each scenario there is a corresponding folder with all of the files and scripts already setup inside of the `playgrounds` folder.

To start the development server which will watch and compile the Elm code in each folder:

### Step One: Change to the scenarios directory

```sh
cd playgrounds/sandbox
```

### Step Two: Install dependencies

```sh
    npm install

    # or if you prefer yarn
    yarn install
```

### Step Three: Start dev server

```sh
    # run dev script from package.json
    npm run dev
```

The dev server is run using `elm-live`. This tool bundles elm's compiler with budo server and chokidar to provide an environment where changes in Elm code are live reloaded in the browser.

## `Browser.sandbox`

Create a “sandboxed” program that cannot communicate with the outside world. This is the most basic starting point to working with Elm in the browser.

You can see how this program is instantiated by looking at the `index.html`. Similar to react you pick a DOM Node and connect it to the compiled elm program.

This works perfectly with live reload because Elm only has control inside of the DOM Node it is connected to.

To test the live reload you can change the text inside of the `view` function on line 28 of the `src/Main.elm` file.

## `Browser.element`

As far as budo is concerned this is the same as sandbox.

To test the live reload you can change the text inside of the `view` function on line 28 of the `src/Main.elm` file.

The difference for Elm users is that this starts to introduce js interop to your program allowing you a controlled gate to interact with the JavaScript world.

To read more about this you can read this chapter of the guide: [https://guide.elm-lang.org/interop/](https://guide.elm-lang.org/interop/)

## `Browser.document`

This is where it all falls apart for live-reload. The server works just fine, but this type of Elm program takes full control of what is rendered in the body tag. Because of this the live reload script that is supposed to be loaded after the opening body tag is wiped by Elm's Virtual Dom.

However, Elm does not completely control what is rendered in the head tag. They leave this free to open up the use of CSS third party scripts and SEO. This is why the option to inject the live-reload script into the head tag is needed for our scenario.

To test the broken live reload you can change the text inside of the `view` function on line 30 of the `src/Main.elm` file.

You can also test a fixed (by hardcoded hack) version by changing the value of match on line # of `node_modules/inject-lr-script/index.js` from `/<body[^>]*>/i -> /<head[^>]*>/i`

## `Browser.application`

As far as budo is concerned this works the same as document.

The difference for Elm users is that you now have control over the last piece of the puzzle to give you full SPA control...routing! Every url change is captured and ran through your program without reloading so that you can handle routing however you see fit!

To read more about this you can read this chapter of the guide: [https://guide.elm-lang.org/webapps/](https://guide.elm-lang.org/webapps/)
