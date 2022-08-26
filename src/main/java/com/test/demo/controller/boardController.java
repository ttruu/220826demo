package com.test.demo.controller;

import com.test.demo.domain.Board;
import com.test.demo.repository.boardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("board/")
public class boardController {

    private final boardRepository boardRepository;

    /* 1. 보드
     * 보드 리스트 */
    @GetMapping("list")
    public String boardList(@RequestParam (name="type", defaultValue = "")String type,
                          @RequestParam (name="keyword", defaultValue = "") String keyword,
                          Model model, Board board) {
        List<Board> list = boardRepository.boardList(board);
        model.addAttribute("boardList", list);
        return "list";
    }

    /* write */
    @GetMapping("/write")
    public String write() {
        return "write";
    }

    @PostMapping("/write")
    public String writeProcess(Board boardDto, RedirectAttributes rttr) {
        boardRepository.insertBoard(boardDto);

        /*if(success) {
            rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "새글이 등록되지 않았습니다.");
        }*/
        return "redirect:/board/list";
    }

    /* get */
    @GetMapping("get")
    public String getBoard(long id, Model model) {
        Board board = boardRepository.getBoard(id);
        model.addAttribute("board", board);
        return "get";
    }

    /*modify*/
    @PostMapping("modify")
    public String modifyBoard(Board boardDto, RedirectAttributes rttr) {

        boardRepository.updateBoard(boardDto);
        /*int success = 0;

        if(success == 1) {
            rttr.addFlashAttribute("message", "수정 성공");
        } else {
            rttr.addFlashAttribute("message", "수정 실패");
        }*/
        rttr.addAttribute("id", boardDto.getId());
        return "redirect:/board/get";
    }

    /*delete*/
    @PostMapping("delete")
    public String deleteBoard(int id, RedirectAttributes rttr, Model model) {
        boardRepository.deleteBoardById(id);

       /* int success = 0;

        if(success == 0) {
            rttr.addFlashAttribute("message", "삭제 성공");
        } else {
            rttr.addFlashAttribute("message", "삭제 실패");
        }*/
        return "redirect:/board/list";
    }
}
