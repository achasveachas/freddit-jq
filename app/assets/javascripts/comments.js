$(function() {
  $('.js-readMore').click(function (event) {
    event.preventDefault()
    showComment(event)
  })

  $('.js-reply').click(function (event) {
    event.preventDefault()
    renderReplyForm(event)
  })

  $(document).on('click', '.js-submit', function() {
    submitReply(event)
  })
})

function showComment(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((json) => {
      $(`#comment-id-${json.id}`).html(json.body)
    })
}

function renderReplyForm(event) {
  $.get(event.target.href, function(data) {
    $('#comment-' + $(event.target).data('id')).html(data)
  })
}

function submitReply(event) {
  var url = event.srcElement.form.action
  var id = $(event.target).data('id')
  var data = $(event.srcElement.form).serialize()
  
}
