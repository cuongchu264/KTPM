<template>
  <main>
    <div class="container">
      <!--carousel-->
      <div>
        <b-carousel
          id="carousel-1"
          v-model="slide"
          :interval="3000"
          controls
          indicators
          background="#ababab"
          witdh="100"
          style="text-shadow: 1px 1px 2px #333;"
          @sliding-start="onSlideStart"
          @sliding-end="onSlideEnd"
        >
          <!-- Text slides with image -->
        <b-carousel-slide
            v-for="(CarouselItem, index) in listCarousels" :key="index"
            :caption="CarouselItem.caption"
            :text="CarouselItem.text"
            :img-src="CarouselItem.img"
          >
            <p><a class="btn btn-lg btn-success" :href="CarouselItem.link">Check it</a></p>
        </b-carousel-slide>          
        </b-carousel>
      </div>

      <!--card-banner-->
      <div>
        <b-card
          overlay
          img-src="https://i.pinimg.com/originals/46/cb/a9/46cba9f93a3d437db6d42f4bcd1a5f5f.gif"
          img-alt="Card Image"
          text-variant="light"
          title="XÂY DỰNG GIẤC MƠ CỦA BẠN"
          sub-title="Mang lại giải pháp tốt nhất"
          img-height="600"
        >
          <b-card-text>
            "UY TÍN - CHUYÊN NGHIỆP - TẬN TÂM - TẤT CẢ VÌ DỊCH VỤ KHÁCH HÀNG" là phương châm hoạt động xuyên suốt của shop chúng tôi.
            <p><a class="btn btn-success mt-2" href="https://vatlieuxaydung24h.vn/ngu-hanh-cua-vat-lieu-xay-dung-theo-phong-thuy-hien-dai" >Check it</a></p>
          </b-card-text>
        </b-card>
      </div>

      <!--HP title-->
      <div class="text-center mt-2">
        <h1>" SẢN PHẨM HOT "</h1>
      </div>

      <!--hot product-->
      <div>
        <b-tabs v-model="tabIndex" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
          <!--Gạch trang trí-->
          <b-tab title="Gạch trang trí"  active :title-link-class="linkClass(0)">
            <div class="row">
              <div v-for="(product, index) in listHotNike" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
          </b-tab>
          <!--Vật liệu thô-->
          <b-tab title="Vật liệu thô" :title-link-class="linkClass(1)">
            <div class="row">
              <div v-for="(product, index) in listHotDas" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
          </b-tab>
          <!--Thiết bị ngành nước-->
          <b-tab title="Thiết bị ngành nước" :title-link-class="linkClass(2)">
            <div class="row">
              <div v-for="(product, index) in listHotVans" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
          </b-tab>
          <!--Ngói lợp nhà-->
          <b-tab title="Ngói lợp nhà" :title-link-class="linkClass(3)">
            <div class="row">
              <div v-for="(product, index) in listHotCon" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
          </b-tab>
        </b-tabs>
      </div>

      <!--new3-->
      <div class="p-5 mb-4 bg-light rounded-3 new3 mt-3">
        <div class="container-fluid py-5 text-white">
          <img src="https://media.bizwebmedia.net/Sites/55916/Data/upload/2014/6/chong-nong-san-thuong.jpg" class="img-fluid" alt="">
          <h1 class="display-5 fw-bold">Giải pháp chống nóng cho sân thượng hiệu quả?</h1>
          <p class="col-md-8 fs-4">Giải pháp chống nóng cho sân thượng hiệu quả? Kinh nghiệm thi công sàn mái sân thượng. Vật Liệu Xây Dựng Đà Nẵng, VLXD Đà Nẵng.</p>
          <p><a class="btn btn-success btn-lg" href="https://vatlieuxaydung24h.vn/giai-phap-chong-nong-cho-san-thuong-hieu-qua">Check it »</a></p>
        </div>
      </div>
      
      <!--new4&5-->
      <div class="row align-items-md-stretch">
        <div class="col-md-6">
          <div class="h-100 p-5 text-white bg-dark rounded-3 new4">
            <h2>Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại</h2>
            <p>Hiểu được những boăn khoăn của khách hàng, công ty VLXD Hưng Gia Bình xin giới thiệu đến Quý khách hàng bài viết: “Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại”</p>
            <p><a class="btn btn-success btn-lg" href="https://vatlieuxaydung24h.vn/ngu-hanh-cua-vat-lieu-xay-dung-theo-phong-thuy-hien-dai">Check it »</a></p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="h-100 p-5 bg-light text-white border rounded-3 new5">
            <h2>Tìm hiểu về Đá Bazan?</h2>
            <p>Đá Bazan (tiếng Anh: basalt) là loại đá mắc ma màu xám hay màu đen, hình thành do mắc ma phun trào ra ngoài từ miệng núi lửa rồi nguội đi.</p>
            <p><a class="btn btn-success btn-lg" href="https://vatlieuxaydung24h.vn/tim-hieu-ve-da-bazan">Check it »</a></p>
          </div>
        </div>
      </div>
    </div>

  </main>   
</template>
<style>
      .carousel-item img {
          height:80vh!important ;
      }
      .new3{
        background-image: url('https://media.bizwebmedia.net/Sites/55916/Data/upload/2014/6/chong-nong-san-thuong.jpg') !important;
      }
      .new4{
        background-image: url('https://media.bizwebmedia.net/sites/55916/data/Upload/2014/12/ngu_hanh_vat_lieu_xay_dung_theo_phong_thuy.jpg') !important;
      }
      .new5{
        background-image: url('https://media.bizwebmedia.net/Sites/55916/Data/upload/2014/3/da-bazan-da-basalt.jpg') !important;
      }
    </style>
<script>
import item from '@/components/index/ProductSummary.vue'
import catalogApi from '@/api/catalogApi'
export default {
  components:{
        item,
    },
  data(){
    return {
      slide: 0,
      sliding: null,
      tabIndex: 0,
      listHotProducts: [],
      listCategories: [],
      listCarousels: [],
      listHotNike: [],
      listHotDas: [],
      listHotVans: [],
      listHotCon: [],
    }
  },

  async created(){
    await this.getCategories()
    await this.getCarousels()
    await this.getHotNike()
    await this.getHotDas()
    await this.getHotVans()
    await this.getHotCon()

  },
  methods :{
    async getCarousels(){
      try{
        const { data } = await catalogApi.getCarousels(this.$axios)

        this.listCarousels = data
      }catch(err){
        console.log(err)
      }
    },

    async getCategories(){
      try{
        const { data } = await catalogApi.getCategories(this.$axios)

        this.categories = data
      }catch(err){
        console.log(err)
      }
    },


    async getHotNike(){
      try{
        const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 1)

        this.listHotNike = data
      }catch(err){
        console.log(err)
      }
    },

    async getHotDas(){
      try{
        const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 2)

        this.listHotDas = data
      }catch(err){
        console.log(err)
      }
    },

    async getHotVans(){
      try{
        const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 3)

        this.listHotVans = data
      }catch(err){
        console.log(err)
      }
    },

    async getHotCon(){
      try{
        const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 4)

        this.listHotCon = data
      }catch(err){
        console.log(err)
      }
    },

    onSlideStart(slide) {
        this.sliding = true
      },
    onSlideEnd(slide) {
        this.sliding = false
    },
    linkClass(idx) {
        if (this.tabIndex === idx) {
          return ['bg-success', 'text-light']
        } else {
          return ['bg-light', 'text-secondary']
        }
    }
  },
}
</script>
