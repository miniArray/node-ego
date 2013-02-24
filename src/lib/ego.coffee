###

node-ego
https://github.com/miniArray/node-ego

Copyright (c) 2013 Simon W. Jackson
Licensed under the MIT license.

###

_ = require 'underscore'
google = require 'google'
url = require 'url'

rank = (options) ->
  settings =
    phrase: -> throw Error 'You must specify a search phrase'
    domain: -> throw Error 'You must specify a domain'
    success: -> throw Error 'You must define a callback'
    delay: 0

  settings = _.extend settings, options

  google.resultsPerPage = 25
  nextCounter = 0

  google settings.phrase, (err, next, links) ->
    if err then settings.error err 

    i = 0
    while i < links.length
      link = url.parse links[i].link
      
      if link.host.search(settings.domain) >= 0
        position = i + 1
        result =
          position: position
          page: Math.ceil position / 10

        settings.success result
        return
      else
        i++

    if nextCounter < 4
      nextCounter++
      if next
        setTimeout( ->
          next()
        , settings.delay)

module.exports.rank = rank