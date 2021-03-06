<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import='to.*'
	import="java.util.ArrayList"
 	import="java.util.ResourceBundle"
%>
<% ResourceBundle bundle = (ResourceBundle)session.getAttribute("linguagem");%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><%out.print(bundle.getString("btn.escolheVoo"));%></title>
</head>
<body>
		<div style="margin: auto; width: 940px; height: 350px; display: table;">
			<jsp:include page="header.jsp"></jsp:include>
			
			<fieldset style="border: 1px solid black; border-radius: 10px; width: 600px; min-height: 150px; margin: auto; margin-top: 100px;">
				<legend style="color: red;">Consulta de V�os</legend>
				
				<div id="resultadoPesquisa" style='margin-top: 10px;'>
				
				
					<%
						//Pega a Sess�o
						HttpSession sessao = request.getSession();
						
						//Trabalha no Titulo da Pagina
						if(sessao.getAttribute("opcao").equals("ida")){
							out.print("<h3>Escolha o V�o</h3>");
							
						}
						else if(sessao.getAttribute("opcao").equals("idaVolta")){
							if(sessao.getAttribute("voo").equals("ida")){
								out.print("<h3>Escolha o V�o - Ida</h3>");
							}
							else if(sessao.getAttribute("voo").equals("volta")){
								out.print("<h3>Escolha o V�o - Volta</h3>");
							}
						}
						
						//Pega o ArrayList que foi passado pelo controle
						ArrayList<VooTO> lista = (ArrayList<VooTO>) sessao.getAttribute("lista");
						
						//Formata todas as informa��es da lista item por item
						out.print("<table style='margin-left: auto;margin-right: auto; width: 580px; border: 1px solid black;'>");
						out.print("<tr style='font-weight: bold;background-color: #000000; color: white; text-align: center;'>"
								  +"\n	<td>" + (bundle.getString("lblCodigo")) + "</td>"
								  +"\n	<td>" + (bundle.getString("voo.lblorigem")) + "</td>"
								  +"\n	<td>" + (bundle.getString("voo.lbldestino")) + "</td>"
								  +"\n	<td>" + (bundle.getString("voo.lbldata")) + "</td>"
								  +"\n	<td>" + (bundle.getString("voo.lblhora")) + "</td>"
								  +"\n  <td>" + (bundle.getString("voo.lblvalor")) + "</td>"
								  +"\n	<td>" + (bundle.getString("tela.header.comprar")) + "</td>"
								  +"\n</tr>");
						
						//Variavel de Cor
						int g = 1;
						
						for(VooTO vooTO : lista){
							
							if(sessao.getAttribute("voo").equals("volta")){
								
								String codigoVooIda = sessao.getAttribute("codigoVooIda").toString();
								
								if(vooTO.getCodigo() == Integer.parseInt(codigoVooIda)){
									
								}
								else{
									out.print("\n<tr style='background-color: ");
									if(g==1){
										out.print("#A9A9A9;");
										g=0;
									}
									else{
										out.print("#D3D3D3;");
										g=1;
									}
						   			out.print("'>"
									+"\n	<td style='text-align: center;'>"
									+"\n		" + vooTO.getCodigo()
									+"\n	</td>"
									+"\n	<td style='padding-left: 5px;text-align: center;'>"
									+"\n		"+ vooTO.getOrigem()
									+"\n	</td>"
									+"\n	<td style='padding-left: 5px;text-align: center;'>"
									+"\n		" + vooTO.getDestino()
									+"\n	</td>"
									+"\n	<td style='text-align: center;'>"
									+"\n		" + vooTO.getData()
									+"\n	</td>"
									+"\n	<td style='text-align: center;'>"
									+"\n		" + vooTO.getHora()
									+"\n	</td>"
									+"\n	<td style='text-align: center;'>"
									+"\n		R$ " + vooTO.getValor()
									+"\n	</td>"
									+"\n	<td style='text-align: center;'>"
									+"\n		<a href='ControlePassagem?");
									if(sessao.getAttribute("opcao").equals("ida")){
										out.print("operacao=cadastroPassageiro");
									}
									else{
										if(sessao.getAttribute("voo").equals("ida")){
											out.print("operacao=escolhaVolta");
										}
										else if(sessao.getAttribute("voo").equals("volta")){
											out.print("operacao=cadastroPassageiro");
										}
									}
									
									out.print("&codigoVoo="+vooTO.getCodigo()+"'>Comprar</a>"
									+"\n	</td>"
									+"\n</tr>"									
									);
								}
								
							}
							else{
								out.print("\n<tr style='background-color: ");
								if(g==1){
									out.print("#A9A9A9;");
									g=0;
								}
								else{
									out.print("#D3D3D3;");
									g=1;
								}
					   	out.print("'>"
								+"\n	<td style='text-align: center;'>"
								+"\n		" + vooTO.getCodigo()
								+"\n	</td>"
								+"\n	<td style='padding-left: 5px;text-align: center;'>"
								+"\n		"+ vooTO.getOrigem()
								+"\n	</td>"
								+"\n	<td style='padding-left: 5px;text-align: center;'>"
								+"\n		" + vooTO.getDestino()
								+"\n	</td>"
								+"\n	<td style='text-align: center;'>"
								+"\n		" + vooTO.getData()
								+"\n	</td>"
								+"\n	<td style='text-align: center;'>"
								+"\n		" + vooTO.getHora()
								+"\n	</td>"
								+"\n	<td style='text-align: center;'>"
								+"\n		R$ " + vooTO.getValor()
								+"\n	</td>"
								+"\n	<td style='text-align: center;'>"
								+"\n		<a href='ControlePassagem?");
								if(sessao.getAttribute("opcao").equals("ida")){
									out.print("operacao=cadastroPassageiro");
								}
								else{
									if(sessao.getAttribute("voo").equals("ida")){
										out.print("operacao=escolhaVolta");
									}
									else if(sessao.getAttribute("voo").equals("volta")){
										out.print("operacao=cadastroPassageiro");
									}
								}
								
						out.print("&codigoVoo="+vooTO.getCodigo()+"'>Comprar</a>"
								+"\n	</td>"
								+"\n</tr>"									
								);
							}
							
						}
					
						out.print("\n</table>");
					%>
					<br>
				</div>
			</fieldset>
		</div>	

</body>
</html>