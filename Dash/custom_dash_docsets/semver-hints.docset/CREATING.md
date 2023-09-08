Full documentation for generating Dash docsets from HTML pages can be found [here](https://kapeli.com/docsets#dashDocset).

This docset just opens the web page. Nothing is offline and there are no references to sections or anything.

To create a new docset like this one, copy the docset and then update the values in the `Info.plist` file for the new HTML page you'd like a docset for.

The base of this docset was generated by [Dashing](https://github.com/technosophos/dashing). Dashing supports selecting certain HTML elements to create references to and such. This would be nice to use, but the layout of the doc pages it generated was always broken. At least for devhints.io. So that's why I switched to just loading the web page. It still gives me easy access to the docs via Dash even if I don't have any other nice features like a table of contents and referenceable sections.