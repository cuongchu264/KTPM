export default{
    login(axios,data){
        return axios.$post('/api/Account/login',data)
    }
}