picturefill = require 'picturefill'
skrollr = require 'skrollr'

document.createElement 'picture'

playVideo = ->
  video = document.getElementById 'video'
  # video.webkitEnterFullscreen()

  console.log 'playing video'
  video.play()

stopVideo = ->
  video = document.getElementById 'video'
  # view.webkitExitFullscreen()

  console.log 'stopping video'
  video.pause()

dimMusic = ->

boostMusic = ->

keyframeHandler = (element, name, direction) ->
  switch "#{name}-#{direction}"
    when 'data100Center-down'
      playVideo()
      dimMusic()

    when 'data100Center-up'
      stopVideo()
      boostMusic()

    when 'data-100Center-up'
      playVideo()
      dimMusic()

    when 'data-100Center-down'
      stopVideo()
      boostMusic()

skrollr.init
  forceHeight: false
  keyframe: keyframeHandler
