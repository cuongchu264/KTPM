<template>
  <div>
    <div class="mt-4">
      <b-tabs v-model="tab" active-nav-item-class="font-weight-bold text-uppercase text-success" pills card vertical>
        <!-- Carousel -->
        <b-tab title="Carousel" :title-link-class="linkClass(0)">
            <b-tabs v-model="tabCarousel" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng Carousel-->
                <b-tab title="Bảng Carousel"  active :title-link-class="linkClassCarousel(0)">
                    <h3 class="text-center mt-4">" TẤT CẢ CAROUSEL "</h3>
                    <div style="text-align:center;">
                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                    </div>
                    <div class="container bg-white">
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên Carousel</th>
                                <th scope="col">Nội dung</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(Carousel,index) in filteredCarousel" :key="index">
                                    <th scope="row">{{ Carousel.carouselId }}</th>
                                    <td>{{ Carousel.caption }}</td>
                                    <td>{{ Carousel.text }}</td>
                                    <td><a type="button" class="btn btn-success" :href="getCarouselEditurl(Carousel.carouselId)">Edit</a></td>
                                    <td><button class="btn btn-danger" @click="DeleteCarousel(Carousel.carouselId)" >Delete</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </b-tab>
                <!--Thêm Carousel-->
                <b-tab title="Thêm Carousel" :title-link-class="linkClassCarousel(1)">
                    <h3 class="text-center mt-4">" THÊM CAROUSEL "</h3>
                    <div class="container bg-white">
                        <b-form method="post"  class="mt-3" @submit.prevent="CreateCarousel">
                            <b-form-group
                                id="input-group-1"
                                label="Tên Carousel:"
                                label-for="input-1"
                            >
                                <b-form-input
                                    id="input-1"
                                    v-model="CarouselCaption"
                                    placeholder="Nhập tên Carousel"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-2" label="Nội dung:" label-for="input-2">
                                <b-form-textarea
                                    id="input-2"
                                    v-model="CarouselContent"
                                    placeholder="Nhập nội dung của Carousel"
                                    required
                                ></b-form-textarea>
                            </b-form-group>

                            <b-form-group id="input-group-3" label="Link ảnh Carousel:" label-for="input-3">
                                <b-form-input
                                    id="input-3"
                                    v-model="CarouselImg"
                                    placeholder="Nhập link ảnh của Carousel"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-4" label="Link bài viết Carousel:" label-for="input-4">
                                <b-form-input
                                    id="input-4"
                                    v-model="CarouselLink"
                                    placeholder="Nhập link bài viết của Carousel"
                                    required
                                ></b-form-input>
                            </b-form-group>


                            <b-button style="margin: auto; display:block;" type="submit" variant="success">Create</b-button>
                        </b-form>
                    </div>
                </b-tab>
            </b-tabs>
        </b-tab>
        
        <!-- Bài viết -->
        <b-tab title="Bài viết" :title-link-class="linkClass(1)">
            <b-tabs v-model="tabNew" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng bài viết-->
                <b-tab title="Bảng bài viết"  active :title-link-class="linkClassNew(0)">
                    <h3 class="text-center mt-4">" TẤT CẢ BÀI VIẾT "</h3>
                    <div style="text-align:center;">
                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                    </div>
                    <div class="container bg-white">
                        <div class="mb-5">
                            <span  style="float:right;">Bài viết: 
                                    <select v-model="pageSizeNew" placeholder="Page Size">
                                        <option value="3">3</option>
                                        <option value="6">6</option>
                                        <option value="9">9</option>
                                    </select>
                            </span>
                        </div>
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên bài viết</th>
                                <th scope="col">Nội dung</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(New,index) in NewOfCurrPage" :key="index">
                                    <th scope="row">{{ New.newId }}</th>
                                    <td>{{ New.newTitle }}</td>
                                    <td>{{ New.newComment }}</td>
                                    <td><a type="button" class="btn btn-success" :href="getNewEditurl(New.newId)">Edit</a></td>
                                    <td><button class="btn btn-danger" @click="DeleteNew(New.newId)" >Delete</button></td>
                                </tr>
                            </tbody>
                        </table>
                    <p class="text-center"><a  v-if="pageIndexNew>0" type="button" class="btn btn-success" @click="gotoPrevNew()">Prev</a> Trang {{pageIndexNew + 1}} <a v-if="pageIndexNew<=NewOfCurrPage.length" class="btn btn-success" @click="gotoNextNew()">Next</a></p>
                    </div>
                </b-tab>
                <!--Thêm bài viết-->
                <b-tab title="Thêm bài viết" :title-link-class="linkClassNew(1)">
                    <h3 class="text-center mt-4">" THÊM BÀI VIẾT "</h3>
                    <div class="container bg-white">
                        <b-form method="post"  class="mt-3" @submit.prevent="CreateNew">
                            <b-form-group
                                id="input-group-1"
                                label="Tên bài viết:"
                                label-for="input-1"
                            >
                                <b-form-input
                                    id="input-1"
                                    v-model="NewTitle"
                                    placeholder="Nhập tên bài viết"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-2" label="Nội dung:" label-for="input-2">
                                <b-form-textarea
                                    id="input-2"
                                    v-model="NewComment"
                                    placeholder="Nhập nội dung của bài viết"
                                    required
                                ></b-form-textarea>
                            </b-form-group>

                            <b-form-group id="input-group-3" label="Link ảnh bài viết:" label-for="input-3">
                                <b-form-input
                                    id="input-3"
                                    v-model="NewImg"
                                    placeholder="Nhập link ảnh của bài viết"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-4" label="Link bài viết:" label-for="input-4">
                                <b-form-input
                                    id="input-4"
                                    v-model="NewLink"
                                    placeholder="Nhập link bài viết"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-5" label="Tên thể lọai:" label-for="input-5">
                                <b-form-select
                                    id="input-5"
                                    v-model="NewCategory"
                                    required
                                    >
                                        <option v-for="(cate, index) in listNewCate" :key="index" :value="cate.newCateId">
                                            {{ cate.newCateName }}
                                        </option>
                                </b-form-select>
                            </b-form-group>


                            <b-button style="margin: auto; display:block;" type="submit" variant="success">Create</b-button>
                        </b-form>
                    </div>
                </b-tab>
            </b-tabs>
        </b-tab>
        <!-- Danh mục bài viết-->
        <b-tab title="Danh mục bài viết" :title-link-class="linkClass(2)">
            <b-tabs v-model="tabNewCate" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng danh mục bài viết-->
                <b-tab title="Bảng danh mục bài viết"  :title-link-class="linkClassNewCategories(0)">
                    <h3 class="text-center mt-4">" TẤT CẢ DANH MỤC BÀI VIẾT "</h3>
                    <div style="text-align:center;">
                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                    </div>
                    <div class="container bg-white">
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên danh mục bài viết</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(newCate,index) in filteredNewCate" :key="index">
                                    <th scope="row">{{ newCate.newCateId }}</th>
                                    <td>{{ newCate.newCateName }}</td>
                                    <!-- <td><a type="button" class="btn btn-success" :href="getNewCategoryEditurl(newCate.newCateId)">Edit</a></td>
                                    <td><button class="btn btn-danger" @click="DeleteNewCategories(newCate.newCateId)" >Delete</button></td> -->
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </b-tab>
                <!--Thêm danh mục bài viết-->
                <b-tab title="Thêm danh mục bài viết" :title-link-class="linkClassNewCategories(1)">
                    <h3 class="text-center mt-4">" THÊM DANH MỤC BÀI VIẾT "</h3>
                    <div class="container bg-white">
                        <b-form method="post"  class="mt-3" @submit.prevent="CreateNewCategories">
                            <b-form-group
                                id="input-group-1"
                                label="Tên danh mục bài viết:"
                                label-for="input-1"
                            >
                                <b-form-input
                                    id="input-1"
                                    v-model="newCateName"
                                    placeholder="Nhập tên danh mục bài viết"
                                    required
                                ></b-form-input>
                            </b-form-group>
                            <b-button style="margin: auto; display:block;" type="submit" variant="success">Create</b-button>
                        </b-form>
                    </div>
                </b-tab>
            </b-tabs>
        </b-tab>


      </b-tabs>
    </div>
  </div>
</template>

<script>
import Vue from "vue"
import VueSimpleAlert from "vue-simple-alert"
import catalogApi from '@/api/catalogApi'
Vue.use(VueSimpleAlert);
  export default {
    layout: 'default',
    middleware: ['isAuthorize'],
    data() {
      return {
        search:'',
        tab: 0,
        tabCarousel: 0,
        tabNew: 0,
        tabNewCate:0,
        // Carousel
        listCarousel: [],
        CarouselId: '',
        CarouselCaption: '',
        CarouselContent: '',
        CarouselImg: '',
        CarouselLink: '',
        // bài viết
        listNew: [],
        NewId: '',
        NewTitle:'',
        NewComment:'',
        NewImg: '',
        NewLink: '',
        NewCategory:'',
        // Danh mục bài viết
        listNewCate:[],
        newCateId:'',
        newCateName:'',
        pageSizeNew: 6,
        pageIndexNew: 0,
      }
    },
    computed:{
        filteredCarousel(){
            return this.listCarousel.filter((Carousel) =>{
                return Carousel.caption.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredNew(){
            return this.listNew.filter((New) =>{
                return New.newTitle.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredNewCate(){
            return this.listNewCate.filter((NewCate) =>{
                return NewCate.newCateName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        NewOfCurrPage () {
            return this.filteredNew.slice(this.pageSizeNew * this.pageIndexNew, this.pageSizeNew * (this.pageIndexNew+1))
        },

    },

    async created(){
        await this.getCarousel()
        await this.getNew()
        await this.getNewCate()
    },

    methods: {
        linkClass(idx) {
            if (this.tab === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassCarousel(idx){
            if (this.tabCarousel === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassNew(idx){
            if (this.tabNew === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassNewCategories(idx){
            if (this.tabNewCate === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
               
        // danh mục
        async getCarousel(){
                try{
                const { data } = await catalogApi.getCarousel(this.$axios)
                console.log(data)
                this.listCarousel = data
                }catch(err){
                console.log(err)
                }
        },

        async CreateCarousel() {
            try {
            await this.$axios.post('/api/Carousels', {
                caption: this.CarouselCaption,
                text: this.CarouselContent,
                img: this.CarouselImg,
                link: this.CarouselLink,
            })
            alert('Thêm carousel thành công!')
            this.$router.go()
            // this.$router.push('/home')
            } 
            catch (err) {
            console.log(err)
            }
        },


        DeleteCarousel(id)
        {
            this.$confirm("Bạn có muốn xóa quảng cáo này không?").then(() => {
                this.$axios.delete('/api/Carousels/'+ id ).then(() =>{
                    this.getCarousel()
                })
            })
        },

        getCarouselEditurl(CarouselEditId){
            const url= 'CarouselEdit/'+ CarouselEditId;
            return url;
        },

        // bài viết
        async getNew(){
                try{
                const { data } = await catalogApi.getNew(this.$axios)
                console.log(data)
                this.listNew = data
                }catch(err){
                console.log(err)
                }
        },

        async CreateNew() {
            try {
            await this.$axios.post('/api/News', {
                newTitle: this.NewTitle,
                newComment: this.NewComment,
                newImg: this.NewImg,
                newLink: this.NewLink,
                newCategory: this.NewCategory,
            })
            alert('Thêm bài viết thành công!')
            this.$router.go()
            // this.$router.push('/home')
            } 
            catch (err) {
            console.log(err)
            }
        },


        DeleteNew(id)
        {
            this.$confirm("Bạn có muốn xóa bài viết này không?").then(() => {
                this.$axios.delete('/api/News/'+ id ).then(() =>{
                    this.getNew()
                })
            });
        },

        getNewEditurl(NewEditId){
            const url= 'NewEdit/'+ NewEditId;
            return url;
        },
        gotoPrevNew() {this.pageIndexNew -=1},
        gotoNextNew() {this.pageIndexNew +=1},

        // danh mục

        async getNewCate(){
                try{
                    const { data } = await catalogApi.getNewCate(this.$axios)
                    console.log(data)
                    this.listNewCate = data
                }catch(err){
                    console.log(err)
                }
        },

        async CreateNewCategories() {
            try {
            await this.$axios.post('/api/NewsCategories', {
                newCateName: this.newCateName,
            })
            alert('Thêm danh mục bài viết thành công!')
            this.$router.go()
            // this.$router.push('/home')
            } 
            catch (err) {
            console.log(err)
            }
        },

        DeleteNewCategories(id)
        {
            this.$axios.delete('/api/NewsCategories/'+ id ).then(() =>{
                this.getNewCate()
            })
        },

        getNewCategoryEditurl(NewCategoryEditId){
            const url= 'NewCategoryEdit/'+ NewCategoryEditId;
            return url;
        },

    }
}
</script>