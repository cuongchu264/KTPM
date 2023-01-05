<template>
    <main>
    <body>
        <form class="login-form" action="./" method="POST"  @submit.prevent="onSubmit">
            <div class="login-form__content">
                <div class="text-center">
                    <img  src="https://cdn-icons-png.flaticon.com/512/4832/4832450.png" width="160" height="140" alt="">
                </div>
                <div class="login-form__header">BUILDING MATERIALS ADMIN</div>
                    <input v-model="dataSubmit.username" class="login-form__input" type="text"  name="dc_username"  placeholder="Username">
                    <input v-model="dataSubmit.password" class="login-form__input" type="password" name="dc_username" placeholder="Password">
                <button class="login-form__button" type="submit">Login</button>
            </div>
        </form>
    </body>
    <style>
        body {
            background-image: url('https://cdn.pixabay.com/photo/2014/09/17/21/43/bricks-450106_960_720.jpg') ;
            margin: 15px;
            margin-top: 140px;
        }

        .login-form,
        .login-form * {
            box-sizing: border-box;
            font-family: 'Source Sans Pro';
        }

        .login-form {
            max-width: 350px;
            margin: 0 auto;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
        }

        .login-form__logo-container {
            padding: 30px;
            background: rgba(0, 0, 0, 0.25);
        }

        .login-form__logo {
            display: block;
            max-width: 125px;
            margin: 0 auto;
        }

        .login-form__content {
            padding: 30px;
            background: white;
            
        }

        .login-form__header {
            margin-bottom: 15px;
            text-align: center;
            color: #333333;
            font-weight: bold;
            font-size: 25px;
        }

        .login-form__input {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            border: 2px solid #dddddd;
            background: white;
            outline: none;
            transition: border-color 0.5s;
        }

        .login-form__input:focus {
            border-color: white;
        }

        .login-form__input::placeholder {
            color: #aaaaaa;
        }

        .login-form__button {
            padding: 10px;
            color: #ffffff;
            font-weight: bold;
            background: #009578;
            width: 100%;
            border: none;
            outline: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-form__button:active {
            background: #008067;
        }

        .login-form__links {
            margin-top: 15px;
            text-align: center;
        }

        .login-form__link {
            font-size: 0.9em;
            color: #008067;
            text-decoration: none;
        }

    </style>
    </main>
</template>
<script>
import { mapActions } from 'vuex'
import accountApi from '@/api/accountApi'
export default {
    layout:'loginlayout',
    data(){
        return{
            dataSubmit:{
                username: '',
                password: '',
            }
        }
    },

    methods:{
        ...mapActions({
            setToken: 'admin/setToken',
            setRole: 'admin/setRole'
        }),
        async onSubmit(){
            try{
                const  data  = await accountApi.login(this.$axios, this.dataSubmit)
                console.log(data.access_token)
                await this.setToken(data.access_token)
                await this.setRole(data.role)

                this.$router.push('/home')
            }
            catch(err)
            {
                console.log(err)
                alert('Sai ten hoac mat khau')
            }
        }
    },
}
</script>