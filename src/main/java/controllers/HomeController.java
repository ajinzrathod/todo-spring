package controllers;

import entities.Todo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.TodoDao;

@Controller
public class HomeController {
    private static final String AJINKYA = "Ajinkya";

    @Autowired
    TodoDao todoDao;

    @ModelAttribute
    public void  commonForAll(Model model) {
        model.addAttribute("appname", "ghanshyam");
    }

    @RequestMapping(value = {"/home", "/home/"})
    public String home(Model model) {
        model.addAttribute("name", AJINKYA);
        model.addAttribute("page", "home");
        return "home";
    }

    @RequestMapping(value = {"/addTodo", "/addTodo/"})
    public String addTodo(Model model) {
        Todo t = new Todo();
        model.addAttribute("name", AJINKYA);
        model.addAttribute("page", "add");
        model.addAttribute("todo", t);
        return "home";
    }

    @RequestMapping(value = {"/viewTodo", "/viewTodo/"})
    public String viewTodo(Model model) {
        List<Todo> list = this.todoDao.getAll();
        
        model.addAttribute("name", AJINKYA);
        model.addAttribute("page", "view");
        model.addAttribute("list", list);

        return "home";
    }

    @RequestMapping(value={"/saveTodo", "/saveTodo/"}, method = RequestMethod.POST)
    public String saveTodo(@ModelAttribute("todo") Todo t, Model model) {
        t.setTodoDate(new Date());
        System.out.println(t);
        this.todoDao.save(t);

        model.addAttribute("name", AJINKYA);
        model.addAttribute("page", "home");
        model.addAttribute("message", "Saved Successfully");
        return "home";
    }
}
