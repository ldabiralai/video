mongojs = require('mongojs')
db = null

module.exports = ->

  getDb: ->
    db if db
    db = mongojs('127.0.0.1/db')
    db
