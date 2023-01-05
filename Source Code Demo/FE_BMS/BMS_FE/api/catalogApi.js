export default{
    //home
    getHotProducts: function(axios){
        return axios.get('/api/HotProducts')
    },
    getProductByCategory(axios, categoryId){
        return axios.get(`/api/Catalog/products-by-category/${categoryId}`)
    },
    getHotProductsviaCategoryId: function(axios, CateId){
        return axios.get('/api/HotProducts/viaCateId?CategoryId='+CateId)
    },
    getCarousels: function(axios){
        return axios.get('/api/Carousels')
    },
    getProductsviaCategoryId: function(axios, cateid){
        return axios.get('/api/Products/viaCategoryId?CategoryId='+ cateid)
    },
    getProductsById: function(axios, ProductId){
        return axios.get('/api/Products/' + ProductId)
    },
    //footer
    getBrandFooter: function(axios){
        return axios.get('/api/Brands')
    },
    getNewsviaCate: function(axios, Cate){
        return axios.get('/api/News/viaNewCate?NewCategoryId='+ Cate )
    },
    getReview: function(axios){
        return axios.get('/api/CustomerReviews')
    },
    getFounder: function(axios){
        return axios.get('/api/Founders')
    },
    getAllProducts: function(axios){
        return axios.get('/api/Products')
    },
    getCart: function(axios){
        return axios.get('/api/Carts')
    },
    getCartviaUserName: function(axios,username){
        return axios.get(`/api/Carts/viaUserName?UserName=${username}`)
    },
    getBill: function(axios){
        return axios.get('/api/Bills')
    },
    getBillviaUserName: function(axios,username){
        return axios.get(`/api/Bills/viaUserName?UserName=${username}`)
    },
    getInfoviaUserName: function(axios,username){
        return axios.get(`/api/Account/viaUserName?UserName=${username}`)
    } 
}