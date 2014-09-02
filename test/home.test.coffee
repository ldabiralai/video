chai = require("chai")
chai.should()
superagent = require("superagent")
async = require("async")
mongo = require("mongojs")

db = mongo('db')
videos = db.collection('videos');

require('../app')

appBaseUrl = "http://localhost:5000/"

describe "Home", ->

  it "should return a 200", (done) ->
    superagent.get("#{appBaseUrl}")
    .end (e, response) ->
      response.status.should.equal 200
      done()

  describe "should see", ->
    it "the page title", (done) ->
      superagent.get("#{appBaseUrl}")
      .end (e, response) ->
        response.text.should.include "Videos"
        done()

    it "a video", (done) ->
      videos.insert({title: 'Gravity', length: 9000000})
      superagent.get("#{appBaseUrl}")
      .end (e, response) ->
        response.text.should.include "Gravity"
        done()
