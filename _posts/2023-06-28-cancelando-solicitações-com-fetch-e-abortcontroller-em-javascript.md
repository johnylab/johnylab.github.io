---
title: Cancelando Solicitações com Fetch e AbortController em JavaScript
date: 2023-06-28T14:20:09.525Z
tags: []
categories: []
---

## Introdução

Neste post, vamos explorar como cancelar solicitações HTTP feitas com o Fetch e a API AbortController em JavaScript. A capacidade de cancelar solicitações é especialmente útil em situações em que você precisa interromper uma solicitação em andamento, seja por uma ação do usuário ou por outros eventos no aplicativo. Veremos como implementar isso usando JavaScript e a API Fetch, juntamente com um exemplo de um hook React personalizado que facilita o cancelamento de solicitações.

## O que é a API Fetch

A API Fetch é uma API moderna e poderosa para fazer solicitações HTTP em JavaScript. Ela fornece uma interface simples e baseada em Promise para lidar com solicitações e respostas HTTP. É suportada em todos os principais navegadores e oferece uma alternativa ao antigo XMLHttpRequest.

## A API AbortController

A API AbortController é uma parte do conjunto de recursos do JavaScript chamado "AbortController/AbortSignal". Ela permite o cancelamento de uma solicitação ou qualquer outra operação assíncrona. O AbortController é usado em conjunto com o sinal (signal) fornecido pela propriedade `signal` do Fetch para cancelar uma solicitação em andamento.

## Exemplo de Cancelamento de Solicitação

Vamos começar com um exemplo simples de como cancelar uma solicitação usando o Fetch e o AbortController:

```javascript
// Crie um novo AbortController
const controller = new AbortController();

// Obtenha o sinal (signal) do AbortController
const signal = controller.signal;

// Crie a solicitação usando o Fetch e passe o sinal (signal)
fetch('https://api.example.com/data', { signal })
  .then(response => {
    console.log(response);
  })
  .catch(err => {
    if (err.name === 'AbortError') {
      console.log('Solicitação cancelada!');
    } else {
      console.error('Ocorreu um erro na solicitação:', err);
    }
  });

// Para cancelar a solicitação, chame o método abort() do AbortController
controller.abort();
```

Neste exemplo, criamos um novo AbortController e obtemos o sinal (signal) associado a ele. Em seguida, fazemos uma solicitação usando o Fetch e passamos o sinal (signal) como uma opção. Se quisermos cancelar a solicitação posteriormente, chamamos o método `abort()` do AbortController. Isso resultará em uma exceção `AbortError` capturada no `.catch()` da Promise.

## Criando um Hook React para Cancelar Solicitações

Agora, vamos criar um hook React personalizado que encapsula a lógica de cancelamento de solicitações com o Fetch e o AbortController. Isso nos permitirá reutilizar essa funcionalidade em vários componentes. Aqui está o exemplo do hook `useFetchWithAbort`:

```javascript
import { useState, useEffect } from 'react';

const useFetchWithAbort = (url, method = 'GET', body = null) => {
  const [response, setResponse] = useState(null);
  const [error, setError] = useState(null);
  const [controller, setController] = useState(null);

 

 useEffect(() => {
    const fetchData = async () => {
      const abortController = new AbortController();
      setController(abortController);

      try {
        const fetchOptions = {
          method,
          body: body ? JSON.stringify(body) : null,
          signal: abortController.signal,
        };
        const fetchResponse = await fetch(url, fetchOptions);
        const data = await fetchResponse.json();
        setResponse(data);
      } catch (err) {
        if (err.name === 'AbortError') {
          console.log('Solicitação cancelada!');
        } else {
          setError(err);
        }
      }
    };

    fetchData();

    return () => {
      if (controller) {
        controller.abort();
      }
    };
  }, [url, method, body]);

  return [response, error, controller];
};

export default useFetchWithAbort;
```

Neste exemplo, o hook `useFetchWithAbort` é criado. Ele aceita a URL, o método (opcional, padrão é "GET") e o corpo da solicitação (opcional, padrão é `null`) como parâmetros. O hook retorna um array contendo a resposta, o erro e o controlador.

## Utilizando o Hook no Componente React

Agora, podemos utilizar o hook `useFetchWithAbort` em um componente React para realizar solicitações com a capacidade de cancelamento. Aqui está um exemplo de como usar o hook em um componente:

```javascript
import React from 'react';
import useFetchWithAbort from './useFetchWithAbort';

const MyComponent = () => {
  const [response, error, controller] = useFetchWithAbort('https://api.example.com/data');

  // Renderize o componente de acordo com a resposta e o erro
  // ...

  return (
    <div>
      <button onClick={() => controller.abort()}>Cancelar Solicitação</button>
    </div>
  );
};

export default MyComponent;
```

Neste exemplo, estamos usando o hook `useFetchWithAbort` para obter a resposta, o erro e o controlador. Em seguida, renderizamos o componente de acordo com esses valores. Também adicionamos um botão que chama `controller.abort()` para cancelar a solicitação ao ser clicado.

## Conclusão

Neste post, exploramos como cancelar solicitações HTTP feitas com Fetch e AbortController em JavaScript. Aprendemos como criar um novo AbortController, obter o sinal associado a ele e passá-lo como uma opção no Fetch para permitir o cancelamento de solicitações. Além disso, vimos como criar um hook React personalizado que encapsula essa funcionalidade, facilitando a implementação de cancelamento de solicitações em vários componentes. Com essas técnicas, você pode aprimorar a experiência do usuário e lidar com situações em que é necessário interromper uma solicitação em andamento.

Espero que este post tenha sido útil para você entender como cancelar solicitações usando Fetch e AbortController em JavaScript. Experimente essas técnicas em seus projetos e aproveite os benefícios de ter controle sobre as solicitações assíncronas.