---
title: DIVs em círculo dinamicamente
excerpt: O código abaixo produziu um efeito legal de posicionamento em círculo, calculando o seno e cosseno dos ângulos de cada div para gerar as coordenadas ao redor de um ponto. Coloquei na seção ASP porque o código está em VBScript com ASP, mas pode ser feito
img: /imagens/div-2.png
categories: Tutoriais
tags: lógica de programação, seno, coseno, cosseno, cálculo
---

O código abaixo produziu um efeito legal de posicionamento em círculo, calculando o seno e cosseno dos ângulos de cada div para gerar as coordenadas ao redor de um ponto. O código está em VBScript com ASP, mas pode ser feito em qualquer linguagem de programação para web, como JavaScript. Para testar a formação em círculo, é só passar a quantidade de divs a ser geradas através do parâmetro "n" na URL. Por exemplo: *testecirc.asp**?n=5***

```

<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%

centroX = 400
centroY = 400
raio = 200

numPontos = Request("n")
If numPontos < 1 Then : numPontos = 1

angulo = 360 / (numPontos + 1)

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Teste de menu em círculo</title>
</head>

<body onload="document.myForm.n.select();">

<%

For i = 1 to numPontos

	x = Round(centroX + Cos(angulo * i) * raio)
	y = Round(centroY + Sin(angulo * i) * raio)

	Response.Write "<div style=""position: absolute; left: "
	Response.Write x & "px; "
	Response.Write "top: "
	Response.Write y & "px;"">"
	Response.Write i & " ° (" & x & ", " & y & ")</div>" & VbCrLf

Next

%>

	<form action="" method="get" name="myForm">

		<label for="n">Nº de pontos: </label>
		<input name="n" type="text" value="<%= numPontos %>" size="11" maxlength="11" />
		<input name="submit" type="submit" value="Testar" />

	</form>

</body>

</html>

```

As variáveis *centroX* e *centroY* servem para determinar o ponto central do círculo que será formado pelas divs. Raio é o raio do círculo em pixels.

A linha ` seja igual a 0 (zero).

Com todas as variáveis na mão, o cálculo faz a iteração entre os ângulos em que cada div vai ficar calculando as coordenadas de cada div.

Este teste serve apenas para exemplificar, pois o resultado não sai sempre como esperado, embora as coordenadas obedeçam sempre o raio que foi determinado. Experimente verificar outras fontes de consulta e aprimorar a fórmula para produzir resultados mais precisos.