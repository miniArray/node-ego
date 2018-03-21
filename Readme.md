# node-ego

[![Greenkeeper badge](https://badges.greenkeeper.io/miniArray/node-ego.svg)](https://greenkeeper.io/)

Find your rank on Google and other search engines.

## Getting Started
Install the module with: `npm install ego`

```coffeescript
ego = require 'ego'

ego.rank
  phrase: "ebay"
  domain: "ebay.com"
  success: (result) ->
    console.log "Google position: #{result.position}"
```
*output: "Google position: 1"*

## Examples

### Delay

Google will temporarily block searches if they suspect you're automating searches. You can specify a delay (in milliseconds) between each pagination to avoid this.

```coffeescript
ego.options.delay = 5000

# or

ego.rank
  delay: 5000
  phrase: "ebay"
  domain: "ebay.com"
  success: (result) ->
    console.log "Google position: #{result.position}"
```

## Documentation
_(Coming soon)_

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Roadmap

* Incorporate bing/yahoo

## Release History

### v0.1.0
* now using node-google

## License
Copyright (c) 2013 Simon W. Jackson  
Licensed under the MIT license.
