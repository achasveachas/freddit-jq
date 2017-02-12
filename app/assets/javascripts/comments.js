function showComment(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((json) => {
      $(`#comment-id-${json.id}`).html(json.body)
    })
}

function renderReply(event) {
  $.get(event.target.href, function(data) {
    $('#comment-' + $(event.target).data('id')).html(data)
  })
}
