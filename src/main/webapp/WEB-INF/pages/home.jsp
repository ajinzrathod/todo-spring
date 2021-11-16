<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>${appname} | ${page}</title>

  </head>
  <body>
  <div class="container">
		<h1 class="text-center">Welcome to ToDo !!</h1>

		<div class="row">
			<div class="col-4">
				<div class="d-flex flex-column bd-highlight mb-3">
                    <c:choose>
                            <c:when test="${page=='home'}">
                                <a href="<c:url value='/home'></c:url>" class="btn btn-primary mb-2" type="button">Menu</a>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/home'></c:url>" class="btn btn-light mb-2" type="button">Menu</a>
                            </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${page=='add'}">
                            <a href="<c:url value='/addTodo'></c:url>" class="btn btn-primary mb-2" type="button">Add ToDo</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/addTodo'></c:url>" class="btn btn-light mb-2" type="button">Add ToDo</a>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${page=='view'}">
                            <a href="<c:url value='/viewTodo'></c:url>" class="btn btn-primary mb-2" type="button">View ToDo</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/viewTodo'></c:url>" class="btn btn-light mb-2" type="button">View ToDo</a>
                        </c:otherwise>
                    </c:choose>
                    
				</div>
			</div>

			<div class="col-8">
                <c:if test="${page=='home'}">
					Welcome, <c:out value="${name}"></c:out> <br>
                    Home Page !

                    <c:if test="${not empty message}">
                        <div class="alert alert-success">
                            <b>
                                <c:out value="${message}"></c:out>
                            </b>
                        </div>
                    </c:if>

                </c:if>

                <c:if test="${page=='add'}">
                    <h2>ToDo</h2>

                    <form:form method="POST" action="/${appname}/saveTodo" modelAttribute="todo">
                        
                        <div class="form-group">
                            <form:input path="todoTitle" cssClass="form-control" placeholder="Title"/>
                        </div>

                        <div class="form-group">
                            <form:textarea path="todoContent" cssClass="form-control" placeholder="Content" cssStyle="height:200px;"/>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-outline-success">Add Todo</button>
                        </div>

                    </form:form>
                </c:if>

                <c:if test="${page=='view'}">

                    <c:forEach items="${list}" var="todo">
                        <div class="card mb-2">
                            <div class="card-body">
                                <h5>
                                    <c:out value="${todo.todoTitle}"></c:out>
                                </h5>
                                <p>
                                    <c:out value="${todo.todoContent}"></c:out>
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                </c:if>
			</div>
		</div>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>