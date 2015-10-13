picturefill = require 'picturefill'
skrollr = require 'skrollr'

document.createElement 'picture'

audio = document.getElementById 'audio'
indicator = document.getElementById 'volume_indicator'
audio.onplay = ->
  indicator.setAttribute 'class', 'icon-volume-high'

audio.onpause = ->
  indicator.setAttribute 'class', 'icon-volume-off'

window.toggleAudio = ->
  audio = document.getElementById 'audio'
  if audio.paused then audio.play() else audio.pause()

videoPlaying = null

playVideo = ->
  video = document.getElementById 'video'
  video.play()
  videoPlaying = true

stopVideo = ->
  video = document.getElementById 'video'
  video.pause()
  videoPlaying = false

dimMusic = ->
  audio = document.getElementById 'audio'
  audio.volume = .3

boostMusic = ->
  audio = document.getElementById 'audio'
  audio.volume = 1

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
