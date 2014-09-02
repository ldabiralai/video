db = require('../libs/db.coffee')().getDb()
videos = db.collection('videos')

module.exports = ->

  home = {

    getVideos: (callback) ->
      videos.find (err, docs) ->
        callback(null, docs)

  }

  home
