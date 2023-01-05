export default function({store, redirect}, next){
    const authenticated = store.getters["admin/isAuthen"];
    if(!authenticated){
        //chuyen ve trang login
        redirect('/')
    }
    next()
}