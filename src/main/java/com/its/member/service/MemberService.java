package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save(MemberDTO memberDTO) {
        int checkResult = memberRepository.save(memberDTO);

        if (checkResult >0){
            return true;
        }else {
            return false;
        }

    }

    public String emailDuplicateCheck(String memberEmail) {
     String checkResult = memberRepository.emailDuplicateCheck(memberEmail);
     if (checkResult == null){
         return "ok";
     }else {
         return "no";
     }

    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO member = memberRepository.login(memberDTO); //오버로딩
        if(member != null){
            return true;
        }else {
            return false;
        }
    }
    public  boolean login(String memberEmail, String memberPassword){
        MemberDTO memberDTO = memberRepository.login(memberEmail,memberPassword);
        if (memberDTO != null){
            return true;
        }else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
     return memberRepository.findAll();
    }
}
