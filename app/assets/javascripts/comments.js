$(function() {
  $("time.timeago").timeago()
  $('.js-readMore').click(function (event) {
    event.preventDefault()
    showComment(event)
  })

  $(document).on('click', '.js-form', function() {
    event.preventDefault()
    renderForm(event)
  })

  $(document).on('click', '.js-submit', function() {
    event.preventDefault()
    submitReply(event)
  })

  $(document).on('click', '.js-update', function() {
    event.preventDefault()
    submitUpdate(event)
  })

  $(document).on('click', '.js-reply', function() {
    event.preventDefault()
    renderReplies(event)
  })
})

function renderReplies(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((comments) => {
      $.each(comments, (index, protoComment) => {
        var comment = new Comment(protoComment.id, protoComment.body, protoComment.user, protoComment.comments, protoComment.created_at)
        var renderedComment = comment.formatComment()
        $(event.target.parentElement).append(renderedComment)
      })
      $("time.timeago").timeago()
      $(event.target).remove()
    })
}

function showComment(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((json) => {
      var comment = new Comment(json.id, json.body, json.user, json.comments, json.created_at)
      $(`#comment-id-${comment.id}`).html(comment.body)
    })
}

function renderForm(event) {
  $.get(event.target.href, function(data) {
    $('#comment-' + $(event.target).data('id')).html(data)
  })
}

function submitReply(event) {
  var url = event.srcElement.form.action
  var id = $(event.target).data('id')
  var values = $(event.srcElement.form).serialize()
  var posting = $.post(url, values)

  posting.done(function(protoComment) {
    debugger
    var comment = new Comment(protoComment.id, protoComment.body, protoComment.user, protoComment.comments, protoComment.created_at)
    var renderedComment = comment.formatComment()
    $(`#reply-to-${id}`).append(renderedComment);
    $('form').remove()
  })
}

function submitUpdate(event) {
  var url = event.srcElement.form.action
  var id = $(event.target).data('id')
  var values = $(event.srcElement.form).serialize()
  var posting = $.post(url, values);

  posting.done(function(json) {
    var comment = new Comment(json.id, json.body, json.user, json.comments, json.created_at)
    $(`#body-${id}`).html(comment.body);
    $('form').remove()
  })
}

function Comment(id, body, user, comments, created_at) {
  this.id = id
  this.body = body
  this.user = new User(user.id, user.username, user.email, user.image_url, user.admin, user.banned, user.age, user.location)
  this.comments = comments
  this.created_at = created_at
}

Comment.ready = function(){
  Comment.templateSource = $("#reply-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource);
}

Comment.prototype.formatComment = function() {
  return Comment.template(this)
}

$(function(){
  Comment.ready()

})
