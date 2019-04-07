package com.fh.shop.backend.controller.member;

import com.fh.shop.backend.biz.member.IMemberService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.common.ServerResponseDataTable;
import com.fh.shop.backend.po.area.City;
import com.fh.shop.backend.po.member.Member;
import com.fh.shop.backend.po.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {

    @Resource(name="memberService")
    private IMemberService memberService;

    @RequestMapping("toMemberList")
    public String toMemberList(){
        return "member/memberList";
    }

    @RequestMapping("queryMember")
    @ResponseBody
    public ServerResponse queryMember(Member member, Integer start, Integer length, Integer draw){
        member.setPageSize(length);
        member.setStartPos(start);
        //计算总条数
        Long totalCount = memberService.countMember(member);
        //获取分页列表
        List<MemberVO> memberList = memberService.queryMember(member);
        ServerResponseDataTable serverResponseDataTable = ServerResponseDataTable.success(draw, totalCount, totalCount, memberList);
        return ServerResponse.success(serverResponseDataTable);
    }

    @RequestMapping("cityTownList")
    @ResponseBody
    public ServerResponse cityTownList(City city){
        List<City> cityTownList = memberService.cityTownList(city);
        return ServerResponse.success(cityTownList);
    }

    @RequestMapping("toUpdateMember")
    public String toUpdateMember(ModelMap memberMap, Member member){
        Member memberInfo = memberService.toUpdateMember(member);
        memberMap.put("memberInfo",memberInfo);
        return "member/updateMember";
    }

    @RequestMapping("updateMember")
    public String updateMember(Member member){
        memberService.updateMember(member);
        return "redirect:toMemberList.jhtml";
    }
}
