base = require("./helpers/base")
contains = require("./helpers/contains")

browser = base.zombie.create()
assert = base.assert
videos = base.videos
async = base.async

describe "Watch", ->

  beforeEach (done) ->
    videos.drop()
    done()

    it "should see the videos title", (done) ->
      videos.insert {title: 'Gravity', duration: 9000000, watch_id: 1}, ->
        browser.visit "/watch/1", (err) ->
          contains.text(browser, "Gravity")
          done()
