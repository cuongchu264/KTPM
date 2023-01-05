<template>
    <div>
        <b-navbar toggleable="lg" type="light" variant="white">
            <nuxt-link to="/home"><img src='@/img/logo.png' width="60" height="60" alt=""></nuxt-link>
            <b-navbar-brand href="#" style="font-size: 20px;"><nuxt-link style="text-decoration:none; color:black;" to="/home"><strong>BUILDING MATERIAL SHOP</strong></nuxt-link></b-navbar-brand>

            <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

            <b-collapse id="nav-collapse"  is-nav>
                <b-navbar-nav class="navbar" >
                    <b-nav-item class="active"><nuxt-link to="/home" class="tc" style="text-decoration:none; color:black; font-weight: bold;">TRANG CHỦ</nuxt-link></b-nav-item>
                    <b-nav-item href="#"><nuxt-link to="/about" class="gt" style="text-decoration:none; color:black; font-weight: bold;">GIỚI THIỆU</nuxt-link></b-nav-item>
                    <b-nav-item href="#"><nuxt-link to="/product" class="gt" style="text-decoration:none; color:black; font-weight: bold;">SẢN PHẨM</nuxt-link></b-nav-item>
                    <b-nav-item href="#"><nuxt-link to="/news" class="bv" style="text-decoration:none; color:black; font-weight: bold;">BÀI VIẾT</nuxt-link></b-nav-item>
                </b-navbar-nav>
                

                <!-- Right aligned nav items -->
                <b-navbar-nav class="ml-auto">                    
                    <b-nav-item-dropdown v-if="!UserName.username" right>
                        <template #button-content class="active">
                            <em style="font-weight:bold"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="person circle" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-person-circle mx-auto b-icon bi"><g data-v-41be6633=""><path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"></path><path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path><path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"></path></g></svg></em>
                        </template>
                        <b-dropdown-item href="/login"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="person check" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-person-check mx-auto b-icon bi"><g data-v-41be6633=""><path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path><path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path></g></svg> Đăng nhập</b-dropdown-item>
                        <b-dropdown-item href="/register"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="person plus" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-person-plus mx-auto b-icon bi"><g data-v-41be6633=""><path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path><path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"></path></g></svg> Đăng kí</b-dropdown-item>
                    </b-nav-item-dropdown>
                    <b-nav-item-dropdown v-if="UserName.username" right>
                        <template #button-content class="active">
                            <em style="font-weight:bold" v-for="(user,index) in listuser" :key="index">
                                <b-avatar variant="success" :src="user.avatar"></b-avatar>
                                {{UserName.username}}
                            </em>
                        </template>
                        <b-dropdown-item href="/account/profile"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="person" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-person mx-auto b-icon bi"><g data-v-41be6633=""><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path></g></svg> Thông tin cá nhân</b-dropdown-item>
                        <b-dropdown-item href="/historyorder/historybill"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="cart check" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-cart-check mx-auto b-icon bi"><g data-v-41be6633=""><path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"></path><path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"></path></g></svg> Lịch sử mua hàng</b-dropdown-item>
                        <b-dropdown-item href="#" type="signOut" @click="signOut"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="box arrow right" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-box-arrow-right mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"></path><path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"></path></g></svg> Đăng xuất</b-dropdown-item>
                    </b-nav-item-dropdown>
                    <b-nav-item href="/cart/cartdetail"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="cart3" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-cart3 mx-auto b-icon bi"><g data-v-41be6633=""><path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></g></svg></b-nav-item>
                    <p v-if="UserName.username" >{{listcart.length}}</p>
                </b-navbar-nav>
            </b-collapse>
        </b-navbar>
    </div>
</template>
<style>
    .tc:hover{  
        color: grey !important;
    }
    .gt:hover{  
        color: grey !important;
    }
    .bv:hover{  
        color: grey !important;
    }
    .lh:hover{  
        color: grey !important;
    }
    .dropdown-item:focus { background-color: green; }
</style>
<script>
import { mapActions } from 'vuex'
import catalogApi from '@/api/catalogApi'
export default {
    data(){
        return{
            listuser: [],
            listcart:[],
            UserName:'',
        }
    },

    async created(){
        await this.getUser()
        await this.getCart()
    },
    mounted() {
        if (localStorage.getItem("user")){
            this.UserName = JSON.parse(localStorage.getItem("user"))
        }
    },

    methods:{
        async getUser(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getInfoviaUserName(this.$axios,this.UserName.username)
                this.listuser = data
            }catch(err){
                console.log(err)
            }
        },

        async getCart(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getCartviaUserName(this.$axios,this.UserName.username)
                this.listcart = data
            }catch(err){
                console.log(err)
            }
        },

        ...mapActions({
            logout: 'user/logout'
        }),

         async signOut(){
            // gọi action của store
            await this.logout()
            // chuyển hướng trang
            this.$router.go()
        }, 
    }
}
</script>