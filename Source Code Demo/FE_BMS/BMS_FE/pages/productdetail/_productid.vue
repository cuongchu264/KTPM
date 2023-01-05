<template>
    <main>
        <div class="container">
            <a href="/product" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
        </div>
        <div>
            <h1 class="text-center mt-2">" CHI TIẾT SẢN PHẨM "</h1>
        </div>
        <div class="container mt-5" style="display:flex;">
                <b-carousel
                id="carousel-2"
                v-model="slide"
                :interval="3000"
                controls
                indicators
                background="#ababab"
                @sliding-start="onSlideStart"
                @sliding-end="onSlideEnd"
                >
                <!-- Text slides with image -->
                    <b-carousel-slide
                        :img-src="product.avatar"
                    >
                    </b-carousel-slide>
                    <b-carousel-slide
                        :img-src="product.img1"
                    >
                    </b-carousel-slide>             
                </b-carousel>
                <div class="text-center">
                    <h2>{{ product.productName }}</h2>
                    <h5 class="mt-5">{{ product.price.toLocaleString() }} VND</h5>
                    <b-form @submit.prevent="AddCart(product)">
                        <!-- <div class="mt-5">
                            <b-form-group
                            v-slot="{ ariaDescribedby }"
                            label="Size:"
                            label-size="lg"
                            >
                                <b-form-radio-group
                                    id="btn-radios-2"
                                    v-model="Size"
                                    :options="SizeOptions"
                                    :aria-describedby="ariaDescribedby"
                                    button-variant="outline-success"
                                    size="sm"
                                    name="radio-btn-outline"
                                    buttons
                                ></b-form-radio-group>
                            </b-form-group>
                        </div> -->
                        <div>
                            <b-form-group label="Số lượng:" label-size="lg">
                                <b-form-spinbutton size="sm" id="sb-inline" min="1" :disabled="product.inStocks<1" :max="product.inStocks" v-model="Quantity" inline></b-form-spinbutton>
                            </b-form-group>
                        </div>
                        <button class="btn btn-success mt-4" type="submit" v-if="product.inStocks > 0 && username.username ">Thêm vào giỏ hàng</button>
                        <button class="btn btn-danger mt-4"  v-if="product.inStocks === 0" disabled>Hết hàng</button>
                        <div class="text-center" v-if="!username.username && product.inStocks > 0">
                            <a href="/login" class="btn btn-success mt-4">Đăng nhập để thêm vào giỏ hàng</a>
                        </div>
                    </b-form>
                </div>    
        </div>
        <div class="text-center container" style="margin-top: 100px">
            <h2 class="mt-5">Mô tả</h2>
            <p class="mt-2">{{ product.description }}</p>
        </div>
        <div class="text-center mt-5 container">
            <h2 class="mt-5">Ảnh chi tiết</h2>
            <img class="mt-5" :src="product.avatar" alt="">
            <img class="mt-5" :src="product.img1" alt="">
            <img class="mt-5" :src="product.img2" alt="">
            <img class="mt-5" :src="product.img3" alt="">
            <img class="mt-5" :src="product.img4" alt="">
        </div>
        <div class="mt-5">
            <div class="container bg-white" v-if="username.username">
                <h3 class="text-center">" ĐÁNH GIÁ "</h3>
                <b-form method="post"  @submit.prevent="ProductReview(product)" class="mt-3">
                    <!-- <b-form-group id="input-group-1" label="Tên của bạn:" label-for="input-1">
                        <b-form-input
                            id="input-1"
                            v-model="CustomerName"
                            placeholder="Nhập tên của bạn"
                            required
                        ></b-form-input>
                    </b-form-group> -->

                    <b-form-group label="Đánh giá 5 sao:">
                        <b-form-rating  v-model="Star" variant="warning"></b-form-rating>
                    </b-form-group>

                    <b-form-group id="input-group-2" label="Nội dung" label-for="input-2">
                        <b-form-textarea
                          id="input-3"
                          placeholder="Nhập nội dung đánh giá của bạn"
                          v-model="Content"
                          required
                        ></b-form-textarea>
                    </b-form-group>
                
                    <b-button style="margin: auto; display:block;" type="submit" variant="success">Đánh giá</b-button>
                </b-form>
            </div>
            <div class="text-center" v-if="!username.username">
                <a href="/login" class="btn btn-success">Đăng nhập để đánh giá {{product.productName}}</a>
            </div>
            <div class="mt-5">
                <h3 class="text-center">Đánh giá về {{product.productName}}</h3>
                    <div class="container">
                        <table class="table mt-4 text-center">
                            <thead>
                                <tr>
                                <th scope="col">Khách hàng</th>
                                <th scope="col">Đánh giá</th>
                                <th scope="col">Nội dung</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(reviewproduct,index) in sortedList" :key="index">
                                    <td>{{ reviewproduct.customerName }}</td>
                                    <td><b-form-rating disabled id="rating-inline" style="color: #ffc107; background-color:white; border:none;" inline :value="reviewproduct.star"></b-form-rating></td>
                                    <td>{{ reviewproduct.content }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
    </main>
</template>
<style>
    .carousel-item img {
        height:400px!important ;
        width: 800px!important;
    }
    .carousel{
        height:400px!important;
        width:800px!important;
    }
</style>
<script>
export default {
    async asyncData({ $axios,params}) {
        const product = await $axios.$get(`api/Products/${params.productid}`)
        const review = await $axios.$get(`/api/ProductReviews/viaProductId?ProductId=${params.productid}`)
        return { product, review }
    },
    data(){
        return{
            slide: 0,
            sliding: null,
            Quantity: 1,
            CustomerName:'',
            Star: null,
            Content:'',
            listReviews: [],
            username:'',
            sortBy: "BillId",
            sortOrder: 1,
        }
    },

    computed:{
        sortedList() {
            return [...this.review]
                .map(i => ({...i}))
                .sort((a,b) => {
                if (a[this.sortBy] >= b[this.sortBy]) {
                    return this.sortOrder
                }
                return -this.sortOrder
            })
        },
    },

    mounted() {
        if (localStorage.getItem("user")){
            this.username = JSON.parse(localStorage.getItem("user"))
        }
    },



    methods:{
        onSlideStart(slide) {
            this.sliding = true
        },
        onSlideEnd(slide) {
            this.sliding = false
        },

        async AddCart(product) {
        try {
          await this.$axios.post('/api/Carts', {
            productId: product.productId,
            productName: product.productName,
            avatar: product.avatar,
            price: product.price,
            quantity: this.Quantity,
            userName: this.username.username,
          })
          this.$router.push('/cart/cartdetail')
          } 
        catch (e) {
          this.error = e.response.data.message
        }
      },

      async ProductReview(product) {
        try {
          await this.$axios.post('/api/ProductReviews', {
            customerName: this.username.username,
            star: this.Star,
            content: this.Content,
            productId: product.productId
          })
          this.$router.push('/productdetail/productreview')
          } 
        catch (err) {
          console.log(err)
        }
      },
    }
}
</script>
