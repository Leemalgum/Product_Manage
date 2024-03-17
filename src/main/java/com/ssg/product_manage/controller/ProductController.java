package com.ssg.product_manage.controller;

import com.ssg.product_manage.dto.PageRequestDTO;
import com.ssg.product_manage.dto.ProductDTO;
import com.ssg.product_manage.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @RequestMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     Model model) {
        log.info("product list method");

        if (bindingResult.hasErrors()) {
            pageRequestDTO = PageRequestDTO.builder().build();
        }

        model.addAttribute("responseDTO", productService.getList(pageRequestDTO));
    }

    @GetMapping("/register")
    public void register() {
        log.info("get product register");
    }

    @PostMapping("/register")
    public String registerPost(@Valid ProductDTO productDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
        log.info("post product register");
        if (bindingResult.hasErrors()) {
            log.info("has error...");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/product/register";
        }
        productService.register(productDTO);
        return "redirect:/product/list";
    }

    @GetMapping({"/read", "/modify"})
    public void read(Long pno, PageRequestDTO pageRequestDTO, Model model) {
        ProductDTO productDTO = productService.getOne(pno);
        model.addAttribute("dto", productDTO);
    }

    @PostMapping("/remove")
    public String remove(Long pno, RedirectAttributes redirectAttributes) {
        productService.remove(pno);
        return "redirect:/product/list";
    }

    @PostMapping("/modify")
    public String modify(@Valid ProductDTO productDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            log.info("has errors.......");
            log.info(bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", productDTO.getPno());
            return "redirect:/product/modify";
        }
        log.info(productDTO);
        productService.modify(productDTO);
        return "redirect:/product/list";
    }
}
