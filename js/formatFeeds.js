//format's the rss & atom feed to be able to be displayed on webpage
$.ajax({
  type: 'GET',
   url: 'Labs/ITWS1100-Lab4-RSS&Atom/RSSRunFeed.xml',
  dataType: 'xml',
  success: function(responseData, status){
    var output = '';  
    $(responseData).find('item').each(function() {
      output += '<div class="entry">';
      output += '<img src="' + $(this).find('enclosure').attr('url') + '" alt="' + $(this).find('title').text() + '" height = 150px width = 250px>';
      output += '<h2><a href="' + $(this).find('link').text() + '" target="_blank">';
      output += $(this).find('title').text();
      output += '</a></h2>';
      output += '<p>' + $(this).find('description').text() + '</p><br>';
      output += '</div>'
    });
    output += '</div>';
    $('#rss').append(output);
  }, error: function(msg) {
    // there was a problem
    alert('There was a problem: ' + msg.status + ' ' + msg.statusText);
  }
});
$.ajax({
  type: 'GET',
  url: 'Labs/ITWS1100-Lab4-RSS&Atom/AtomRunFeed.xml',
  dataType: 'xml',
  success: function(responseData, status){
    var output = '';  
    $(responseData).find('entry').each(function() {
      output += '<h2><a href="' + $(this).find('link').attr('href') + '" target="_blank">';
      output += $(this).find('title').text();
      output += '</a></h2>';
      output += '<p>' + $(this).find('summary').text() + '</p>';
    });
    $('#atom').append(output);
  }, error: function(msg) {
    // there was a problem
    alert('There was a problem: ' + msg.status + ' ' + msg.statusText);
  }
});