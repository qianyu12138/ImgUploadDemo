package cn.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SubmitController {

    @ResponseBody
    @RequestMapping("/sub")
    public String sub(String img){
        System.out.println(img);
        return "success";
    }
}
