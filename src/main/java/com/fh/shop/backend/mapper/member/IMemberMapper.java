package com.fh.shop.backend.mapper.member;

import com.fh.shop.backend.po.area.City;
import com.fh.shop.backend.po.member.Member;

import java.util.List;

public interface IMemberMapper {

    List<Member> queryMember(Member member);

    Long countMember(Member member);

    List cityTownList(City city);

    Member toUpdateMember(Member member);

    void updateMember(Member member);
}
