---
title: Como usar a função minmax() do Css Grid Layout
date: 2017-06-07 21:00:00 -03:00
categories:
  - CSS
tags:
  - CSS
  - grid
  - layout
  - responsive
excerpt: |-
  Uma nova característica muito útil apresentada com a especificação do Grid
  Layout do CSS é a função minmax(). Ela nos permite escrever um CSS muito mais poderoso
  e sucinto, configurando valores para a grade (grid track), incluindo na mesma linha
  um valor mínimo e máximo.
img: null
---

<figure class="large">
    <img src="https://www.chiefofdesign.com.br/wp-content/uploads/2017/04/CSS-Grid-Layout.png" alt="CSS Grid Layout by David Arty"><figcaption class="hero tight light"><a href="https://www.chiefofdesign.com.br/guia-introdutorio-de-css-grid-layout/">Aprenda Grid Layout</a> com o autor desta imagem, meu amigo <a href="https://facebook.com/david.diarty">David Arty</a>.</figcaption>
</figure>

Fonte: *[How the minmax() Function Works](https://bitsofco.de/how-the-minmax-function-works/)*

Uma nova característica muito útil apresentada com a [especificação do Grid Layout do CSS](https://www.w3.org/TR/css-grid-1) é a função `minmax()`. Ela nos permite escrever um CSS muito mais poderoso e sucinto, configurando valores para a grade ([grid track](https://bitsofco.de/css-grid-terminology/#gridcolumnsgridrowsandgridtracks)), incluindo na mesma linha um valor mínimo e máximo.

## A função minmax()

A função `minmax()` aceita dois parâmetros, um valor mínimo e um máximo:

{% highlight css %}

minmax(min, max)

{% endhighlight %}

Se o valor máximo definido for menor que o valor mínimo, ele é ignorado, e a função é tratada como se apresentasse apenas o valor mínimo.

A função `minmax()` aceita 6 tipos de valores:

| Tipo | Unidade de medida| Exemplos |
| --- |:---:| --- |
| Comprimento fixo | pixel | 100px, 50px |
| Porcentagem | % | 50%, 10% |
| Comprimento flexível | fr | 1fr, 2fr |
| **max-content** | - | max-content |
| **min-content** | - | min-content |
| **auto** | - | auto |

Veja exemplos de cada um:

### Comprimento fixo

Talvez o exemplo mais simples de valor usado com a função `minmax()`, já que especificar tamanhos em pixels já é comum em todas as regras de estilos que definem medidas. Considere por exemplo uma grade simples, com três colunas e apenas uma linha.

![Exemplo de grid simples, 3 colunas e 1 linha]({{ site.baseurl }}/img/blog/grid-minmax-default.png)

Usando a função `minmax()` podemos especificar que a célula amarela permaneça entre 100px e 200px. Conforme a janela é redimensionada, a valor absoluto muda, mas sempre dentro dos dois limites.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(100px, 200px) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com valores absolutos]({{ site.baseurl }}/img/blog/grid-minmax-length-1.gif)

### Porcentagem

Também podemos usar porcentagens com a função `minmax()`. Digamos que precisássemos que a mesma célula amarela tivesse o tamanho máximo de 50% da grade, mas nunca menos do que 200px.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(200px, 50%) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com porcentagens]({{ site.baseurl }}/img/blog/grid-minmax-percentage.gif)

Não importa o quanto a tela diminua, a célula amarela nunca ficará menor do que 200px. Porém, quando houver mais espaço, ela aumentará até ocupar metade da tela.

### Comprimento flexível

O tamanho flexível (fr) é uma nova unidade de medida que surgiu junto com a especificação do Grid Layout, e representa uma fração do espaço disponível dentro do container da grade. Por exemplo, considere um container de 100px com duas colunas. Uma coluna tem a largura fixa de 20px e a outra tem a largura de 1fr. A segunda coluna terá efetivamente 80px de largura, já que ela assume todo o espaço restante da grade.

Até o momento, a unidade **fr** só pode ser usada para o valor máximo na função `minmax()`. Embora esteja anotado na especificação que, no futuro, ela também poderá ser aplicada ao valor mínimo. Voltando ao exemplo prático, em que a nossa célula amarela tem a largura mínima de 200px, mas queremos que, quando a tela tive um espaço maior, ela fique com 1fr de largura, que é o mesmo tamanho das outras duas colunas.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(200px, 1fr) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com a nova unidade fr]({{ site.baseurl }}/img/blog/grid-minmax-fr.gif)

Já que todas as colunas têm 1fr em telas maiores, elas dividem o espaço da grade igualmente.

### max-content

A palavra-chave **max-content** é um valor especial que representa o "tamanho ideal" da célula. É o menor valor possível para que a célula, desde que ela se ajuste ao redor do conteúdo. Por exemplo, se o conteúdo da célula for uma sentença, a largura ideal da célula seria o comprimento da sentença inteira, sem quebras de linha, independente de qual seja este comprimento.

Voltando ao exemplo anterior, vamos especificar que a célula amarela tenha um mínimo e um máximo de **max-content**.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(max-content, max-content) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com a palavra-chave max-content]({{ site.baseurl }}/img/blog/grid-minmax-max-content.gif)

Como podemos ver, a coluna se expande para se ajustar ao tamanho do texto. Desde que ambos os valores mínimo e máximo estão configurados para **max-content**, a largura da coluna permanece sempre a mesma.

### min-content

A palavra chave **min-content**, assim como no caso anterior, é um valor especial que representa o menor valor possível que a célula pode ter sem causar um estouro (overflow) do conteúdo, a menos que seja inevitável.

Para ilustrar a diferença entre **min-content** e **max-content**, podemos usar o mesmo conteúdo do exemplo anterior, passando para a função `minmax()` o valor **min-content**.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(min-content, min-content) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com a palavra-chave min-content]({{ site.baseurl }}/img/blog/grid-minmax-min-content.gif)

Podemos definir que o conteúdo de dentro da célula seja alterado, para ocupar o mínimo espaço horizontal possível, sem causar nenhum estouro.

### auto

Finalmente, temos o valor **auto**, que tem diferentes significados, dependendo se é usado como o valor máximo ou mínimo na função `minmax()`.

Quando usado como o máximo, o valor **auto** é equivalente ao valor **max-content**. Se usado como mínimo, o valor **auto** representa o "maior tamanho mínimo" que a célula pode ter. Diferente do valor **min-content**, o resultado é especificado por **min-width/min-height**.

Para ilustrar, vamos novamente configurar a célula amarela com a função `minmax()` com o valor **auto** para o mínimo e máximo.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: minmax(auto, auto) 1fr 1fr;
}

{% endhighlight %}

![Demonstração da função minmax() com a palavra-chave auto]({{ site.baseurl }}/img/blog/grid-minmax-auto.gif)

## Usando a função minmax() para gerar design responsivo sem media queries

Como foi visto, existem muitos casos para usar a função `minmax()`. Provavelmente o uso mais popular seja a habilidade da função `minmax()` para criar designs responsivos sem a necessidade de media queries.

![Design responsivo com a função minmax()]({{ site.baseurl }}/img/blog/grid-minmax-responsive.gif)

Cada coluna da grade tem uma largura mínima de 200px. Quando a tela é redimensionada, muda o número de colunas para que elas mantenham o tamanho ideal. Com CSS Grid e a função `minmax()`, basta duas linhas de código para isso.

{% highlight css %}

.grid {
    display: grid;
    grid-template-columns: repeat( auto-fit, minmax(200px, 1fr) );
}

{% endhighlight %}

Além da função `minmax()`, existem duas outras partes importantes neste código:

- **repeat()**: Função que permite definir o mesmo valor para múltiplas colunas da grade. Aceita dois valores: o número de repetições e o valor a ser repetido.
- **auto-fit**: Palavra-chave que pode ser usada com a função `repeat()` no lugar do número de repetições. Redefine de forma flexível o número de colunas de acordo com a largura que cada coluna pode ter.

<blockquote class="horizontal">
    <div style="flex: 1 1 75%;">
        <p>Uma limitação, na minha opinião bem importante, é que isso só funciona se todas as colunas tiverem a mesma largura. Temos que usar <strong>repeat()</strong> junto com a palavra-chave <strong>auto-fit</strong>, já que é isso que permite que o número de colunas seja flexível. No entanto, esta ainda pode ser uma técnica extremamente útil em certas circunstâncias.</p>
        <p data-text="sm">Ire Aderinokun, autora do texto original <a href="https://bitsofco.de/how-the-minmax-function-works/">How the minmax() Function Works</a></p>
    </div>
    <div style="flex: 0 1 25%;"><img src="{{ site.baseurl }}/img/blog/Ire-Aderinokun.png" alt="Avatar: Ire Aderinokun"></div>
</blockquote>
