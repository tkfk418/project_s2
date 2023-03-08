<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>

<body>
    <h1>홈페이지</h1>
    <div id="chart"></div>
    <a href="/register">회원가입 이동</a>
    <a href="/login">로그인 이동</a>
    <a href="/users">회원목록 이동</a>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.ready(function() {
    // Last.fm API 키
    var apiKey = '7c299ab01d7a9433efb0c6bba589ca36';
    
    // 음원차트 요청
    $.ajax({
      url: 'https://ws.audioscrobbler.com/2.0/',
      data: {
        method: 'chart.gettoptracks',
        api_key: apiKey,
        format: 'json',
        limit: 10
      },
      dataType: 'json',
      success: function(response) {
          console.log(response)
        // 트랙 목록
        var tracks = response.tracks.track;
        
        // 각 트랙에 대한 처리
        $.each(tracks, function(index, track) {
          // 앨범 정보 요청
          $.ajax({
            url: 'https://ws.audioscrobbler.com/2.0/',
            data: {
              method: 'track.getInfo',
              api_key: apiKey,
              artist: track.artist.name,
              track: track.name,
              format: 'json'
            },
            dataType: 'json',
            success: function(response) {
              // HTML 페이지에 트랙 정보 추가
              if(typeof(response.track.album) == "undefined"){
                  var html = '<span class="track">';
                  html += '<span class="rank">' + (index + 1) + '</span>';
                  html += '<img src="img/default4.png" alt="Album Image" >';
                  html += '<span class="title">' + track.name + '</span>';
                  html += '<span class="artist">' + track.artist.name + '</span>'; 
                  html += '</div>' + '<br>';
                  $('#chart').append(html);
              } else{
                  // 앨범 정보에서 이미지 URL 추출
                  var image = response.track.album.image[1]['#text'];
                  var html = '<span class="track">';
                  html += '<span class="rank">' + (index + 1) + '</span>';
                  html += '<img src="' + image +'" alt="Album Image">';
                  html += '<span class="title">' + track.name + '</span>';
                  html += '<span class="artist">' + track.artist.name + '</span>'; 
                  html += '</div>' + '<br>';
                  $('#chart').append(html);
              }
              
            }
          });
        });
      }
    });
  });
</script>
</html>
