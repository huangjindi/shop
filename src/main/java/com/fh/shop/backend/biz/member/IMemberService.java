package com.fh.shop.backend.biz.member;

import com.fh.shop.backend.po.area.City;
import com.fh.shop.backend.po.member.Member;
import com.fh.shop.backend.po.member.MemberVO;

import java.util.List;

public interface IMemberService {
    List<MemberVO> queryMember(Member member);

    Long countMember(Member member);

    List<City> cityTownList(City city);

    Member toUpdateMember(Member member);

    void updateMember(Member member);
}
