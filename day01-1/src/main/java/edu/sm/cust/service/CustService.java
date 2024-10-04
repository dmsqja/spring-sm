package edu.sm.cust.service;

import edu.sm.cust.repository.CustRepository;
import edu.sm.dto.Cust;
import edu.sm.frame.SMRepository;
import edu.sm.frame.SMService;

public class CustService implements SMService<String, Cust> {

    SMRepository<String, Cust> repository;

    public void setRepository(SMRepository<String, Cust> repository) {
        this.repository = repository;

        System.out.println("Create Connection Pool........");   // 기존 환경을 쉽게 spring 으로 변경할 수 있음
    }

//    public CustService(){}
//
//    public CustService(SMRepository<String, Cust> repository) {
//        this.repository = repository;
//    }

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