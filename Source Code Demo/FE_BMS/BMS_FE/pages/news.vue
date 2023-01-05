<template>
  <main>
       <!--NEWS title-->
      <div class="text-center mt-2">
        <h1>" BÀI VIẾT "</h1>
      </div>
      <!--News Items--->
      <div class="container mt-4">
        <b-tabs v-model="tabIndex" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
          <!--footwear-->
          <b-tab title="Tin tức vật liệu xây dựng"  active :title-link-class="linkClass(0)">
            <div class="mb-5">
                <span  style="float:right;">Bài viết: 
                  <select v-model="pageSizeFootwear" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(news, index) in FootwearOfCurrPage" :key="index" class="col-12 col-md-12 mb-3">
                <item 
                  :News="news"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexFootwear>0" type="button" class="btn btn-success" @click="gotoPrevFootwear()">Prev</a> Trang {{pageIndexFootwear + 1}} <a class="btn btn-success" :hidden="pageIndexFootwear>= cantGoNextFootwear" @click="gotoNextFootwear()">Next</a></p>
          </b-tab>
          <!--fashion-->
          <b-tab title="Thông tin Tuyển dụng Nhân sự" :title-link-class="linkClass(1)">
            <div class="mb-5">
                <span  style="float:right;">Bài viết: 
                  <select v-model="pageSizeFashion" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(news, index) in FashionOfCurrPage "
                  :key="index" class="col-12 col-md-12 mb-3">
                <item 
                  :News="news"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexFashion>0" type="button" class="btn btn-success" @click="gotoPrevFashion()">Prev</a> Trang {{pageIndexFashion + 1}} <a class="btn btn-success" :hidden="pageIndexFashion>= cantGoNextFashion" @click="gotoNextFashion()">Next</a></p>
          </b-tab>
          <!--library-->
          <b-tab title="Kinh Nghiệm Xây Nhà Đẹp" :title-link-class="linkClass(2)">
            <div class="mb-5">
                <span  style="float:right;">Bài viết: 
                  <select v-model="pageSizeLibrary" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(news, index) in LibraryOfCurrPage" 
                  :key="index" class="col-12 col-md-12 mb-3">
                <item 
                  :News="news"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexLibrary>0" type="button" class="btn btn-success" @click="gotoPrevLibrary()">Prev</a> Trang {{pageIndexLibrary + 1}} <a class="btn btn-success" :hidden="pageIndexLibrary>= cantGoNextLibrary" @click="gotoNextLibrary()">Next</a></p>
          </b-tab>
          <!--events-->
          <b-tab title="Tin tức Dự án Bất động sản" :title-link-class="linkClass(3)">
            <div class="mb-5">
                <span  style="float:right;">Bài viết: 
                  <select v-model="pageSizeEvents" placeholder="Page Size">
                    <option value="6">6</option>
                    <option value="9">9</option>
                  </select>
                </span>
            </div>
            <div class="row">
              <div v-for="(news, index) in EventsOfCurrPage" 
                  :key="index" class="col-12 col-md-12 mb-3">
                <item 
                  :News="news"
                />
              </div>
            </div>
            <p class="text-center"><a v-if="pageIndexEvents>0" type="button" class="btn btn-success" @click="gotoPrevEvents()">Prev</a> Trang {{pageIndexEvents + 1}} <a class="btn btn-success" :hidden="pageIndexEvents>= cantGoNextEvents" @click="gotoNextEvents()">Next</a></p>
          </b-tab>
        </b-tabs>
      </div>
  </main>   
</template>
<script>
import catalogApi from '@/api/catalogApi'
import item from '@/components/index/NewItem.vue'
export default {
  layout: 'default',
  components:{
        item,
    },
  data(){
    return{
      tabIndex: 0,
      listfootwear: [],
      listfashion: [],
      listlibrary: [],
      listevents: [],
      pageSizeFootwear: 6,
      pageIndexFootwear: 0,
      pageSizeFashion: 6,
      pageIndexFashion: 0,
      pageSizeLibrary: 6,
      pageIndexLibrary: 0,
      pageSizeEvents: 6,
      pageIndexEvents: 0,
    }
  },

  computed:{
    FootwearOfCurrPage: function () {
      return this.listfootwear.slice(this.pageSizeFootwear * this.pageIndexFootwear, this.pageSizeFootwear * (this.pageIndexFootwear+1))
    },
    cantGoNextFootwear() {
      var totalPages = (Math.floor(this.FootwearOfCurrPage.length / this.pageSizeFootwear)) + 1;
      return totalPages;
    },
    FashionOfCurrPage: function () {
      return this.listfashion.slice(this.pageSizeFashion * this.pageIndexFashion, this.pageSizeFashion * (this.pageIndexFashion+1))
    },
    cantGoNextFashion() {
      var totalPages = (Math.floor(this.FashionOfCurrPage.length / this.pageSizeFashion)) + 1;
      return totalPages;
    },
    LibraryOfCurrPage: function () {
      return this.listlibrary.slice(this.pageSizeLibrary * this.pageIndexLibrary, this.pageSizeLibrary * (this.pageIndexLibrary+1))
    },
    cantGoNextLibrary() {
      var totalPages = (Math.floor(this.LibraryOfCurrPage.length / this.pageSizeLibrary)) + 1;
      return totalPages;
    },
    EventsOfCurrPage: function () {
      return this.listevents.slice(this.pageSizeEvents * this.pageIndexEvents, this.pageSizeEvents * (this.pageIndexEvents+1))
    },
    cantGoNextEvents() {
      var totalPages = (Math.floor(this.EventsOfCurrPage.length / this.pageSizeEvents)) + 1;
      return totalPages;
    },
  },

  async created(){
    await this.getfootwear()
    await this.getfashion()
    await this.getlibrary()
    await this.getevents()

  },
  methods: {
    gotoPrevFootwear: function() {this.pageIndexFootwear -=1},
    gotoNextFootwear: function() {this.pageIndexFootwear +=1},
    gotoPrevFashion: function() {this.pageIndexFashion -=1},
    gotoNextFashion: function() {this.pageIndexFashion +=1},
    gotoPrevLibrary: function() {this.pageIndexLibrary -=1},
    gotoNextLibrary: function() {this.pageIndexLibrary +=1},
    gotoPrevEvents: function() {this.pageIndexEvents -=1},
    gotoNextEvents: function() {this.pageIndexEvents +=1},

    linkClass(idx) {
        if (this.tabIndex === idx) {
          return ['bg-success', 'text-light']
        } else {
          return ['bg-light', 'text-secondary']
        }
    },

    //footwear
    async getfootwear(){
      try{
        const { data } = await catalogApi.getNewsviaCate(this.$axios, 1)
        this.listfootwear = data
      }catch(err){
        console.log(err)
      }
    },
    //fashion
    async getfashion(){
      try{
        const { data } = await catalogApi.getNewsviaCate(this.$axios, 2)
        

        this.listfashion = data
      }catch(err){
        console.log(err)
      }
    },
    //library
    async getlibrary(){
      try{
        const { data } = await catalogApi.getNewsviaCate(this.$axios, 3)
        

        this.listlibrary = data
      }catch(err){
        console.log(err)
      }
    },
    //events
    async getevents(){
      try{
        const { data } = await catalogApi.getNewsviaCate(this.$axios, 4)
        

        this.listevents = data
      }catch(err){
        console.log(err)
      }
    },
  }
}
</script>