picturefill = require 'picturefill'
skrollr = require 'skrollr'
zepto = require 'zepto'

document.createElement 'picture'

audio = document.getElementById 'audio'
audioIndicator = document.getElementById 'volume_indicator'
audio.onplay = ->
  audioIndicator.setAttribute 'class', 'icon-volume-high'

audio.onpause = ->
  audioIndicator.setAttribute 'class', 'icon-volume-off'


video = document.getElementById 'video'
videoIndicator = document.getElementById 'video_indicator'
video.onplay = ->
  videoIndicator.setAttribute 'class', 'icon-pause'

video.onpause = ->
  videoIndicator.setAttribute 'class', 'icon-play'

window.toggleAudio = ->
  audio = document.getElementById 'audio'
  if audio.paused then audio.play() else audio.pause()

window.toggleVideo = ->
  video = document.getElementById 'video'
  if video.paused then playVideo() else stopVideo()

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
  handlePopElements element, name, direction
  handleVideo element, name, direction

handlePopElements = (element, name, direction) ->
  switch "#{name}-#{direction}"
    when 'dataBottomTop-down'
      $(element).addClass 'active'

    when 'dataTopBottom-down'
      $(element).removeClass 'active'

    when 'dataBottomTop-up'
      $(element).removeClass 'active'

    when 'dataTopBottom-up'
      $(element).addClass 'active'

handleVideo = (element, name, direction) ->
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
