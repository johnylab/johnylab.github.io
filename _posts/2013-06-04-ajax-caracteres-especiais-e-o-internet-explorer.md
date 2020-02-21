---
title: AJAX, caracteres especiais e o Internet Explorer
date: 2013-06-04 21:00:00 -03:00
categories:
- JavaScript
tags:
- JavaScript,
- jQuery,
- ajax
codigoTexto: 123
excerpt: 'Um problema recorrente do AJAX. Os tais caracteres que existem na nossa
  linda Língua Portuguesa, mas os falantes da Língua Inglesa nem conhecem. Acentos
  e cedilhas não aparecem ou são trocados indevidamente.

'
img: "/imagens/200px-HTML5.svg.png"
---

Todo programador de <abbr title="Asynchronous Javascript and XML (Javascript e XML Assíncronos)" lang="en">AJAX</abbr> passa por isso. Os tais caracteres que existem na nossa querida Língua Portuguesa, mas os falantes da Língua Inglesa (azar o deles!) não conhecem. Então você cria o seu objeto <abbr title="Asynchronous Javascript and XML (Javascript e XML Assíncronos)" lang="en">AJAX</abbr>, limpíssimo e escalonável, e chama o arquivo externo:


{% highlight javascript %}

var ajaxObj = function() {
    if (window.ActiveXObject) return new ActiveXObject('Microsoft.XMLHTTP');
    else if (window.XMLHttpRequest) return new XMLHttpRequest();
  };

function requisicaoAjax(urlArquivoExterno) {
  var ajax = ajaxObj();
  if (ajax !== null) {
    ajax.open('GET', urlArquivoExterno, false);

    // Quando o resultado for carregado...
    ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {

        // Exibe o conteúdo carregado.
        // Esse é o ponto em que você faz alguma coisa_
        // com os dados carregados.
        alert(ajax.responseText);

      }
    };

    ajax.send(null);

  }
}
requisicaoAjax('/meuArquivoExterno.html');

{% endhighlight %}


## Ajax com jQuery

Ah! você não faz mais assim? Usa jQuery? Desculpa aí:


{% highlight javascript %}

$.ajax({
  type: 'get',
  data: 'nome=Usuario&email=usuario@servidor.com',
  url: urlArquivoExterno,
  success: function(retorno) {

    // Exibe o conteúdo carregado.
    // Esse é o ponto em que você faz alguma coisa_
    // com os dados carregados.
    $('#resposta').html(retorno);

  }
});

{% endhighlight %}


> JQuery tem vários métodos para simplificar a chamada de uma requisição ajax. Veja a <a href="http://api.jquery.com/category/ajax/" lang="en" title="Ajax - jQuery API" target="_blank">lista completa de métodos ajax</a>.


Para fazer um campo de busca agora, basta fazer uma função no <code>&lt;input></code> que você quiser para chamar a página de resultados quando ocorrer uma alteração no campo. Simples? Nada disso. Graças à boa e velha incompatibilidade de navegadores, alguns eventos não acontecem em alguns navegadores, outros são disparados quando você não quer. Veja como eu responderia ao evento <code>change</code> do campo de busca, para retornar o resultado:


{% highlight javascript %}

var query = '';
var url = 'minhapagina.php';
var div = $('#resultados');

$('input#busca').change(function() {

  // Verificando o que foi digitado
  // no campo de busca:
  var b = $(this).val();

  // A chamada só será feita se o conteúdo do campo for editado
  if (b != query) {
    query = b;
    u = url + '?busca=' + b;

    $.get(u, function(data) {

      // Conteúdo inserido no local reservado
      div.html(data);

    });

  }
});

{% endhighlight %}


## Problemas com eventos de formulários HTML

Parece ótimo, até testarmos em diferentes navegadores:

- Nos navegadores webkit o evento só dispara quando o campo perde o foco ou pressionamos a tecla <kbd>Enter</kbd>. Beleza, "dar um Enter" já é hábito para muitas pessoas, e a maioria vai pensar nisso.
- No Internet Explorer, se o <code>&lt;input></code> estiver dentro de um <code>&lt;form></code> e você pressionar o <kbd>Enter</kbd>, ele (o formulário) vai submeter os dados (disparar o evento <code>submit</code>), causando o recarregamento da página, em vez de fazer a chamada AJAX.


Usando o método <code>.preventDefault()</code>, do objeto jQuery, evitamos que o IE faça besteira.


{% highlight javascript %}

$('#formBusca').submit( function(e){ e.preventDefault(); } );

{% endhighlight %}


Mas agora o IE não faz mais a busca. Difícil, né? Sempre ele. É por isso que eu prefiro usar, no lugar do evento <code>change</code>, o evento <code>keyup</code>, que ocorre ao soltarmos uma tecla (qualquer uma). Enquanto não houver uma alteração no campo de busca, nada acontece, evitando chamadas extras desnecessárias, e todos os navegadores vão atualizar o resultado da busca conforme o texto é digitado.

## Caracteres com acentuação em chamadas ajax

Mais uma do Internet Explorer (teimoso, hein?). Se você digitar "maçã", ele vai buscar "ma". Se digitar "mão", vai buscar "mo". Todos os navegadores padrão vão fazer a busca direitinho, menos o IE. Caso você tenha erros em outros navegadores, vamos a algumas considerações:

- As requisições AJAX são feitas sempre na faixa de caracteres <code>utf-8</code>, e isso não pode ser alterado.
- Sua página web precisa estar codificada em <code>utf-8</code>.
- O script que processa a busca e devolve o resultado precisa estar codificado em <code>utf-8</code> para receber as informações corretamente.
- A cedilha e o acento não são enviados ao servidor (hãn?).


Se você codificou corretamente todos os arquivos, e não tem um erro no seu script, fica a pergunta: por que o amigo Internet Explorer não pode fazer tudo direitinho igual a todo mundo? Ou melhor ainda, se os caracteres não vão na requisição, qual é a mágica que o Opera e o Google Chrome estão fazendo? Acontece que, se você digitar, por exemplo, <kbd>http://meusite.com/busca.php?q=é maçã</kbd> na barra de endereço do Opera e pressionar <kbd>Enter</kbd>, ele imediatamente converte para <kbd>http://meusite.com/busca.php?q=%E9%20ma%E7%E3</kbd>. E, precisando ou não, vai enviar caracteres codificados como URL (URL encode).

Aí está o segredo. Para que o IE também mande a sua string de busca corretamente, basta usar um método javascript que serve para fazer a devida conversão:


{% highlight javascript %}

$.get(u, encodeURI(q), function(data) {

   div.html( data );

});

{% endhighlight %}


Perfeito! Agora funciona corretamente e não teremos (tantos) problemas com incompatibilidades de navegadores. Pelo menos não até lançarem o IE 10, em novembro. Comentem.