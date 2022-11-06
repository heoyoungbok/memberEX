package com.its.member.repository;


import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save",memberDTO);
    }

    public String emailDuplicateCheck(String memberEmail) {
        return sql.selectOne("Member.DuplicateCheck",memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }
    public MemberDTO login(String memberEmail,String memberPassword){
        MemberDTO member = new MemberDTO();
        member.setMemberEmail(memberEmail);
        member.setMemberPassword(memberPassword);
        return sql.selectOne("Member.login",member);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
}
