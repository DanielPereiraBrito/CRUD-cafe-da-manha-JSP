<%@ page import="com.desafiogrupowl.dao.UsuarioDAO"%>
<jsp:useBean id="u" class="com.desafiogrupowl.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<% 
	int i = UsuarioDAO.salvarUsuario(u);

	if(i > 0){
		response.sendRedirect("addUsuario-success.jsp");
	}else{
		response.sendRedirect("addusuario-erro.jsp");
	}
%>