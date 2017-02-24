$(function() {
  $("time.timeago").timeago()
  $('.js-readMore').click(function(event) {
    event.preventDefault();
    showComment(event);
  })

  $(document).on('click', '.js-form', function() {
    event.preventDefault();
    renderForm(event);
  })

  $(document).on('click', '.js-submit', function() {
    event.preventDefault();
    submitReply(event);
  })

  $(document).on('click', '.js-update', function() {
    event.preventDefault();
    submitUpdate(event);
  })

  $(document).on('click', '.js-reply', function() {

    event.preventDefault();
    renderReplies(event);
  })
})

function renderReplies(event) {
  fetch(event.target.href)
    .then(res => res.json())
    .then((comments) => {
      $.each(comments, (index, protoComment) => {
        var comment = new Comment(protoComment)
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
      var comment = new Comment(json)
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
    var comment = new Comment(protoComment)
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
    var comment = new Comment(json)
    $(`#body-${id}`).html(comment.body);
    $('form').remove()
  })
}

function Comment(attributes) {
  this.id = attributes.id
  this.body = attributes.body
  this.user = new User(attributes.user)
  this.comments = attributes.comments
  this.created_at = attributes.created_at
}


Comment.prototype.formatComment = function() {
  Comment.templateSource = $("#reply-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource);
  return Comment.template(this)
}

Handlebars.registerHelper('if_eq', function(a, b, opts) {
    if (a == b) {
        return opts.fn(this);
    } else {
        return opts.inverse(this);
    }
});
