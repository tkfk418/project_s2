package com.example.demo;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Optional;

import com.google.common.io.ByteStreams;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class LastFmService {
    
    @Autowired
    private TrackRepository trackRepository;

    private static final String API_KEY = "7c299ab01d7a9433efb0c6bba589ca36";
    private static final String BASE_URL = "https://ws.audioscrobbler.com/2.0/";

    public String getChart() throws IOException {
        OkHttpClient client = new OkHttpClient();

        String url1 = String.format("%s?method=chart.gettoptracks&api_key=%s&page=1&format=json", BASE_URL, API_KEY);
        Request request = new Request.Builder()
                .url(url1)
                .build();

        Response response = client.newCall(request).execute();
        String responseBody = response.body().string();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(responseBody);
        JsonNode trackNode = rootNode.path("tracks").path("track");

        List<Track> tracks = new ArrayList<>();
        for (JsonNode node : trackNode) {
            String name = node.path("name").asText();
            String artist = node.path("artist").path("name").asText();

            request = new Request.Builder()
                .url(BASE_URL + "?method=track.getInfo&api_key=" + API_KEY + "&artist=" + artist + "&track=" + name +  "&format=json")
                .build();
            response = client.newCall(request).execute();
            String responsebody = response.body().string();

            mapper = new ObjectMapper();
            JsonNode rootNode2 = mapper.readTree(responsebody);
            String imageUrl = rootNode2.path("track").path("album").path("image").path(1).path("#text").asText();
           
            if (imageUrl.isEmpty()){
                ClassPathResource resource = new ClassPathResource("/static/default4.png");
                InputStream inputStream = resource.getInputStream();
                byte[] imageData = ByteStreams.toByteArray(inputStream);
                Track track = new Track(name, artist, imageData);
                tracks.add(track);
                trackRepository.save(track);
            } else {
                byte[] imageData = downloadImage(imageUrl);   
                Track track = new Track(name, artist, imageData);
                tracks.add(track); 
                trackRepository.save(track);
            }

            // ClassPathResource resource = new ClassPathResource("/static/default.png");
            // InputStream inputStream = resource.getInputStream();
            // byte[] imageData = ByteStreams.toByteArray(inputStream);
            // Track track = new Track(name, artist, imageData);
            // tracks.add(track);
            // trackRepository.save(track);

            // if (imageUrl == null){
            //     System.out.println("2." +imageUrl);
            //     ClassPathResource resource = new ClassPathResource("/static/default.png");
            //     InputStream inputStream = resource.getInputStream();
            //     byte[] imageData = ByteStreams.toByteArray(inputStream);
            //     Track track = new Track(name, artist, imageData);
            //     tracks.add(track);
                
            // } else {
            //     System.out.println("1." +imageUrl);
            //     byte[] imageData = downloadImage(imageUrl);   
            //     Track track = new Track(name, artist, imageData);
            //     tracks.add(track); 
            // }
            

            // URL url = new URL(imageUrl);
            // InputStream inputStream = url.openConnection().getInputStream();
            // byte[] imageBytes = FileCopyUtils.copyToByteArray(inputStream);

            
        }
        
        return tracks.toString();
    }

    private byte[] downloadImage(String imageUrl) throws IOException {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder().url(imageUrl).build();

        try (Response response = client.newCall(request).execute()) {
            InputStream inputStream = response.body().byteStream();
            byte[] imageData = IOUtils.toByteArray(inputStream);

            File tempFile = File.createTempFile("album", ".png");
            FileOutputStream outputStream = new FileOutputStream(tempFile);
            outputStream.write(imageData);
            outputStream.close();

            return imageData;
        }
    }
}

