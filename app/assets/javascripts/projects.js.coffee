# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line({
    element: 'payment_chart'
    data: $('#payment_chart').data('payment')
  xkey: 'year'
  ykeys: ['value']
  labels: ['Value']
  });