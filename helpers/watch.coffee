db = require('../libs/db.coffee')().getDb()
videos = db.collection('videos')


watch = {

  getDetails: (watch_id, callback) ->
    videos.findOne {watch_id: parseInt(watch_id)}, (err, doc) ->
      callback(null, doc)

}

module.exports = watch
