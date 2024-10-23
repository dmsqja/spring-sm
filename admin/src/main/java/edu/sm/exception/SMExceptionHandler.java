package edu.sm.exception;


import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLIntegrityConstraintViolationException;

@ControllerAdvice
@Slf4j
public class SMExceptionHandler {

    @ExceptionHandler(DuplicateKeyException.class)
    public String ex2(DuplicateKeyException e, Model model) {
        model.addAttribute("center","error");
        model.addAttribute("msg","중복된 ID입니다!");
        return "index";
    }
    @ExceptionHandler(Exception.class)
    public String ex2(Exception e, Model model) {
        model.addAttribute("center","error");
        model.addAttribute("msg",e.getMessage());
        return "index";
    }
}
