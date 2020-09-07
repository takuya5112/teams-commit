$(function() {
  function buildHTML(comment) {
    let html = `<p>
                  <strong>
                    <a href = /users/${comment.user_id}>${comment.user_name} :</a>
                  </strong>
                  
                  ${comment.text}
                </p> `
    return html;
  }
  $('#new-comment').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax( {
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      let html = buildHTML(data);
      $('.comments').append(html);
      $('.textBox').val('');
      $('.form-submit').prop('disabled', false);
      $('.wrapper').animate({ scrollTop: $('.wrapper')[0].scrollHeight});
    })
    .fail(function() {
      alert('error');
    })
  })
})