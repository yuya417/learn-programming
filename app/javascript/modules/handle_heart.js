import $ from 'jquery'
import axios from 'modules/axios'

const listenInactiveHeartEvent = (articleId) => {
  $('.article-likes').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if(response.data.status == 'ok') {
          $('.article-likes').addClass('hidden')
          $('.article-likes-active').removeClass('hidden')
        }
      })
      .catch((error) => {
        window.alert('いいねをするのに失敗しました')
      })
  })
}

const listenActiveHeartEvent = (articleId) => {
  $('.article-likes-active').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if(response.data.status == 'ok') {
          $('.article-likes').removeClass('hidden')
          $('.article-likes-active').addClass('hidden')
        }
      })
      .catch((error) => {
        window.alert('いいねを解除するのに失敗しました')
      })
  })
}

export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}