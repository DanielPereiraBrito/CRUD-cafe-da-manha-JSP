<%@ page import="com.desafiogrupowl.dao.UsuarioDAO"%>
<jsp:useBean id="u" class="com.desafiogrupowl.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UsuarioDAO.updateUsuario(u);
	response.sendRedirect("index.jsp");
%>