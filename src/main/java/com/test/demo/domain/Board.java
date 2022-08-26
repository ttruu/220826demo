package com.test.demo.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Data
@Getter
@Setter
public class Board {
    private long id;
    private String title;
    private String content;
    private LocalDateTime inserted;

/*    public String getPrettyInserted() {
        // 24시간 이내면 시간만
        // 이전이면 년-월-일

        LocalDateTime now = LocalDateTime.now();
        if (now.minusHours(24).isBefore(inserted)) {
            return inserted.toLocalTime().toString();
        } else {
            return inserted.toLocalDate().toString();
        }
    }*/
}





