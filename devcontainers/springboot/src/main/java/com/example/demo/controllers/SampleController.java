package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
  @RequestMapping("/sample")
  public String sample(Model model) {
    model.addAttribute("msg", "hello,world");
    return "sample";
  }
}
