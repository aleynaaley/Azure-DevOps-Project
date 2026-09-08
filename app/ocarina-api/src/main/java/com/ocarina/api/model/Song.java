package com.ocarina.api.model;

public class Song {

    private Long id;
    private String name;
    private String notes;

    public Song(Long id, String name, String notes) {
        this.id = id;
        this.name = name;
        this.notes = notes;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getNotes() {
        return notes;
    }
}