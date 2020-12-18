import $ from 'jquery'
import axios from 'modules/axios'

const appendNewComment = (comment) => {
  $('.comments-container').prepend(
    `<div class="comment-card">
      <img src="/assets/top-page-5e2db3dee6619558ca8142ba969b1fdad2b3db6345c7c69b2a9e5b55770d941a.jpg">
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
  
    
})
