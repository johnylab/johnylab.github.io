---
---

submitted = false

conFormContent = '
    <div data-grid="spacing">
        <div data-cell="1of2 fill">
            <p>
                <label for="entry.2005820982">Seu nome</label>
                <input name="entry.2005820982" type="text" required placeholder="Como deseja que eu te chame?">
            </p>
            <p>
                <label for="entry.164767440">E-mail</label>
                <input name="entry.164767440" type="email" required placeholder="nome@dominio.com">
            </p>
        </div>
        <div data-cell="1of2 fill">
            <p>
                <label for="entry.217077662">Mensagem</label>
                <textarea name="entry.217077662" cols="30" rows="5" placeholder="Deixe sua mensagem..."></textarea>
            </p>
        </div>
    </div>
    <footer data-grid="row nowrap spacing center justify">
        <a href="#x" data-cell="shrink" class="icon ui" title="Fechar formulário">FECHAR</a>
        <button data-cell="shrink">ENVIAR</button>
    </footer>
    '

$el = (type, attrs) ->
    el = document.createElement type
    if attrs
        for name, val of attrs
            el[name] = val
    el

targetFrame = $el 'iframe', {
        name: "hidden_iframe"
        id: "hidden_iframe"
        style: "display:none;"
    }

targetFrame.addEventListener 'load', ->
    if submitted
        ga 'send', 'event', 'Contato', 'Mensagem enviada', 'Form de contato'
        window.location = '{{ site.baseurl }}/contato_enviado.html'

conForm = $el 'form', {
        action: "https://docs.google.com/forms/d/e/1FAIpQLSffp0CMGcihOckHujL_H1-Knn1J4rXuhXjGFzxEytjocoo9NQ/formResponse"
        method: "post"
        id: "formContato"
        target: "hidden_iframe"
        innerHTML: conFormContent
    }

conForm.addEventListener 'submit', -> submitted = true

conForm.appendChild targetFrame

document.querySelector('#contato .wrapper').appendChild conForm