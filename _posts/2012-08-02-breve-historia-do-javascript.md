---
title: Breve história do Javascript
date: 2012-08-02 21:00:00 -03:00
categories:
- JavaScript
tags:
- Java,
- JavaScript,
- Sun,
- Netscape,
- história
codigoTexto: 75
excerpt: 'JavaScript é a linguagem mais popular entre os desenvolvedores da web de
  hoje... Inicialmente com o nome de Cmm (C menos menos)... muda novamente para JavaScript,
  pegando uma carona...

'
img: "/imagens/promptIn-Javascript.jpg"
---

{% highlight javascript %}
var person = prompt("Enter your name", "Name");

if (person != null) {
  document.getElementById("demo").innerHTML = "Hello " + person + "! How are you today?";
}
{% endhighlight %}

<div class="horizontal center">
  <img src="http://www.javascripter.net/faq/prompt.gif" alt="Prompt javascript">
</div>

JavaScript é a linguagem de programação mais popular entre os desenvolvedores da web de hoje. Sua origem, porém, não foi nos estúdios de criação de web sites. Inicialmente com o nome de <b>Cmm (C menos menos)</b>, pretendia ser semelhante ao C/C++ para facilitar a aprendizagem dos programadores da época. Sua criadora, Nombas, mais tarde conhecida como OpenWave, criou um ambiente de desenvolvimento chamado CEnvi, provavelmente a abreviação de C Environment (Ambiente C) para apresentar a linguagem a programadores comuns.

<div class="horizontal center" style="background-color:#97cb2a;">
  <div>
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWEAAACPCAMAAAAcGJqjAAAAclBMVEWXyyr///+RyAzj8NCVyiGy2GzE4Y6WyiX7/febzSuPxwCVyiP1+umfzzj9/vqj0EnA34ah0ECp1FnK5Jz4+/Ds9dvw9+Ha7MDY67rl8c3v996azTPN5aG53Hir1Fzh8MXW6rC323bN5p+x12e83YHS6Kl7HWlCAAAE/0lEQVR4nO2dbXPaMBCEYyFigoMNGLuAm1fa//8XS4a2ke/kQIcq3svs89UQNjv2+XQ6STc3hBBCCCGEEEIIIYQQLHLvXUAxth5BEYrzPh9bz79ytLea1tvJO49YFhePgbZtPa2Mmey6ZVNmPaZ+bFE9/LQvr2yWnRtb1MUUvt5kEnCHj2zqAus5G8RXrVJvweEs26+wRA7g12VEvAmHs3KNpTLKgME2HLZgcb7QIdiQw9lmgZ5SuKe4cisOZ9/AMwp/GBBuxuHsgCVU4ifmHZ5gCRUU6yHddhzO1shZsXv+Ag4/I0diHxtrWHO4xVLaoxjIhW05XAKHCf8SlbzZt+0errb2Jiqeu79g3Qwh/jWi93ndja1rkG4de3HUuA67rVI7O7gCd5SUe3eYKc1b3Feda5RasPCriQTkBthhlUo84Yr9gx7nt7iidbL2iH4LH0U/KodxRef3Quv92IouQqmGfXHkK6l1h/u8veN20uEVqsX5SuaX3004/F2o3sA6rId0D7gR7R3/IFTP1nYcBhvIxSnkqw532KxTywr1ZgjJKykbNonXZQnYgBaSr+w4/ENKhZ9WfCNfSNk/YB1eCqWbzoTDnUyBlrAO3yqHx5Z0EcrhW1SHVWLZjq3oQuRgHzaNV7N0ewtB4hgm9kL3T1iHZZWqQc0r+xSy6ApbEVQO71DjWR8vCxOwDs9lPLPqcDsfW9IAymHYe6GPevZgHVblYfQuu9+4b0I3bIHYS4eBpxRD1ATuPWh00+Vh4GnxEF8L3agFYjqcGl0ehh3f91H1FNQCsS4PA7cnhahJDtQubV28tOLwixQOWr50P6VQ0IdNovvKQQsTuqfKRAE+NsmB2VelX3SbsSVdjEyCMF91uvHSSFkiUpgAHCvlXiWVwIVsiZo6eEvlkXZD8L5bPUSWeYHm7RodiLNs8rDqPMhD6J6aNrZ+A3thWo/oMsCybUCKg3NZ8PmNgc7WP+gO1xP3GGXMAYeNlC5PqAKmAYeBG8lj6PZ9dIdbZ+U1dyKPWgzs8PPclsFHi+eRhV+wDj9VtkLECVepNTOgDu/c3E4WEeLncsEBqMO8h/83jMOpYS6RGubDqeGYLjWsS6RmqLZmYkHoCfDa2o0vvmh9uAB6CjnH8Qlwni41nGtODvslUsOen9Swby017L1MDfuHU8Me+NTQ4eRwLVJquJ4uNVwTmhqua04N1+anhvtLpIZ7pKSG+/ykhntVpYb7raWGewamhvtepoZ7t6aG+w+nhntop4b7wKeGZxkkh+dxpIZnyqTmunORvOS/Xf1YtKVzka4722t5KwirGgt5dbkIrnbyq8uLf9XY2V7XnE93p74bjLn1qCAczehxb3Z30W/mhbHz6a46Y/FO/as9h+XV2YcOzy5zOH7G4ituHL7qnNDPddjoOaFXnXX7uQ4bPev2qvOaYRwGTtauO3McxmHoM8d1r7NBh5GDxMDCNFsOg2+x5Q/mHQbtzv6LHoMacxi+mzFfxHNMKw5v8Cdv/UBObMPhcg0eI94YsNiEwyYMPoqvYuMOCw7vVyYMPmbFvtbBGN/hTV1AZ8I9XLdsRKw477AKLj2H5dXyQ4fLf3W4bJYdehbRI/e+mtbbyTvna2u7SZ8mqHrmK3l1F05Xdo28er62Fnx6W08rwN0OznE02QWcfwCdpPfX1NX84u9GKcJPG7SXEEIIIYQQQgghhJAvzy8/VFfKM+CqkQAAAABJRU5ErkJggg==" alt="código e reticências">
  </div>
</div>

Depois de alguns anos, já com o nome mudado para <b>ScriptEase</b>, passou a atrair o interesse da Netscape, para criar programas para o seu navegador de mesmo nome, que pudessem rodar no computador do usuário antes de enviar informações para o servidor, o que foi um marco da tecnologia por ser a primeira linguagem a funcionar no modo cliente (na máquina local, em vez do servidor web). Seria solucionado então um grave problema de tráfego na internet: a validação de formulários sem a necessidade do envio dos dados para o servidor web.

No lançamento do Netscape Navigator 2, em 1995, a Netscape, em parceria com a Sun Microsystems, finalizou o novo projeto, agora com o nome <b>LiveScript</b> ou <b>LiveWire</b>, com a intenção de permitir que a linguagem rode tanto no cliente como no servidor. O nome da linguagem muda novamente em seguida para <b>JavaScript</b>, pegando uma carona na popularidade do Java, em ascenção na época, e criando uma confusão de nomes que desde então permite a muitos escritores ganharem dinheiro fazendo livros para explicar que JavaScript não é o mesmo que Java.

### Saiba mais:



- <b>JavaScript – Wikipédia, a enciclopédia livre</b><br> 
<a href="http://pt.wikipedia.org/wiki/JavaScript" target="_blank" title="Abrir link externo em uma nova janela ou aba.">http://pt.wikipedia.org/wiki/JavaScript</a>

- <b>W3C JavaScript Tutorial</b><br> 
<a href="http://www.w3schools.com/js/" target="_blank" title="Abrir link externo em uma nova janela ou aba.">http://www.w3schools.com/js/</a>

- <b>Arquivo para JavaScript no Tableless</b><br> 
<a href="http://tableless.com.br/code/javascript/" target="_blank" title="Abrir link externo em uma nova janela ou aba.">http://tableless.com.br/code/javascript/</a>
