<template>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
            <nuxt-link class="my-0 mr-md-auto font-weight-normal" to="/home" style="text-decoration:none;color:black;"><h4>{{admin.role}}</h4></nuxt-link>
            <nav class="my-2 my-md-0 mr-md-3">
                <nuxt-link class="p-2 btn btn-outline-success" to="/productsNcategories">Sản phẩm&Danh mục</nuxt-link>
                <nuxt-link class="p-2 btn btn-outline-success" to="/adsNnew">Quảng cáo&Bài viết </nuxt-link>
                <a class="p-2 btn btn-outline-success" href="/account">Tài khoản</a>
                <a class="p-2 btn btn-outline-success" href="/Bill">Đơn hàng</a>
                <a class="p-2 btn btn-outline-success" href="/sales/salesDetail">Doanh thu</a>
                <button class="p-2 btn btn-success" @click="signOut()" >Đăng xuất <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="box arrow right" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-box-arrow-right mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"></path><path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"></path></g></svg></button>
            </nav>
        </div>
</template>
<script>
import { mapActions} from 'vuex'
export default {
    data(){
        return{
            admin:[],
        }
    },
    mounted() {
        if (localStorage.getItem("admin")){
            this.admin = JSON.parse(localStorage.getItem("admin"))
        }
    },
    methods:{
        ...mapActions({
            logout: "admin/logout"
        }),
        async signOut(){
            await this.logout()

            this.$router.push('/')
        }
    }
}
</script>