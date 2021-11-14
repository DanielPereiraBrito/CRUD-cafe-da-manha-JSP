<%@page import="com.desafiogrupowl.dao.UsuarioDAO" %>
<jsp:useBean id="u" class="com.desafiogrupowl.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i = UsuarioDAO.deletarUsuario(u);

	if(i > 0){
		response.sendRedirect("deleteUsuario-success.jsp");
	}else{
		response.sendRedirect("deleteUsuario-erro.jsp");
	}
	
%>