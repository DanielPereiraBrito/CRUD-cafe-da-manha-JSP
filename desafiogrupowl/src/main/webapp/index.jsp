
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Lista de Usuários</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body class="container">
	<%@ page import="com.desafiogrupowl.dao.UsuarioDAO, com.desafiogrupowl.bean.Usuario, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<h1 class="text-center">Lista de Usuários</h1>
	
	<%
		
		List<Usuario> list = UsuarioDAO.getAllUsuarios();
		
		request.setAttribute("list", list);
		
	%>
	
	<table class="table text-center">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nome</th>
				<th scope="col">CPF</th>
				<th scope="col">Comida</th>
				<th scope="col">Botão</th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach items="${list}" var="usuario">
				<tr>
					<td scope="row">${usuario.getId()}</td>
					<td>${usuario.getNome()}</td>
					<td>${usuario.getCpf()}</td>
					<td>${usuario.getComida()}</td>
					<td><a href="editform.jsp?id=${usuario.getId()}" target="_parent"><button type="button" class="btn btn-primary">Editar</button></a>  
					<a href="deleteusuario.jsp?id=${usuario.getId()}" target="_parent"><button type="button" class="btn btn-danger">Excluir</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>
	
	<p class="text-center"><a href="addusuarioform.jsp" target="_parent"><button type="button" class="btn btn-success btn-lg text-center">Adicionar</button></a></p>

</body>
</html>