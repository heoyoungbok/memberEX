package com.its.member.controller;


import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "memberSave";

    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO, Model model) {
        boolean result = memberService.save(memberDTO);
        model.addAttribute("result", result);
        return "memberLogin";
    }
    @PostMapping("/duplicate-Check")
    public @ResponseBody String emailDuplicateCheck(@RequestParam("inputEmail") String memberEmail){
        String CheckResult = memberService.emailDuplicateCheck(memberEmail);
        return CheckResult;
        }

    @GetMapping("login")
    public String loginForm(){
        return "memberLogin";
    }
    @PostMapping("login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        boolean loginResult=memberService.login(memberDTO);
        if(loginResult){
            session.setAttribute("loginEmail",memberDTO);
            model.addAttribute("modelEmail",memberDTO.getMemberEmail());
            return "memberMain";
        }else{
            return "memberLogin";
        }
    }
    @GetMapping("/members")
    public String findAll(Model model){
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList",memberList);
        return "memberList";
    }
    }

