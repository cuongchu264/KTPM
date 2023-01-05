<template>
    <main>
        <div style="background-color: whitesmoke;" class="container emp-profile">
            <div class="container">
                <a href="/account/profile" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center">" CHỈNH SỬA THÔNG TIN CÁ NHÂN "</h3>
            <form method="put" @submit.prevent="UpdateInfo(profile)">
                <b-form-group id="input-group-1" label="Họ và Tên:" label-for="input-1">
                        <b-form-input
                            id="input-1"
                            v-model="profile.fullName"
                            placeholder="Nhập họ và tên của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>

                <b-form-group id="input-group-2" label="Email:" label-for="input-2">
                        <b-form-input
                            id="input-2"
                            v-model="profile.email"
                            placeholder="Nhập email của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>

                <b-form-group id="input-group-3" label="Số điện thoại:" label-for="input-3">
                        <b-form-input
                            id="input-3"
                            v-model="profile.phone"
                            placeholder="Nhập số điện thoại của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>
                
                <b-form-group id="input-group-4" label="Địa chỉ:" label-for="input-4">
                        <b-form-input
                            id="input-4"
                            v-model="profile.address"
                            placeholder="Nhập địa chỉ của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>

                <b-form-group id="input-group-5" label="Link ảnh đại diện:" label-for="input-5">
                        <b-form-input
                            id="input-5"
                            v-model="profile.avatar"
                            placeholder="Nhập link ảnh đại diện của bạn"
                        ></b-form-input>
                    </b-form-group>
                
                <b-button  style="margin: auto; display:block;" type="submit" variant="success">Chỉnh sửa</b-button>
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
export default {
    async asyncData({ $axios,params}) {
        const profile = await $axios.$get(`api/Account/${params.ProfileIdEdit}`)
        return { profile }
    },
    layout:'ordersuccesslayout',
    middleware: ['isAuthorize'],
    data(){
        return{
        }
    },


    methods:{
        async UpdateInfo(profile) {
            try {
            await this.$axios.put('/api/Account/' + profile.userId, {
                userId: profile.userId,
                userName: profile.userName,
                password: profile.password,
                fullName: profile.fullName,
                email: profile.email,
                phone: profile.phone,
                address: profile.address,
                avatar: profile.avatar,
                dayCreate: profile.dayCreate,
            })
            alert('Cập nhật thông tin cá nhân thành công!')
            this.$router.push('/account/profile')
            } 
            catch (err) {
            console.log(err)
            }
        },
    }
}
</script>