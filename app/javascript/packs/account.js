import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('.profile').data()
  const accountId = dataset.accountId
  const data = $('.profile-card').data()
  const myId = data.myId

  axios.get(`/accounts/${accountId}/follows/${myId}`)
    .then((response) => {
      if(response.data.followStatus === true ) {
        $('.follow-btn').addClass('hidden')
        $('.unfollow-btn').removeClass('hidden')
      } else {
        $('.follow-btn').removeClass('hidden')
        $('.unfollow-btn').addClass('hidden')
      }
    })
    .catch((e) => {
      window.alert('Error')
      console.log(e)
    })

  // axios.get(`/accounts/${accountId}/unfollows/${myId}`)
  //   .then((response) => {
  //     if(response.data.followStatus === true ) {
  //       $('.follow-btn').addClass('hidden')
  //       $('.unfollow-btn').removeClass('hidden')
  //     } else {
  //       $('.follow-btn').removeClass('hidden')
  //       $('.unfollow-btn').addClass('hidden')
  //     }
  //   })
  
  $('.follow-btn').on('click', () => {
    axios.post(`/accounts/${accountId}/follows`)
      .then((response) => {
        if(response.data.status === 'ok') {
          $('.follow-btn').addClass('hidden')
          $('.unfollow-btn').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.unfollow-btn').on('click', () => {
    axios.post(`/accounts/${accountId}/unfollows`)
      .then((response) => {
        if(response.data.status === 'ok' ) {
          $('.follow-btn').removeClass('hidden')
          $('.unfollow-btn').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
  
})