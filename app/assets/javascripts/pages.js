var ready
ready = function() {
  var year = Number($('#currentYear').text());
  var month = Number($('#currentMonth').text());
  function nextMonth() {
    month += 1;
    if(month === 13) {
      year += 1;
      month = 1;
    }
  }

  function previousMonth() {
    month -= 1;
    if(month === 0) {
      year -= 1;
      month = 12;
    }
  }

  // load current account data
  $('div.currentMonth').text("loading...");
  $.get("/accounts?year=" + year + "&month=" + month, function(data) {
    $('div.currentMonth.current').html(data);
  });

  $('a.nextMonth').click(function() {
    nextMonth();
    $('div.currentMonth').prepend("loading...");
    $.get("/accounts?year=" + year + "&month=" + month, function(data) {
      $('div.currentMonth.previous').remove();
      $('div.currentMonth.current').removeClass('current').addClass('previous')
      var newCurrent = $('div.currentMonth.next').removeClass('next').addClass('current').after("<div class='currentMonth next'/>");
      history.replaceState({year: year, month: month}, "", "/" + year + "/" + month);
      newCurrent.html(data);
    });
  });

  $('a.prevMonth').click(function() {
    previousMonth();
    $('div.currentMonth').prepend("loading...");
    $.get("/accounts?year=" + year + "&month=" + month, function(data) {
      $('div.currentMonth.previous').text("loading...");
      $('div.currentMonth.next').remove();
      $('div.currentMonth.current').removeClass('current').addClass('next')
      var newCurrent = $('div.currentMonth.previous').removeClass('previous').addClass('current').before("<div class='currentMonth previous'/>");
      history.replaceState({year: year, month: month}, "", "/" + year + "/" + month);
      newCurrent.html(data);
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
