<template>
    <main>
        <div>
            <h1 class="text-center mt-2">" CHI TIẾT SẢN PHẨM "</h1>
        </div>
        <div class="container mt-5" style="display:flex;">
                <b-carousel
                id="carousel-1"
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
                        :img-src="product.hpAvatar"
                    >
                    </b-carousel-slide>
                    <b-carousel-slide
                        :img-src="product.img1"
                    >
                    </b-carousel-slide>            
                </b-carousel>
                <div class="text-center">
                    <h2>{{ product.hotProductName }}</h2>
                    <h5 class="mt-5">${{ product.hpPrice }}</h5>
                    <a class="btn btn-success mt-5" type="button" href="/product">Xem chi tiết</a>
                </div>
                
        </div>
        <div class="text-center mt-5 container">
            <h2 class="mt-5">Mô tả</h2>
            <p class="mt-2">{{ product.hpDescription }}</p>
        </div>
        <div class="text-center mt-5 container" >
            <h2 class="mt-5">Ảnh chi tiết</h2>
            <img class="mt-5" :src="product.hpAvatar" alt="">
            <img class="mt-5" :src="product.img1" alt="">
            <img class="mt-5" :src="product.img2" alt="">
            <img class="mt-5" :src="product.img3" alt="">
            <img class="mt-5" :src="product.img4" alt="">
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
        const product = await $axios.$get(`api/HotProducts/${params.hotproductid}`)
        return { product }
    },
    data(){
        return{
            slide: 0,
            sliding: null,
        }
    },
    methods:{
        onSlideStart(slide) {
            this.sliding = true
        },
        onSlideEnd(slide) {
            this.sliding = false
        },
    }
}
</script>