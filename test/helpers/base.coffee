chai = require("chai").should()
zombie = require("zombie")
assert = require("assert")
async = require("async")
db = require('../../libs/db')().getDb()

videos = db.collection("videos")
appBaseUrl = "http://localhost:5000/"
zombie.localhost("localhost", 5000)

require('../../app')

base =
  db: db
  zombie: zombie
  assert: assert
  videos: videos
  async: async
  url: appBaseUrl

module.exports = base
