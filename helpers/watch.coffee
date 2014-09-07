db = require('../libs/db.coffee')().getDb()
videos = db.collection('videos')


watch = {

  getDetails: (watch_id, callback) ->
    videos.findOne
      watch_id: watch_id
    , (err, docs) ->
      console.log docs
      callback(null, docs)

}

module.exports = watch
