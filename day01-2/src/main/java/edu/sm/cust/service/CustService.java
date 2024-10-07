package edu.sm.cust.service;

import edu.sm.dto.Cust;
import edu.sm.frame.SMRepository;
import edu.sm.frame.SMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("cservice")    //서비스역할을 하는 컴퍼넌트임
public class CustService implements SMService<String, Cust> {

    @Autowired  //자동적으로 SMRepository 타입의 객체를 찾아서 객체를 주입해줌.
    SMRepository<String, Cust> repository;

    @Override
    public void register(Cust cust) {
        repository.insert(cust);
    }

    @Override
    public void modify(Cust cust) {
        repository.update(cust);
    }

    @Override
    public void remove(String s) {
        repository.delete(s);
    }
}