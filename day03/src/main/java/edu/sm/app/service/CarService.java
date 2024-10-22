package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CarService implements SMService<Integer, CarDto> {

    final CarRepository carRepository;


    @Override
    public void add(CarDto carDto) throws Exception {
        carRepository.insert(carDto);
    }

    @Override
    public void modify(CarDto carDto) throws Exception {
        carRepository.update(carDto);
    }

    @Override
    public void del(Integer key) throws Exception {
        carRepository.delete(key);
    }

    @Override
    public CarDto get(Integer key) throws Exception {
        return carRepository.selectOne(key);
    }

    @Override
    public List<CarDto> get() throws Exception {
        return carRepository.select();
    }

    public List<CarDto> findByName(String name) throws Exception {
        return carRepository.findByName(name);
    }

    public Page<CarDto> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5); // 5: 한화면에 출력되는 개수
        return carRepository.getpage();
    }

    public Page<CarDto> getFindPage(int pageNo, Search search) throws Exception {
        PageHelper.startPage(pageNo, 5); // 5: 한화면에 출력되는 개수
        return carRepository.getfindpage(search);
    }
}
