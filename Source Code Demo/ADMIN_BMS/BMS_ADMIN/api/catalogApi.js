export default{
    getCategories(axios){
        return axios.get('/api/Categories')
    },
    
    getProductsviaCategoryId(axios, cateid, ps, cp){
        return axios.get('/api/Products/viaCategoryId?CategoryId='+ cateid +'&page_size='+ ps +'&current_page=' + cp)
    },

    getHotProductsviaCategoryId(axios, CateId){
        return axios.get('/api/HotProducts/viaCateId?CategoryId='+CateId)
    },

    getCarousel(axios)
    {
        return axios.get('/api/Carousels')
    },

    getNew(axios)
    {
        return axios.get('/api/News')
    },

    getNewCate(axios)
    {
        return axios.get('/api/NewsCategories')
    },

    getBill(axios)
    {
        return axios.get('/api/Bills')
    },

    getBillUnComfirm(axios)
    {
        return axios.get('/api/Bills/viaStatus?Status=Chờ%20xác%20nhận')
    },
    getBillComfirm(axios)
    {
        return axios.get('/api/Bills/viaStatus?Status=Đã%20xác%20nhận')
    },

    getBillviaMonth(axios,Month)
    {
        return axios.get(`/api/Bills/viaMonthOrder?Month=${Month}`)
    },

    getCartDetail(axios)
    {
        return axios.get('/api/CartDetails')
    },
    getUser(axios)
    {
        return axios.get('/api/Account')
    },

    getUserviaMonth(axios,Month)
    {
        return axios.get(`/api/Account/viaMonthCreate?Month=${Month}`)
    },

}