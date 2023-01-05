// state
const state =  () => ({
    token: '',
    username: '',
})
// mutations
const mutations = {
    SET_TOKEN (state, token){
        state.token = token
    },
    REMOVE_TOKEN(state)
    {
        state.token = ''
    },
    SET_NAME(state, username){
        state.username = username
    },
    REMOVE_NAME(state)
    {
        state.username = ''
    },
}
// getters
const getters = {
    getToken(state) {
       return state.token;
    },
    isAuthen(state){
        return state.token !== '' 
    },
    getName(state) {
        return state.username;
    },
}
// actions
const actions = {
    setToken({commit},token){
        commit('SET_TOKEN',token)
    },
    logout({commit}){
        commit('REMOVE_TOKEN')
        commit('REMOVE_NAME')
    },
    setName({commit},username) {
        commit('SET_NAME',username)
    },
    
}

export default{
    namespace: true,
    state,
    actions,
    getters,
    mutations
}