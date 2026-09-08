package com.ocarina.api.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ocarina.api.model.Song;

@RestController
@RequestMapping("/api/songs")
@CrossOrigin(origins = "*")
public class SongController {

    @GetMapping
    public List<Song> getSongs() {
        return List.of(
                new Song(
                        1L,
                        "Twinkle Twinkle Little Star",
                        "C C G G A A G"
                ),
                new Song(
                        2L,
                        "Happy Birthday",
                        "G G A G C B"
                ),
                new Song(
                        3L,
                        "Seranade of Water",
                        "D F a a b D F a a b a D F G F E G F#"
                ),
                new Song(
                        4L,
                        "Test from pipeline",
                        "D F a a b D F a a b a D F G F E G F#"
                )
        );
    }
}