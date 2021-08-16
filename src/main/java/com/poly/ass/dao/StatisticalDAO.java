package com.poly.ass.dao;

import com.poly.ass.entity.Statistical;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public class StatisticalDAO {
    public double getTotal(Page<Statistical> page){
        double total = page.getContent().stream().mapToDouble(s -> s.getStatistical()).sum();
        return total;
    }

}
