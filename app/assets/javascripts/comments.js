function showComment(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((json) => {
      $(`#comment-id-${json.id}`).html(json.body)
    })
}
