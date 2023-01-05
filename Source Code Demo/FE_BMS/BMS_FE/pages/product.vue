<template>
  <main>
    <div class="container-fluid">


      <!--HP title-->
      <div class="text-center mt-2">
        <h1>" SẢN PHẨM "</h1>
      </div>
      <div style="text-align:center;">
            <input  size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" v-model="search" placeholder="Search">
      </div>
      <!-- product-->
      <div>
        
        <b-tabs v-model="tabIndex" content-class="mt-3" align="center"  active-nav-item-class="font-weight-bold text-uppercase text-success" pills card vertical>
          <!--Gạch trang trí-->
          <b-tab title="Gạch trang trí" active :title-link-class="linkClass(0)"  >
            <div class="mb-5">
                <span  style="float:right;">Sản phẩm: 
                  <select v-model="pageSizeNike" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                    <option value="12">12</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(product, index) in NikeOfCurrPage" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center"
                  >
                <item 
                  :product="product"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexNike>0" type="button" class="btn btn-success" @click="gotoPrevNike()">Prev</a> Trang {{pageIndexNike + 1}} <a class="btn btn-success" :hidden="pageIndexNike> cantGoNextNike" @click="gotoNextNike()">Next</a></p>
          </b-tab>

          <!--Vật liệu thô-->
          <b-tab title="Vật liệu thô" :title-link-class="linkClass(1)">
            <div class="mb-5">
                <span  style="float:right;">Sản phẩm: 
                  <select v-model="pageSizeDas" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                    <option value="12">12</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(product, index) in DasOfCurrPage" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexDas>0" type="button" class="btn btn-success" @click="gotoPrevDas()">Prev</a> Trang {{pageIndexDas + 1}} <a class="btn btn-success" :hidden="pageIndexDas> cantGoNextDas" @click="gotoNextDas()">Next</a></p>
          </b-tab>


          <!--Thiết bị ngành nước-->
          <b-tab title="Thiết bị ngành nước" :title-link-class="linkClass(2)">
            <div class="mb-5">
                <span  style="float:right;">Sản phẩm: 
                  <select v-model="pageSizeVans" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                    <option value="12">12</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(product, index) in VansOfCurrPage" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexVans>0" type="button" class="btn btn-success" @click="gotoPrevVans()">Prev</a> Trang {{pageIndexVans + 1}} <a class="btn btn-success" :hidden="pageIndexVans> cantGoNextVans" @click="gotoNextVans()">Next</a></p>
          </b-tab>


          <!--Ngói lợp nhà-->
          <b-tab title="Ngói lợp nhà" :title-link-class="linkClass(3)">
            <div class="mb-5">
                <span  style="float:right;">Sản phẩm: 
                  <select v-model="pageSizeCon" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                    <option value="12">12</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(product, index) in ConOfCurrPage" 
                  :key="index" class="col-12 col-md-4 mb-3 text-center">
                <item 
                  :product="product"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexCon>0" type="button" class="btn btn-success" @click="gotoPrevCon()">Prev</a> Trang {{pageIndexCon + 1}} <a class="btn btn-success" :hidden="pageIndexCon> cantGoNextCon" @click="gotoNextCon()">Next</a></p>
          </b-tab>
        </b-tabs>
      </div>
    </div>
  </main>   
</template>

<script>
import item from '@/components/index/ProductItem.vue'
import catalogApi from '@/api/catalogApi'
export default {
  layout: 'default',
  components:{
        item,
  },
  data(){
    return {
      perPage: 3,
      currentPage: 1,
      slide: 0,
      sliding: null,
      tabIndex: 0,
      listAllProducts: [],
      listCategories: [],
      listCarousels: [],
      listNike: [],
      listDas: [],
      listVans: [],
      listCon: [],
      search:'',
      pageSizeNike: 6,
      pageIndexNike: 0,
      pageSizeDas: 6,
      pageIndexDas: 0,
      pageSizeVans: 6,
      pageIndexVans: 0,
      pageSizeCon: 6,
      pageIndexCon: 0,
    }
  },



  async created(){
    await this.getAllProducts()
    await this.getNike()
    await this.getDas()
    await this.getVans()
    await this.getCon()

  },
  computed:{

    filteredNike: function(){
      return this.listNike.filter((product) =>{
        return product.productName.toLowerCase().match(this.search.toLowerCase())
      });
    },
    NikeOfCurrPage: function () {
      return this.filteredNike.slice(this.pageSizeNike * this.pageIndexNike, this.pageSizeNike * (this.pageIndexNike+1))
    },
    cantGoNextNike() {
      const totalPages = (Math.floor(this.NikeOfCurrPage.length / this.pageSizeNike)) + 1;
      return totalPages;
    },

    filteredDas: function(){
      return this.listDas.filter((product) =>{
        return product.productName.toLowerCase().match(this.search.toLowerCase())
      });
    },
    DasOfCurrPage: function () {
      return this.filteredDas.slice(this.pageSizeDas * this.pageIndexDas, this.pageSizeDas * (this.pageIndexDas+1))
    },
    cantGoNextDas() {
      const totalPages = (Math.floor(this.DasOfCurrPage.length / this.pageSizeDas)) + 1;
      return totalPages;
    },

    filteredVans: function(){
      return this.listVans.filter((product) =>{
        return product.productName.toLowerCase().match(this.search.toLowerCase())
      });
    },
    VansOfCurrPage: function () {
      return this.filteredVans.slice(this.pageSizeVans * this.pageIndexVans, this.pageSizeVans * (this.pageIndexVans+1))
    },
    cantGoNextVans() {
      const totalPages = (Math.floor(this.VansOfCurrPage.length / this.pageSizeVans)) + 1;
      return totalPages;
    },

    filteredCon: function(){
      return this.listCon.filter((product) =>{
        return product.productName.toLowerCase().match(this.search.toLowerCase())
      });
    },
    ConOfCurrPage: function () {
      return this.filteredCon.slice(this.pageSizeCon * this.pageIndexCon, this.pageSizeCon * (this.pageIndexCon+1))
    },
    cantGoNextCon() {
      const totalPages = (Math.floor(this.ConOfCurrPage.length / this.pageSizeCon)) + 1;
      return totalPages;
    },
  },

 
  
  methods :{
    gotoPrevNike: function() {this.pageIndexNike -=1},
    gotoNextNike: function() {this.pageIndexNike +=1},
    gotoPrevDas: function() {this.pageIndexDas -=1},
    gotoNextDas: function() {this.pageIndexDas +=1},
    gotoPrevVans: function() {this.pageIndexVans -=1},
    gotoNextVans: function() {this.pageIndexVans +=1},
    gotoPrevCon: function() {this.pageIndexCon -=1},
    gotoNextCon: function() {this.pageIndexCon +=1},

    async getAllProducts(){
      try{
        const { data } = await catalogApi.getAllProducts(this.$axios)
        

        this.listAllProducts = data
      }catch(err){
        console.log(err)
      }
    },


    async getNike(){
      try{
        const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 1)
        

        this.listNike = data
      }catch(err){
        console.log(err)
      }
    },

    async getDas(){
      try{
        const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 2)
        

        this.listDas = data
      }catch(err){
        console.log(err)
      }
    },

    async getVans(){
      try{
        const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 3)
        

        this.listVans = data
      }catch(err){
        console.log(err)
      }
    },

    async getCon(){
      try{
        const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 4 )
        

        this.listCon = data
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
