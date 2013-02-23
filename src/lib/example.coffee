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