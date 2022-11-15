package com.slfinalproject.commurest.galleryBoard.domain;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Tag {
    private int tagId;
    private String tagValue;
    private int boardId;
}
