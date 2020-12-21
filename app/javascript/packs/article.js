import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeartEvent, 
  listenActiveHeartEvent
} from 'modules/handle_heart'

const appendNewComment = (comment) => {
  $('.comments-container').prepend(
    `<div class="comment-card">
      <img src="${comment.author_image}">
      <div class="comment-card-content">
        <div class="comment-card-info-username">${comment.author_name}</div>
        <div class="comment-card-info-content">${comment.content}</div>
      </div>
    </div>`
  )
}

const handleHeartDisplay = (hasLiked) => {
  if(hasLiked) {
    $('.article-likes-active').removeClass('hidden')
  } else {
    $('.article-likes').removeClass('hidden')
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

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
  
  // コメント追加
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


  // いいね機能
  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })
  
  listenInactiveHeartEvent(articleId)
  listenActiveHeartEvent(articleId)
  

})
