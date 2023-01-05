<template>
    <main>
        <div style="background-color: whitesmoke" class="container emp-profile" v-for="(info,index) in listInformation" :key="index">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <b-img rounded="circle" :src="info.avatar" alt=""></b-img>
                        </div>
                        <div class="profile-img" v-if="!info.avatar">
                            <b-img rounded="circle" src="https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-and-shapes-3/177800/129-512.png" alt=""></b-img>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        {{info.fullName}}
                                    </h5>
                                    <h6>
                                        {{info.userName}}
                                    </h6>
                                    <p class="proile-rating">Xếp hạng : 
                                        <span v-if="listBill.length < 5 && listBill.length >= 0">Thành viên mới</span>
                                        <span v-if="listBill.length >= 5 && listBill.length < 10">Thành viên bạc</span>
                                        <span v-if="listBill.length >= 10 && listBill.length < 20">Thành viên vàng</span>
                                        <span v-if="listBill.length >= 20 && listBill.length < 30">Thành viên kim cương</span>
                                    </p>
                            <b-tabs v-model="tab" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                                <!--Thông tin-->
                                <b-tab title="Thông tin" class="tab-content profile-tab" id="myTabContent"  active :title-link-class="linkClass(0)">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" >
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>UserName</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{info.userName}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Họ và tên</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{info.fullName}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{info.email}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Số điện thoại</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{info.phone}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Địa chỉ</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{info.address}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </b-tab>
                                <!--Thành tích mua hàng-->
                                <b-tab title="Thành tích mua hàng" class="tab-content profile-tab" id="myTabContent" :title-link-class="linkClass(1)">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" v-for="(info,index) in listInformation" :key="index" >
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Tổng số đơn hàng đã mua</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{listBill.length}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Độ cháy túi</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>{{total.toLocaleString()}}VND</p>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </b-tab>
                            </b-tabs>
                        </div>
                    </div>
                    <div class="col-md-2" >
                        <button style="background-color: darkgray;" type="button" class="profile-edit-btn" name="btnAddMore" ><a :href="geturl(info.userId)" style="text-decoration:none; color:black;">Chỉnh sửa</a></button>
                    </div>
                </div>
            </form>           
        </div>
    </main>
</template>
<style>
    .emp-profile{
        padding: 3%;
        margin-top: 3%;
        margin-bottom: 3%;
        border-radius: 0.5rem;
        background: #fff;
    }
    .profile-img{
        text-align: center;
    }
    .profile-img img{
        width: 70%;
        height: 100%;
    }
    .profile-img .file {
        position: relative;
        overflow: hidden;
        margin-top: -20%;
        width: 70%;
        border: none;
        border-radius: 0;
        font-size: 15px;
        background: #212529b8;
    }
    .profile-img .file input {
        position: absolute;
        opacity: 0;
        right: 0;
        top: 0;
    }
    .profile-head h5{
        color: #333;
    }
    .profile-head h6{
        color: #0062cc;
    }
    .profile-edit-btn{
        border: none;
        border-radius: 1.5rem;
        width: 70%;
        padding: 2%;
        font-weight: 600;
        color: #6c757d;
        cursor: pointer;
    }
    .proile-rating{
        font-size: 12px;
        color: #818182;
        margin-top: 5%;
    }
    .proile-rating span{
        color: #495057;
        font-size: 15px;
        font-weight: 600;
    }
    .profile-head .nav-tabs{
        margin-bottom:5%;
    }
    .profile-head .nav-tabs .nav-link{
        font-weight:600;
        border: none;
    }
    .profile-head .nav-tabs .nav-link.active{
        border: none;
        border-bottom:2px solid #0062cc;
    }
    .profile-work{
        padding: 14%;
        margin-top: -15%;
    }
    .profile-work p{
        font-size: 12px;
        color: #818182;
        font-weight: 600;
        margin-top: 10%;
    }
    .profile-work a{
        text-decoration: none;
        color: #495057;
        font-weight: 600;
        font-size: 14px;
    }
    .profile-work ul{
        list-style: none;
    }
    .profile-tab label{
        font-weight: 600;
    }
    .profile-tab p{
        font-weight: 600;
        color: #0062cc;
    }
</style>
<script>
import catalogApi from '@/api/catalogApi'
export default {
    middleware: ['isAuthorize'],
    layout:'avaload',
    data(){
        return{
            tab: 0,
            listInformation:[],
            listBill:[],
            UserName:'',
        }
    },

    async created(){
        await this.getInfo()
        await this.getBillviaUserName()
    },

    computed: {
        total() {
            let total = 0;
            for(let i = 0; i < this.listBill.length; i++) {
                total += this.listBill[i].total
            }
                return total;
        },
    },

    methods:{
        linkClass(idx){
            if (this.tab === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        async getInfo(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getInfoviaUserName(this.$axios,this.UserName.username)
                this.listInformation = data
            }catch(err){
                console.log(err)
            }
        },

        async getBillviaUserName(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getBillviaUserName(this.$axios,this.UserName.username)
                this.listBill = data

            }catch(err){
                console.log(err)
            }
        },


        geturl(ProfileIdEdit){
            const url= '/account/'+ProfileIdEdit;
            return url;
        }
    }

}
</script>