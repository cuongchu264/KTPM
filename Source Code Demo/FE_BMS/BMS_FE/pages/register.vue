<template>
  <section class="section">
    <div class="container">
      <div class="columns">
        <div class="column is-4 is-offset-4">
          <Notification v-if="error" :message="error"/>

          <form class="login-form mt-5" action="./" method="POST"  @submit.prevent="register">
            <div class="login-form__content">
                <div class="text-center">
                    <img  src="https://cdn-icons-png.flaticon.com/512/4557/4557255.png" width="160" height="140" alt="">
                </div>
                <div class="login-form__header">ĐĂNG KÍ</div>
                    <input class="login-form__input" type="text" name="dc_username"  v-model="username"  placeholder="Username" required>
                    <input class="login-form__input" type="password" name="dc_username" v-model="password" placeholder="Password" required>
                    <input class="login-form__input" type="email" name="dc_email"  v-model="email"  placeholder="Email" required>
                    <input class="login-form__input" type="text" name="dc_fullname"  v-model="fullname"  placeholder="Họ và tên" required>
                    <input class="login-form__input" type="text" name="dc_phone"  v-model="phone"  placeholder="Số điện thoại" required>
                    <textarea class="login-form__input" type="text" name="dc_address"  v-model="address"  placeholder="Địa chỉ" required></textarea>
                <button class="login-form__button" type="submit">Đăng kí</button>
                <div class="has-text-centered" style="margin-top: 20px">
                  Bạn đã có tài khoản? <nuxt-link to="/login">Đăng nhập ngay</nuxt-link>
                </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<style>
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
<script>
import Notification from '~/components/Nofication.vue'

export default {
  layout:'ordersuccesslayout',
  components: {
    Notification,
  },

  data() {
    return {
      username: '',
      email:'',
      password: '',
      fullname:'',
      phone:'',
      address:'',
      error: null,
    }
  },

  methods: {
    async register() {
      try {
        await this.$axios.post('/api/Account', {
          userName: this.username,
          password: this.password,
          email: this.email,
          fullName: this.fullname,
          phone: this.phone,
          address: this.address,
        })
        this.$router.push('/register-success')
      } catch (e) {
        console.log(e)
        alert('Tên đăng nhập này đã được sử dụng! Vui lòng đổi tên khác')
      }
    },
  }
}
</script>
