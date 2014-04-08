# # app global objects & helpers

# window.doQuit = () ->
#   if confirm "Are your sure, you want to quit?"
#     win.close(true)

# try
#   # window.win = gui.Window.get()
#   win.on 'close', window.doQuit
# catch e
#   console.warn "Not in node-webkit." if window.ENV?.name is "development"

# # prepare the fs module from node
# try
#   # Note: See inde.html for `node_require` shiming!
#   window.fs = node_require('fs')
#   window.pathUtil = node_require('path')
#   # Get some vars from the package:
#   if fs.existsSync 'package.json'
#     packageInfo = JSON.parse(fs.readFileSync('package.json'))
#     window.credits = "#{packageInfo.name} #{packageInfo.version} #{packageInfo.copyright}"
#   else
#     if window.ENV?.name is "development"
#       console.error "No package.json found!"

# catch e
#   if window.ENV?.name is "development"
#     console.warn "No file writing support! We seem to be in the browser."


# window.checkFSSupport = () ->
#   return fs? and pathUtil?

# window.appPath = if checkFSSupport()
#     if process.platform is 'darwin'
#       pathUtil.resolve(process.execPath, "../../../../../../../")
#     else
#       pathUtil.dirname(process.execPath)
#   else
#     ""
