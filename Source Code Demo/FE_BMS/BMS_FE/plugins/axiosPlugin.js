export default function ({ store, app: { $axios } }) {
    $axios.onRequest((config) => {
      try {
          /// Store action to get or retrieve a token if it has expired
          const token = store.getters['user/getToken']
          config.headers.common.Authorization = `Bearer ${token}`
      } catch (error) {
          console.log("Could not update token:", error)
      }
      return config
  })
  }