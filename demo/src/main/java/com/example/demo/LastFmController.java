package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class LastFmController {

    @Autowired
    private TrackRepository trackRepository;

    private final LastFmService lastFmService;

    public LastFmController(LastFmService lastFmService) {
        this.lastFmService = lastFmService;
    }

    @GetMapping("/chart")
    public String getChart(Track track, Model model) throws IOException {
        trackRepository.deleteAll();
        lastFmService.getChart();
        List<Track> trackList = trackRepository.findAll();
        model.addAttribute("trackList", trackList);
        return "chart";
    }

    @GetMapping("/{id}")
    public void showImage(@PathVariable String id, HttpServletResponse response) throws IOException {
        Optional<Track> image = trackRepository.findById(id);
        if (image.isPresent()) {
            response.setContentType(MediaType.IMAGE_PNG_VALUE);
            response.getOutputStream().write(image.get().getImg());
        }
    }
    
    @GetMapping("/")
    public String listImages(Model model) {
        List<Track> images = trackRepository.findAll();
        model.addAttribute("images", images);
        return "image-list";
    } 

}
