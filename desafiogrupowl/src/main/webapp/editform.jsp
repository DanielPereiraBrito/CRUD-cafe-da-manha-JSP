<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Editar</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</head>
<body class="container text-center">
	
	<%@page import="com.desafiogrupowl.bean.Usuario, com.desafiogrupowl.dao.UsuarioDAO"%>
	
	<%
		String id  = request.getParameter("id");
		Usuario usuario = UsuarioDAO.getUsuarioById(Integer.parseInt(id));
	%>
	
	<h1 class="text-center">Editar Usuário</h1>
	
	<form action="editusuario.jsp" method="post">
		<input type="hidden" name="id" value="<%=usuario.getId()%>"/>
		<table class="table">
			<tr>
				<td>Nome: </td>
				<td><input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="nome" value="<%=usuario.getNome()%>"/></td>
			</tr>
			<tr>
				<td>CPF: </td>
				<td><input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="cpf" value="<%=usuario.getCpf()%>"/></td>
			</tr>
			<tr>
				<td>Comida: </td>
				<td><input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" name="comida" value="<%=usuario.getComida()%>"/></td>
			</tr>
			</table>
			<button type="submit" value="Editar Usuário" class="btn btn-success">Editar usuário</button> <a href="index.jsp"><button type="button" value="Voltar" class="btn btn-primary">Voltar</button></a>
			
		
	</form>
</body>
</html>