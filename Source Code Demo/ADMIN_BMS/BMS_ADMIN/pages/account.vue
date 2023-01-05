<template>
    <main>
        <div>
            <h3 class="text-center mt-4">" TÀI KHOẢN NGƯỜI DÙNG "</h3>
                    <div style="text-align:center;">
                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                    </div>
                    <div class="container-fluid bg-white">
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col" @click="sort('userId')">ID <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                <th scope="col" @click="sort('userName')">Tài khoản <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                <th scope="col">Mật khẩu</th>
                                <th scope="col">Họ và tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Địa chỉ</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(user,index) in filteredUser" :key="index">
                                    <th scope="row">{{ user.userId }}</th>
                                    <td>{{ user.userName }}</td>
                                    <td>{{ user.password }}</td>
                                    <td>{{ user.fullName }}</td>
                                    <td>{{ user.email }}</td>
                                    <td>{{ user.phone }}</td>
                                    <td>{{ user.address }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="text-center">
                            <button class="btn btn-success" @click="prevPage" :hidden="cantGoBack">Previous</button> 
                            Trang {{currentPage}}
                            <button class="btn btn-success" @click="nextPage" :hidden="this.currentPage > cantGoNext">Next</button>
                        </p>
                    </div>
        </div>
    </main>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
    middleware: ['isAuthorize'],
    data(){
        return{
            listUser:[],
            search:'',
            currentSort:'userId',
            currentSortDir:'asc',
            pageSize:10, 
            currentPage:1
        }
    },
    async created(){
        this.loadListAccount()
    },

    computed:{

        cantGoBack() {
            return this.currentPage === 1;
        },
        cantGoNext() {
            var totalPages = (Math.floor(this.filteredUser.length / this.pageSize)) + 1;
            return totalPages;
        },
        sortStr() {
            let s = '';
            if(this.currentSortDir === 'desc') s += '-';
                return s + this.currentSort;
        },

        filteredUser(){
            return this.listUser.filter((user) =>{
                return user.userName.toLowerCase().match(this.search.toLowerCase()) || user.email.toLowerCase().match(this.search.toLowerCase())
            });
        },

    },

    methods:{

        async loadListAccount() {
            let data = await fetch(`https://localhost:44389/api/Account/viaSortingAndPagination?Page_size=${this.pageSize}&Current_page=${this.currentPage}&Sort=${this.sortStr}`);
            this.listUser  = await data.json();  
            },
            sort:function(s) {
            //if s == current sort, reverse
            if(s === this.currentSort) {
                this.currentSortDir = this.currentSortDir==='asc'?'desc':'asc';
            } else this.currentSortDir = 'asc';
            this.currentSort = s;
            this.loadListAccount();
            },
            nextPage:function() {
            this.currentPage++;
            this.loadListAccount();
            },
            prevPage:function() {
            if(this.currentPage > 1) this.currentPage--;
            this.loadListAccount();
        },

    },

    
}
</script>