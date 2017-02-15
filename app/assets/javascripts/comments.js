$(function() {
  $('.js-readMore').click(function (event) {
    event.preventDefault()
    showComment(event)
  })

  $(document).on('click', '.js-form', function() {
    event.preventDefault()
    renderReplyForm(event)
  })

  $(document).on('click', '.js-submit', function() {
    event.preventDefault()
    submitReply(event)
  })
})

function showComment(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((json) => {
      var comment = new Comment(json.id, json.body, json.user, json.comments)
      $(`#comment-id-${comment.id}`).html(comment.body)
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
  var values = $(event.srcElement.form).serialize()
  var posting = $.post(url, values)

  posting.done(function(data) {
    $(`#reply-to-${id}`).append(data);
    $('form').remove()
  })
}

function Comment(id, body, user, comments) {
  this.id = id
  this.body = body
  this.user = new User(user.id, user.username, user.email, user.image_url, user.admin, user.banned, user.age, user.location)
  this.comments = comments
}
