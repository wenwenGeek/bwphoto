package com.carson.demo.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private String pwd;

    public String execute () {
        System.out.println(pwd);

        return SUCCESS;
    }

    public String login () {

        System.out.println(pwd);
        return SUCCESS;
    }

    public String getPwd () {
        return pwd;
    }

    public void setPwd (String pwd) {
        this.pwd = pwd;
    }
}