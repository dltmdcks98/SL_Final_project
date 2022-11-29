package com.slfinalproject.commurest.recommend.domain;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Recommend {
    private int recommendNo;
    private int bno;
    private int userId;
    private int recommendCheck;
    private String recommendDate;
}
