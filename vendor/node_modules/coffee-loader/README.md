# coffee-script loader for webpack

## Usage

``` javascript
var exportsOfFile = require("coffee!./file.coffee");
// => return exports of executed and compiled file.coffee

var exportsOfFile2 = require("coffee?literate!./file.litcoffee");
// can also compile literate files.
```

[Documentation: Using loaders](http://webpack.github.io/docs/using-loaders.html)

### Recommended configuration

``` javascript
{
	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee-loader" },
			{ test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
		]
	}
}
```

## License

MIT (http://www.opensource.org/licenses/mit-license.php)
