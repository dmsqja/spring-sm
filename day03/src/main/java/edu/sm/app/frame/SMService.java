package edu.sm.app.frame;

import edu.sm.app.dto.CustDto;

import java.util.List;

public interface SMService<K,V> {
    CustDto add(V v) throws Exception;
    void modify(V v) throws Exception;
    void del(K k) throws Exception;
    V get(K k) throws Exception;
    List<V> get() throws Exception;
}