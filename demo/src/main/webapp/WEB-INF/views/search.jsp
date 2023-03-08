<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Last.fm Album Search</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>Last.fm Album Search</h1>
	<form method="GET" action="/searcha" id ="searcha">
		<label for="search-input">Search for albums:</label>
		<input type="text" id="searchinput" name="searchinput">
		<button type="submit">Search</button>
	</form>
	<div id="search-results"></div>
</body>
</html>
<script>
$(document)
.ready(function() {
    $('#searcha').submit(function() {
        var searchinput = $('#searchinput').val();
        var url = 'http://ws.audioscrobbler.com/2.0/?method=album.search&album=' + searchinput + '&api_key=7c299ab01d7a9433efb0c6bba589ca36&format=json';
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                var results = data.results.albummatches.album;
                var html = '';
                $.each(results, function(index, album) {
                    html += '<div>';
                    html += '<img src="' + album.image[2]['#text'] + '">';
                    html += '<p>' + album.name + '</p>';
                    html += '<p>' + album.artist + '</p>';
                    html += '</div>';
                });
                $('#search-results').html(html);
            },
            error: function() {
                console.log("er")
            }
        });
    });
});

</script>
