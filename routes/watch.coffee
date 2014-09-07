async = require('async')

module.exports = (app) ->

  watch = require("../helpers/watch.coffee")

  app.get "/watch/:watch_id", (req, res) ->
    async.parallel({
      video: watch.getDetails.bind(null, req.params.watch_id)
    }, (err, result) ->
      res.render("watch", {layout: "views/layout.toffee", video: result.video})
    )
