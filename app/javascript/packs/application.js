// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common[ 'X-CSRF-Token' ] = csrfToken()

const appendNewComment = (comment) => {
  $('.comments-container').prepend(
    `<div class="comment-card">
      <img src="http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d017ca34d3960653044e6f4172a2b9551d7f2fd5/mamechi1110003_TP_V.jpg">
      <div class="comment-card-content">
        <div class="comment-card-info-username">${comment.author_name}</div>
        <div class="comment-card-info-content">${comment.content}</div>
      </div>
    </div>`
  )
}

const appendCommentCount = (commentCount) => {
  $('.comment-count').append(
    `<p class="comment-count-number">${commentCount}件のコメント</p>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  // コメント数表示
  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const commentCount = response.data.length
      appendCommentCount(commentCount)
    })

  // コメント表示
  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })
    .catch((error) => {
      window.alert('失敗しました')
    })
    
    $('.comment-form-btn').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/articles/${articleId}/comments`, {
          comment: {content: content}
        })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)
          $('#comment_content').val('')
        })
      }
    })

})
