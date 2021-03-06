<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ResourceBundle"
	%>
<% ResourceBundle bundle = (ResourceBundle)session.getAttribute("linguagem");%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%=bundle.getString("comprarPassagem.titulo")%></title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('input[type="radio"]').click(function(){
		if($("#linguagem").val() == "1"){
			$("#entrar").val("Entrar");
			$("#entrar").css("display", "inherit");
		}else if($("#linguagem").val() == "2"){
			$("#entrar").val("Sing in");
			$("#entrar").css("display", "inherit");
		}else{
			$("#entrar").css("display", "none");
			alert("PortuguÍs: Escolha um idioma \nEnglish: Choose a language.");
		}
	});
});
</script>
	
</head>
<body>
	<div style="margin: auto; width: 940px; height: 350px; display: table;">
		<jsp:include page="header.jsp"></jsp:include>
		<form action="fecharCompra" method="post">
		
		<fieldset style="border: 1px;border-radius: 10px;border-style: solid; width: 400px; min-height: 150px; margin: auto; margin-top: 100px;">
			<legend style="color: red;"><%=bundle.getString("comprarPassagem.titulo")%></legend>
			
				<table>
					<tr>					
						<td style='text-align: center;' colspan="3"><%=request.getAttribute("mensagem") %></td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.forma.pag")%></td>
							<td>:</td>
						<td>
							<input class="email" type="radio" name='tipoPagamento' value="carCredito" id='tipoPagamento' /> <%=bundle.getString("forma.pagamento.cartao")%>
							&nbsp;&nbsp;&nbsp;
							<input class="email" type="radio" name='tipoPagamento' value="cheque" id='tipoPagamento' /><%=bundle.getString("forma.pagamento.cheque")%>
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'>&nbsp;</td>
							<td>&nbsp;</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.email")%></td>
							<td>:</td>
						<td>
							<input class="email" type='text'name='email' id='email' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.telefone")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='celular' id='celular' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.tipo.cartao")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='bandeira' id='bandeira' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.nome.titular")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='nomeTitular' id='nomeTitular' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.cpf")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='cpf' id='cpf' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.numero.cartao")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='numCartao' id='numCartao' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.data.validade")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='dataValidade' id='dataValidade' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.cod.seguranca")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='codigoSeguranca' id='codigoSeguranca' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.banco")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='banco' id='banco' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.agencia")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='agencia' id='agencia' />
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.conta")%></td>
							<td>:</td>
						<td>
							<input class="celular" type='text'name='conta' id='conta' />
						</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
				</table>
				
				<input type="hidden" name='operacao' value="cadastrar_resposavel" >
				<input type='submit' value=<%out.print(bundle.getString("cadastrar"));%> style="margin-left: 150px; margin-top: 10px;">
		</fieldset>
		</form>
	</div>
	<%
		//String mensagem = (String) request.getAttribute("mensagem");
		
		//mensagem = (mensagem != null ? mensagem : ""); 
		//if(mensagem.equals("sucesso")){
		//	out.print(	"<div style='background-color: #93DB70; margin-left:auto; margin-right: auto;margin-top: 50px;width: 350px; height: 30px; text-align: center;  border-radius: 10px;'>"
		//				+"<p style='font-weight: bold; color: black; margin-top: -20px; padding-top: 5px;'>"
		//				+"Cadastro de Voo realizado com Sucesso"
		//				+"</p>"
		//				+"</div>");
		//}
	
	%>

</body>
</html>
