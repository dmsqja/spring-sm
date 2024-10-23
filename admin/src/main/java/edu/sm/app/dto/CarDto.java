package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarDto {
    private int carId;
    private String carName;  // 차량 이름
    private int carPrice; // 차량 가격
    private String carColor; // 차량 색상
    private String carType; // 차종
    private String carImg; // 차량 사진
    private LocalDateTime productionDate; // 차량 생산 일자
}