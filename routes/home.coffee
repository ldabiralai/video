async = require('async')

module.exports = (app) ->

  home = require('../helpers/home.coffee')

  app.get "/", (req, res) ->
    async.parallel({
      videos: home.getVideos
    }, (err, results) ->
      res.render("home", {layout: "views/layout.toffee", videos: results.videos})
    )
