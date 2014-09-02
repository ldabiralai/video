mongojs = require('mongojs')
db = null

module.exports = ->

  getDb: ->
    db if db
    db = mongojs('db')
    db
