package entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer todoId;

    private String todoTitle;
    private String todoContent;
    private Date todoDate;

    public Todo() {
    }

    public Todo(String todoTitle, String todoContent, Date todoDate) {
        this.todoTitle = todoTitle;
        this.todoContent = todoContent;
        this.todoDate = todoDate;
    }

    public String getTodoTitle() {
        return this.todoTitle;
    }

    public void setTodoTitle(String todoTitle) {
        this.todoTitle = todoTitle;
    }

    public String getTodoContent() {
        return this.todoContent;
    }

    public void setTodoContent(String todoContent) {
        this.todoContent = todoContent;
    }

    public Date getTodoDate() {
        return this.todoDate;
    }

    public void setTodoDate(Date todoDate) {
        this.todoDate = todoDate;
    }

    public Todo todoTitle(String todoTitle) {
        setTodoTitle(todoTitle);
        return this;
    }

    public Todo todoContent(String todoContent) {
        setTodoContent(todoContent);
        return this;
    }

    public Todo todoDate(Date todoDate) {
        setTodoDate(todoDate);
        return this;
    }

    @Override
    public String toString() {
        return "{" +
            " todoTitle='" + getTodoTitle() + "'" +
            ", todoContent='" + getTodoContent() + "'" +
            ", todoDate='" + getTodoDate() + "'" +
            "}";
    }
}
