base = require("./helpers/base")
contains = require("./helpers/contains")

browser = base.zombie.create()
assert = base.assert
videos = base.videos
async = base.async

describe "Home", ->

  beforeEach (done) ->
    videos.drop()
    done()

  it "should return a 200", (done) ->
    browser.visit "/", (err) ->
      browser.assert.status 200
      done()

  describe "should see", ->
    it "the page title", (done) ->
      browser.visit "/", (err) ->
        browser.assert.text("h1", "Videos")
        done()

    it "a video", (done) ->
      videos.insert {title: 'Gravity'}, ->
        browser.visit "/", (err) ->
          browser.assert.text("li", "Gravity")
          done()

    it "multiple videos and their length", (done) ->
      films = [{title: 'Gravity', duration: 9000000}, {title: 'Oblivion', duration: 600000}]
      async.each films, (film, callback) ->
        videos.insert film, ->
          callback()
      , ->
        browser.visit "/", (err) ->
          contains.text(browser, "Gravity - 150 minutes")
          contains.text(browser, "Oblivion - 10 minutes")
          done()

    it "a video which links to itself", (done) ->
      videos.insert {title: 'Gravity', duration: 9000000, watch_id: 1}, ->
        browser.visit "/", (err) ->
          browser.clickLink "Gravity", ->
            contains.text(browser, "Gravity")
            done()
