---
---

formContato.addEventListener 'submit', (e) ->
    e.preventDefault()
    postBody = ""
    Array.prototype.slice.call(this.elements)
        .filter (el) ->
            el.value and el.value != ""
        .forEach (el, i, arr) ->
            postBody += el.name + "=" + encodeURI(el.value)
            postBody += "&" if i < arr.length - 1
    fetch this.action,
            method: "POST"
            headers:
                "Content-Type": "application/x-www-form-urlencoded"
            body: postBody
        .then (res) ->
            console.log res

# <iframe src="https://docs.google.com/forms/d/e/1FAIpQLSffp0CMGcihOckHujL_H1-Knn1J4rXuhXjGFzxEytjocoo9NQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Carregando…</iframe>

# fetch("http://www.example.org/submit.php", {
#   method: "POST",
#   headers: {
#     "Content-Type": "application/x-www-form-urlencoded"
#   },
#   body: "firstName=Nikhil&favColor=blue&password=easytoguess"
# }).then(function(res) {
#   if (res.ok) {
#     alert("Perfect! Your settings are saved.");
#   } else if (res.status == 401) {
#     alert("Oops! You are not authorized.");
#   }
# }, function(e) {
#   alert("Error submitting form!");
# });