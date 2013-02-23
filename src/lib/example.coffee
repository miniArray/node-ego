util = require('util')
gr = require('./ego')

gr.rank "node.js", "nodejs.org", (error, result) ->
  if error
    console.error(error);
    process.exit(1)

  console.log(util.inspect(result,true,10))

###
util = require 'util'
ego = require './ego'

ego.rank
	query: ""
	domain: ""
	error: ->
		console.error error
		process.exit 1
	success: ->
		console.log(util.inspect(result,true,10))