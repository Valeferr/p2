<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">

<title>Aggiungi prodotto</title>
</head>
<body>


	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	
	<div id="main" class="clear">
	
		<h2>AGGIUNGI PRODOTTO</h2>

	<form action="../catalogo" method="post" id="myform">
		<input type="hidden" name="action" value="add">
		<input type="hidden" name="page" value="admin/GestioneCatalogo.jsp"><br><br>
		<div class="tableRow">
			<p>Nome:</p>
			<p><input type="text" name="nome" pattern="[\w\s^_]+" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Descrizione:</p>
			<p><input type="text" name="descrizione" pattern="[\w\s\.\,\-]+" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Iva:</p>
			<p><input type="text" name="iva" pattern="[\d%\,]+" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Prezzo:</p>
			<p><input type="text" name="prezzo" pattern="[\d\.]+" value="" required></p>
		</div>		
		<div class="tableRow">
			<p>Data:</p>
			<p><input type="date" name="dataUscita" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Quantità:</p>
			<p><input type="number" name="quantità" pattern="[\d]+" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Immagine:</p>
			<p><input type="text" name="img"  pattern="[^\>]+"value="" required></p>
		</div>
		<div class="tableRow">
			<p>Piattaforma:</p>
			<p><input type="text" name="piattaforma" pattern="[\w\,\-\.\s]+" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Genere:</p>
			<p><input type="text" name="genere" pattern="[\w\,\s\-]+" value="" required></p>
		</div>
		<div class="tableRow">	
			<p>Descrizione dettagliata:</p>
			<p><input type="text" name="descDett" pattern="[\w\s\.\,\-]+" value=""></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p><input type="submit" value="aggiungi"></p>
		</div>
	</form>
	
	</div>

	<%@ include file="../fragments/footer.jsp" %>

</body>
</html>