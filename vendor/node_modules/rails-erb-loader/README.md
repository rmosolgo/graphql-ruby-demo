# rails-erb-loader

[![npm version](https://img.shields.io/npm/v/rails-erb-loader.svg?style=flat-square)](https://www.npmjs.com/package/rails-erb-loader)
[![Standard - JavaScript Style Guide](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat-square)](http://standardjs.com/)
[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Embedded Ruby (`.erb`) `webpack` loader for Ruby projects.

Compiles Embedded Ruby template files in any Ruby project. Files are built using either the `Erubis` or `ERB` gem.

## Table of Contents
- [Install](#install)
- [Usage](#usage)
- [Configuration](#configuration)
  - [Query parameters](#query-parameters)
  - [Configuration comments](#configuration-comments)
- [Contribute](#contribute)
- [License](#license)

## Install

Install from npm

```console
$ npm install rails-erb-loader --save-dev
```

## Usage

Add `rails-erb-loader` to your preloaders.

```js
// webpack.config.js

module.exports = {
  preLoaders: [
    { test: /\.erb$/, loader: 'rails-erb-loader' },
  ]
};
```

## Configuration

### Query parameters

Can be configured with [query parameters](https://webpack.github.io/docs/using-loaders.html#query-parameters):

| Option | Default | Description |
| ------ | ------- | ----------- |
| `cacheable` | `true` | If `false`, then files are rebuilt every time `webpack` rebuilds. If `true`, files will only be rebuilt when they or their dependencies are modified. |
| `dependencies` | `[]` | A list of Ruby files to watch for changes. |
| `dependenciesRoot` | `"app"` | The root of your Rails project, relative to `webpack`'s working directory. |
| `engine` | `"erubis"` | ERB Template engine, `"erubis"` and `"erb"` are supported right now. |
| `parseComments` | `true` | Search files for [configuration comments](#configuration-comments) before compiling. |
| `runner` | `"./bin/rails runner"` | Command to run Ruby scripts, relative to `webpack`'s working directory. |

These options may also be specified directly in your `webpack` config. For example, if your `webpack` process is running in a subdirectory of your Rails project:

```js
module.exports = {
  railsErbLoader: {
    runner: '../bin/rails runner',
    dependenciesRoot: '../app',
  },
  // ...
}
```

Also supports building without Rails:

```js
module.exports = {
  railsErbLoader: {
    runner: 'ruby',
    engine: 'erb'
  },
  // ...
}
```

### Configuration comments

`rails-erb-loader` will parse files for overrides to query parameters. These must be `/* ... */` style block comments starting with the correct `rails-erb-loader-*` command. This comment syntax is supported in JavaScript, CSS, SASS and less.

#### `rails-erb-loader-cacheable`

Override `cacheable` config for just this file.

```js
/* rails-erb-loader-cacheable false */
export const JS_BUILD_TIME = <%= DateTime.now.to_formatted_s(:iso8601) %>
```

#### `rails-erb-loader-dependencies`

If your `.erb` files depend on files in your Ruby project, you can list them explicitly. Inclusion of the `rails-erb-loader-dependency` (or `-dependencies`) comment will tell `webpack` to watch these files and rebuild when they are changed.

Here is an example React component that depends on the `User` and `Image` Rails models:

```erb
// app/assets/javascripts/UserFormFields.js

/* rails-erb-loader-dependencies models/user models/image */

export default function UserFormFields() {
  return (
    <div>
      <label htmlFor='avatar'>
        Avatar
      </label>
      <ImageField id='avatar' maxSize={<%= Image::MAX_SIZE %>} />
      <label htmlFor='name'>
        Name
      </label>
      <input
        id='name'
        type='text'
        maxLength={<%= User::MAX_NAME_LENGTH %>}
      />
      <label htmlFor='age'>
        Age
      </label>
      <input
        id='age'
        type='number'
        min={<%= User::MIN_AGE %>}
        max={<%= User::MAX_AGE %>}
      />
    </div>
  )
}
```

## Contribute

Questions, bug reports and pull requests welcome. See [GitHub issues](https://github.com/usabilityhub/rails-erb-loader/issues).

## License

MIT
