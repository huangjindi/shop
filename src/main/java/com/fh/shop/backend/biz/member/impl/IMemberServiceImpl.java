package com.fh.shop.backend.biz.member.impl;

import com.fh.shop.backend.biz.member.IMemberService;
import com.fh.shop.backend.mapper.member.IMemberMapper;
import com.fh.shop.backend.po.area.City;
import com.fh.shop.backend.po.member.Member;
import com.fh.shop.backend.po.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("memberService")
public class IMemberServiceImpl implements IMemberService {

    @Autowired
    private IMemberMapper memberMapper;
    @Override
    public List<MemberVO> queryMember(Member member) {
        List<Member> memberList = memberMapper.queryMember(member);
        List<MemberVO> memberVOList = new ArrayList<>();
        for (Member memberInfo : memberList) {
            MemberVO memberVO = new MemberVO();
            memberVO.setId(memberInfo.getId());
            memberVO.setUserName(memberInfo.getUserName());
            memberVO.setBirthday(memberInfo.getBirthday());
            memberVO.setEmail(memberInfo.getEmail());
            memberVO.setPhone(memberInfo.getPhone());
            memberVO.setAreaName(memberInfo.getAreaName());
            memberVOList.add(memberVO);
        }
        return memberVOList;
    }

    @Override
    public Long countMember(Member member) {
        return memberMapper.countMember(member);
    }

    public List cityTownList(City city) {
        return memberMapper.cityTownList(city);
    }

    @Override
    public Member toUpdateMember(Member member) {
        return memberMapper.toUpdateMember(member);
    }

    @Override
    public void updateMember(Member member) {
        memberMapper.updateMember(member);
    }
}
