# node-ego

Find your rank on Google and other search engines.

## Getting Started
Install the module with: `npm install node-ego`

```coffeescript
ego = require './ego'

ego.rank
  phrase: "my 2013 Frontend developer workflow"
  domain: "miniarray.com"
  delay: 1000
  error: (error) ->
    console.error error
    process.exit 1
  success: (result) ->
    console.log "#{@domain}:\n  page: #{result.page}\n  position: #{result.position}\n  phrase: #{@phrase}"
```

## Documentation
_(Coming soon)_

## Examples
_(Coming soon)_

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
_(Nothing yet)_

## License
Copyright (c) 2013 Simon W. Jackson  
Licensed under the MIT license.
