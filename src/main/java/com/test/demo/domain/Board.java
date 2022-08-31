package com.test.demo.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Getter
@Setter
public class Board {
    private int id;
    private String boardName;
    private String password;
    private String title;
    private String content;
    private Date inserted;


    private int start;
    private int end;
    private String searchInput;
    private String search;

}





