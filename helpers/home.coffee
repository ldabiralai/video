db = require('../libs/db.coffee')().getDb()
videos = db.collection('videos')

async = require('async')
moment = require('moment')

module.exports = ->

  home = {

    getVideos: (callback) ->
      videos.find (err, docs) ->
        async.each docs, (video, callback) ->
          video.duration = moment.duration(video.duration).asMinutes()
          callback()
        , ->
          callback(null, docs)

  }

  home
