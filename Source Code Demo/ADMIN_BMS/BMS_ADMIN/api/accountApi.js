export default{
    login(axios, data){
        return axios.$post('/api/Admin/login', data)
    }
}