---
title: Detecção de Recursos com JS Design Patterns
tags:
  - JavaScript
  - padrões
  - design
categories:
  - JavaScript
img: null
excerpt: |-
  Um mergulho profundo na detecção de recursos no navegador usando padrões de design em JavaScript.
  Aprenda como otimizar a detecção de recursos, tornar seu código mais organizado e melhorar a manutenção e expansão futura.
---

![Ilustração de uma estrutura de software. Um padrão de formas hexagonais rodeado de termos relacionados.](/img/blog/software-hive-structure.jpg)

## Explorando a Detecção de Recursos no Navegador com Padrões de Design em JavaScript

Olá, caro leitor! Hoje, vamos mergulhar no fascinante mundo da detecção de recursos no navegador e como podemos otimizá-la usando Padrões de Design em JavaScript. Essas técnicas não só tornam nosso código mais organizado, mas também facilitam a manutenção e a expansão no futuro.

## O Poder da Detecção de Recursos no Navegador

Durante a leitura deste [artigo sobre a API View Transitions](https://www.smashingmagazine.com/2023/12/view-transitions-api-ui-animations-part1/), me deparei com o seguinte trecho de código, que verifica o suporte da API pelo navegador para decidir se pode ser utilizada:

```javascript
if (!document.startViewTransition) {
  // Fallback if View Transitions API is not supported.
  moveImageToModal(image);
} else {
  // Start transition with the View Transitions API.
  document.startViewTransition(() => moveImageToModal(image));
}
```

Esse cenário despertou minha curiosidade sobre a possibilidade de implementar isso como um padrão, tornando o desenvolvimento mais eficiente em larga escala. Quando lidamos com diferentes navegadores e ambientes, é crucial saber quais recursos estão disponíveis para oferecer a melhor experiência ao usuário. Vamos começar nossa jornada explorando como detectar esses recursos de maneira eficiente.

## Strategy Pattern para Transições de Visualização

O primeiro padrão que aplicamos é o Strategy Pattern. Este padrão nos permite definir uma família de algoritmos, encapsulá-los e torná-los intercambiáveis. No nosso contexto, estamos usando isso para lidar com diferentes estratégias de transição de visualização.

```javascript
class NoTransitionStrategy {
  startTransition(callback) {
    moveImageToModal(callback);
  }
}

class ViewTransitionStrategy {
  startTransition(callback) {
    document.startViewTransition(callback);
  }
}
```

## Feature Detection Simplificada com um Hub

Para tornar nosso código mais limpo e organizado, criamos um hub central para a detecção de recursos.

```javascript
class FeatureDetectionHub {
  static supportsViewTransitions() {
    return Boolean(document.startViewTransition);
  }
}
```

## Controller Pattern para Coordenação

Em seguida, aplicamos o Controller Pattern para coordenar a detecção de recursos e a escolha da estratégia.

```javascript
class ImageTransitionController {
  constructor() {
    this.setTransitionStrategy();
  }

  setTransitionStrategy() {
    if (FeatureDetectionHub.supportsViewTransitions()) {
      this.transitionStrategy = new ViewTransitionStrategy();
    } else {
      this.transitionStrategy = new NoTransitionStrategy();
    }
  }

  performImageTransition(image) {
    this.transitionStrategy.startTransition(() => moveImageToModal(image));
  }
}
```

## Exemplo de Uso Prático

Agora, veja como é fácil usar nossa implementação em um cenário real.

```javascript
const imageTransitionController = new ImageTransitionController();

// Move a imagem do contêiner da grade para a sobreposição.
imageTransitionController.performImageTransition(image);
```

## Conclusão

Espero que este mergulho nos Padrões de Design em JavaScript para detecção de recursos no navegador tenha sido útil e esclarecedor.
