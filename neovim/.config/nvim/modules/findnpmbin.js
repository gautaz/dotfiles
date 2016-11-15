var path = require('path')
var destination = process.argv[2]

if(destination !== __dirname) {
  var fs = require('fs')
  var local = path.join(destination, '.' + path.basename(__filename) + '.' + process.pid)

  fs.link(__filename, local, function(err) {
    var done = function(err) {
      if(err) {
        console.error(err)
        process.exit(1)
      }
      require(local)
      fs.unlink(local)
    }
    if(err) {
      // link probably failed because both locations are on different filesystems
      var input = fs.createReadStream(__filename)
      var output = fs.createWriteStream(local)
      input.on('error', done)
      output.on('error', done)
      output.on('close', done.bind(null, null))
      input.pipe(output);
    } else {
      done()
    }
  })
} else {
  process.argv.slice(3).forEach(function(arg) {
    var search = arg.split(':')
    var pack = search[0]
    var exec = search[1] || pack
    try {
      var packpath = require.resolve(pack).split(path.sep)
      console.log(pack + ':' + packpath.slice(0, packpath.lastIndexOf('node_modules') + 1).concat(['.bin', exec]).join(path.sep))
    } catch(err) {
    }
  })
}
