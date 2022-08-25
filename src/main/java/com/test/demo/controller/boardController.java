package com.test.demo.controller;

import com.test.demo.entity.board;
import com.test.demo.service.boardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("board")
public class boardController {
    @Autowired
    private boardService boardService;

    /* 1. 보드
     * 보드 리스트 */
    @GetMapping("list")
    public String boardList(@RequestParam (name="type", defaultValue = "")String type,
                          @RequestParam (name="keyword", defaultValue = "") String keyword,
                          Model model) {

        List<board> list = boardService.boardList(type, keyword);
        model.addAttribute("boardList", list);

        return "/view/list";
    }

    /* write */
    @GetMapping("write")
    public String write() {
        return "/view/write";
    }

    @PostMapping("writePro")
    public String writeProcess(board boardDto, RedirectAttributes rttr) {
        boolean success = boardService.write(boardDto);

        if(success) {
            rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "새글이 등록되지 않았습니다.");
        }
        return "/view/list";
    }

    /* get */
    @GetMapping("get")
    public String getBoard(Integer id, Model model) {

        model.addAttribute("board", boardService.getBoard(id));

        return "/view/get";
    }
}
