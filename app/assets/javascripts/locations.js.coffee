# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # TODO Change how this whole thing works
  #   should be a select box that pulls in your most recent locations
  #   and then as you type filters those down, and/or suggests new places
  #   especially if what you write isn't returning results from our own db
  #   this will do for now, request here, request on client side to verify
  geocoder = new google.maps.Geocoder()

  lastResults = []

  $in_street = $('#location_street_1')
  $in_street.autocomplete
    source: (req, res)->
      geocoder.geocode
        address: req.term
        , (results, status)->
          if status is google.maps.GeocoderStatus.OK
            lastResults = results
            res $.map results, (item, idx)->
              label: item.formatted_address, value: item.formatted_address, idx: idx
          else
            console.log 'somethiing went terribly, terribly wrong'
    select: (evt, ui)->
      result = lastResults[ui.item.idx]
      window.courserv_scripts.loadLatLngInMap(result.geometry.location)
      true



  $in_street.on 'keyup', (evt)->
    keyCode = evt.which
    if keyCode is 40      # DOWN
      console.log ''
    else if keyCode is 38 # UP
      console.log ''
    else if keyCode is 13 # ENTER
      console.log 'enter pressed!'

    console.log evt.which
