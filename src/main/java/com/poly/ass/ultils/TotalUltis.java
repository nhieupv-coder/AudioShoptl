package com.poly.ass.ultils;

import com.poly.ass.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Data
@NoArgsConstructor
@Service
public class TotalUltis {
  public double getTotalAOrder(List<OrderDetail> listOrderDetail){
        double total = 0D;
        total = listOrderDetail.stream().mapToDouble(i->i.getPrice()*i.getQuantity()).sum();
        System.out.println(total);
        return total;
    }
}
