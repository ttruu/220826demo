package com.test.demo.controller;

import com.test.demo.domain.Board;
import com.test.demo.domain.page;
import com.test.demo.repository.boardRepository;
import com.test.demo.repository.memberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class boardController {

    private final boardRepository boardRepository;
    private final memberRepository memberRepository;


    /* 보드 리스트 */
    @GetMapping("/list")
    public String boardList(@RequestParam(name = "searchInput", defaultValue = "") String searchInput,
                            @RequestParam(name = "search", defaultValue = "") String search,
                            Model model, Board board, String currentPage) {
        /*model.addAttribute("boardList", list);*/
        board.setSearchInput(searchInput);
        board.setSearch(search);

        int total = boardRepository.total(board);
        page pg;

        pg = new page(total, currentPage, 5);
        board.setStart(pg.getStart());
        board.setEnd(pg.getEnd());
        /*System.out.println("pg.getRowPage() = " + pg.getRowPage());*/
        List<Board> boardList = boardRepository.boardList(board);
        /*System.out.println("boardList.size() = " + boardList.size());*/

        model.addAttribute("boardList", boardList);
        model.addAttribute("total", total);
        model.addAttribute("board", board);
        model.addAttribute("pg", pg);

        List<Board> list = boardRepository.boardList(board);
        return "list";
    }

    /* write */
    @GetMapping("/write")
    public String write() {
        return "write";
    }

    @PostMapping("/write")
    public String writeProcess(Board boardDto, RedirectAttributes rttr) {

        memberRepository.addMember(boardDto);

        boardRepository.insertBoard(boardDto);

        System.out.println(boardDto);

        return "redirect:/board/list";
    }

    /* get */
    @GetMapping("/get")
    public String getBoard(@RequestParam(name = "id") int id, Model model) {
        Board board = boardRepository.getBoard(id);
        model.addAttribute("board", board);
        System.out.println("화긴");
        System.out.println(board);
        
        return "get";
    }

    /*modify*/
    @GetMapping("/modify")
    public String getModifyBoard(@RequestParam(name = "id") int id, Model model) {
        Board board = boardRepository.getBoard(id);

        model.addAttribute("board", board);
        return "modify";
    }

        /*if( boardDto != null) {
        if (boardDto.getPassword() != null) {
            if (password == null || password.length() < 1) {
                //비밀번호 확인하는 화면으로 이동
                model.addAttribute("message", "비밀글 입니다");
                return "boardEditPassword";
            } else if (!password.equalsIgnoreCase(boardDto.getPassword())) {
                model.addAttribute("message", "비밀번호가 일치하지 않습니다");
                return "boardEditPassword";
            }
        }
    }else{
        //error
    }*/
    @PostMapping("/modify")
    public String modifyBoard(Board boardDto, RedirectAttributes rttr, @RequestParam(value = "password1", required=false) String password, Model model) {
        Board board = boardRepository.getBoard(boardDto.getId());

        if (board.getPassword() == null || board.getPassword() == "") {
            System.out.println("1");
            model.addAttribute("board", board);
            return "redirect:/board/modify?id=" + board.getId();
        } else {
            System.out.println("2");
            if (password.equalsIgnoreCase(board.getPassword())) {
                System.out.println("3");
                model.addAttribute("board", board);
                return "redirect:/board/modify?id=" + board.getId();
            } else {
                System.out.println("4");
                rttr.addFlashAttribute("message", "비밀번호를 다시 입력해주세요");
            return "redirect:/board/get?id=" + board.getId();
            }
        }
    }

    @PostMapping("/update")
    public String UpdateBoard(Board boardDto, Model model) {
        boardRepository.updateBoard(boardDto);
        model.addAttribute("board", boardDto);
//        model.addAttribute("id", boardDto.getId());
        return "redirect:/board/get?id=" + boardDto.getId();
    }

    /*delete*/
    @PostMapping("/delete")
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
