<template>
  <div>
    <div class="mt-4">
      <b-tabs v-model="tabCate" active-nav-item-class="font-weight-bold text-uppercase text-success" pills card vertical>
        <!-- Danh mục -->
        <b-tab title="Danh mục" :title-link-class="linkClass(0)">
            <b-tabs v-model="tabCateDetail" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng danh mục-->
                <b-tab title="Bảng danh mục"  active :title-link-class="linkClassCateDetail(0)">
                    <h3 class="text-center mt-4">" TẤT CẢ DANH MỤC "</h3>
                    <div style="text-align:center;">
                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                    </div>
                    <div class="container bg-white">
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên danh mục</th>
                                <th scope="col">Link ảnh danh mục</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(cate,index) in filteredCate" :key="index">
                                    <th scope="row">{{ cate.categoryId }}</th>
                                    <td>{{ cate.categoryName }}</td>
                                    <td>{{ cate.avatar }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </b-tab>
                <!--Thêm danh mục-->
                <b-tab title="Thêm danh mục" :title-link-class="linkClassCateDetail(1)">
                    <h3 class="text-center mt-4">" THÊM DANH MỤC "</h3>
                    <div class="container bg-white">
                        <b-form method="post"  class="mt-3" @submit.prevent="CreateCategories">
                            <b-form-group
                                id="input-group-1"
                                label="Tên danh mục:"
                                label-for="input-1"
                            >
                                <b-form-input
                                    id="input-1"
                                    v-model="categoryName"
                                    placeholder="Nhập tên danh mục"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-2" label="Link ảnh danh mục:" label-for="input-2">
                                <b-form-input
                                    id="input-2"
                                    v-model="avatarCate"
                                    placeholder="Nhập link ảnh của danh mục"
                                    required
                                ></b-form-input>
                            </b-form-group>
                            <b-button style="margin: auto; display:block;" type="submit" variant="success">Create</b-button>
                        </b-form>
                    </div>
                </b-tab>
            </b-tabs>
        </b-tab>
        
        <!-- Sản phẩm -->
        <b-tab title="Sản phẩm" :title-link-class="linkClass(1)">
            <b-tabs v-model="tabProduct" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng sản phẩm-->
                <b-tab title="Bảng sản phẩm"  active :title-link-class="linkClassProduct(0)">
                    <div class="accordion" role="tablist">
                        <!-- NIKE -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-1 block variant="success">GẠCH TRANG TRÍ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-1" visible accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <div class="mb-5">
                                            <span  style="float:right;">Sản phẩm: 
                                               <select v-model="pageSizeNike" placeholder="Page Size">
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
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Nike,index) in NikeOfCurrPage" :key="index">
                                                    <th scope="row">{{ Nike.productId }}</th>
                                                    <td>{{ Nike.productName }}</td>
                                                    <td class="text-center">{{ Nike.price }}</td>
                                                    <td class="text-center">{{ Nike.inStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getProductEditurl(Nike.productId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteProduct(Nike.productId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    <p class="text-center"><a  v-if="pageIndexNike>0" type="button" class="btn btn-success" @click="gotoPrevNike()">Prev</a> Trang {{pageIndexNike + 1}} <a v-if="pageIndexNike<=NikeOfCurrPage.length" class="btn btn-success" @click="gotoNextNike()">Next</a></p>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- ADIDAS -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-2 block variant="success">VẬT LIỆU THÔ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-2" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <div class="mb-5">
                                            <span  style="float:right;">Sản phẩm: 
                                               <select v-model="pageSizeDas" placeholder="Page Size">
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
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Das,index) in DasOfCurrPage" :key="index">
                                                    <th scope="row">{{ Das.productId }}</th>
                                                    <td>{{ Das.productName }}</td>
                                                    <td class="text-center">{{ Das.price }}</td>
                                                    <td class="text-center">{{ Das.inStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getProductEditurl(Das.productId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteProduct(Das.productId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    <p class="text-center"><a  v-if="pageIndexDas>0" type="button" class="btn btn-success" @click="gotoPrevDas()">Prev</a> Trang {{pageIndexDas + 1}} <a v-if="pageIndexDas<=DasOfCurrPage.length" class="btn btn-success" @click="gotoNextDas()">Next</a></p>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- VANS -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-3 block variant="success">THIẾT BỊ NGÀNH NƯỚC</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-3" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <div class="mb-5">
                                            <span  style="float:right;">Sản phẩm: 
                                               <select v-model="pageSizeVans" placeholder="Page Size">
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
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Vans,index) in VansOfCurrPage" :key="index">
                                                    <th scope="row">{{ Vans.productId }}</th>
                                                    <td>{{ Vans.productName }}</td>
                                                    <td class="text-center">{{ Vans.price }}</td>
                                                    <td class="text-center">{{ Vans.inStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getProductEditurl(Vans.productId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteProduct(Vans.productId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    <p class="text-center"><a  v-if="pageIndexVans>0" type="button" class="btn btn-success" @click="gotoPrevVans()">Prev</a> Trang {{pageIndexVans + 1}} <a v-if="pageIndexVans<=VansOfCurrPage.length" class="btn btn-success" @click="gotoNextVans()">Next</a></p>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- CONVERSE -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-4 block variant="success">NGÓI LỢP NHÀ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-4" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <div class="mb-5">
                                            <span  style="float:right;">Sản phẩm: 
                                               <select v-model="pageSizeCon" placeholder="Page Size">
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
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Con,index) in ConOfCurrPage" :key="index">
                                                    <th scope="row">{{ Con.productId }}</th>
                                                    <td>{{ Con.productName }}</td>
                                                    <td class="text-center">{{ Con.price }}</td>
                                                    <td class="text-center">{{ Con.inStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getProductEditurl(Con.productId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteProduct(Con.productId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    <p class="text-center"><a  v-if="pageIndexCon>0" type="button" class="btn btn-success" @click="gotoPrevCon()">Prev</a> Trang {{pageIndexCon + 1}} <a v-if="pageIndexCon<=ConOfCurrPage.length" class="btn btn-success" @click="gotoNextCon()">Next</a></p>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                    </div>
                </b-tab>
                <!--Thêm sản phẩm-->
                <b-tab title="Thêm sản phẩm" :title-link-class="linkClassProduct(1)">
                                <h3 class="text-center mt-4">" THÊM SẢN PHẨM "</h3>
                                <div class="container bg-white">
                                    <b-form method="post"  class="mt-3" @submit.prevent="CreateProduct">
                                        <!-- Name -->
                                        <b-form-group
                                            id="input-group-1"
                                            label="Tên sản phẩm:"
                                            label-for="input-1"
                                        >
                                            <b-form-input
                                                id="input-1"
                                                v-model="ProductName"
                                                placeholder="Nhập tên của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>
                                        
                                        <!-- category ID -->
                                        <b-form-group
                                            id="input-group-2"
                                            label="ID danh mục:"
                                            label-for="input-2"
                                        >
                                            <b-form-select
                                                id="input-2"
                                                v-model="ProductCate"
                                                placeholder="Nhập ID danh mục của sản phẩm"
                                                required
                                            >
                                                <option v-for="(cate, index) in listcate" :key="index" :value="cate.categoryId">
                                                    {{ cate.categoryName }}
                                                </option>
                                            </b-form-select>
                                        </b-form-group>

                                        <!-- price -->
                                        <b-form-group
                                            id="input-group-3"
                                            label="Giá tiền($):"
                                            label-for="input-3"
                                        >
                                            <b-form-input
                                                id="input-3"
                                                v-model="ProductPrice"
                                                placeholder="Nhập giá tiền của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>
                                        
                                        <!-- image -->
                                        <b-form-group id="input-group-4" label="Link ảnh sản phẩm:" label-for="input-4">
                                            <b-form-input
                                                id="input-4"
                                                v-model="ProductAvatar"
                                                placeholder="Nhập link ảnh của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- description -->
                                        <b-form-group id="input-group-5" label="Mô tả:" label-for="input-5">
                                            <b-form-textarea
                                            id="input-5"
                                            v-model="ProductDescription"
                                            placeholder="Nhập mô tả của sản phẩm"
                                            ></b-form-textarea>
                                        </b-form-group>

                                        <!-- quantity -->
                                        <b-form-group id="input-group-6" label="Số lượng:" label-for="input-6">
                                            <b-form-input
                                                id="input-6"
                                                v-model="ProductQuantity"
                                                placeholder="Nhập số lượng của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 1 -->
                                        <b-form-group id="input-group-7" label="ảnh chi tiết 1:" label-for="input-7">
                                            <b-form-input
                                                id="input-7"
                                                v-model="Img1"
                                                placeholder="Nhập ảnh chi tiết 1 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 2 -->
                                        <b-form-group id="input-group-8" label="ảnh chi tiết 2:" label-for="input-8">
                                            <b-form-input
                                                id="input-8"
                                                v-model="Img2"
                                                placeholder="Nhập ảnh chi tiết 2 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 3 -->
                                        <b-form-group id="input-group-9" label="ảnh chi tiết 3:" label-for="input-9">
                                            <b-form-input
                                                id="input-9"
                                                v-model="Img3"
                                                placeholder="Nhập ảnh chi tiết 3 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 4 -->
                                        <b-form-group id="input-group-10" label="ảnh chi tiết 4:" label-for="input-10">
                                            <b-form-input
                                                id="input-10"
                                                v-model="Img4"
                                                placeholder="Nhập ảnh chi tiết 4 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>
                                        <b-button style="margin: auto; display:block;" type="submit" variant="success">Create</b-button>
                                    </b-form>
                                </div>
                </b-tab>
            </b-tabs>
        </b-tab>

        <!-- Sản phẩm hot -->
        <b-tab title="Sản phẩm hot" :title-link-class="linkClass(2)">
            <b-tabs v-model="tabHotProduct" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                <!--Bảng sản phẩm-->
                <b-tab title="Bảng sản phẩm"  active :title-link-class="linkClassHotProduct(0)">
                    <div class="accordion" role="tablist">
                        <!-- NIKE -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-1 block variant="success">NGÓI LỢP NHÀ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-1" visible accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <table class="table mt-4">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Nike,index) in filteredHotNike" :key="index">
                                                    <th scope="row">{{ Nike.hotProductId }}</th>
                                                    <td>{{ Nike.hotProductName }}</td>
                                                    <td class="text-center">{{ Nike.hpPrice }}</td>
                                                    <td class="text-center">{{ Nike.hpInStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getHotProductEditurl(Nike.hotProductId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteHotProduct(Nike.hotProductId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- ADIDAS -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-2 block variant="success">VẬT LIỆU THÔ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-2" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <table class="table mt-4">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Das,index) in filteredHotDas" :key="index">
                                                    <th scope="row">{{ Das.hotProductId }}</th>
                                                    <td>{{ Das.hotProductName }}</td>
                                                    <td class="text-center">{{ Das.hpPrice }}</td>
                                                    <td class="text-center">{{ Das.hpInStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getHotProductEditurl(Das.hotProductId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteHotProduct(Das.hotProductId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- VANS -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-3 block variant="success">THIẾT BỊ NGÀNH NƯỚC</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-3" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <table class="table mt-4">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Vans,index) in filteredHotVans" :key="index">
                                                    <th scope="row">{{ Vans.hotProductId }}</th>
                                                    <td>{{ Vans.hotProductName }}</td>
                                                    <td class="text-center">{{ Vans.hpPrice }}</td>
                                                    <td class="text-center">{{ Vans.hpInStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getHotProductEditurl(Vans.hotProductId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteHotProduct(Vans.hotProductId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                        <!-- CONVERSE -->
                        <b-card no-body class="mb-1">
                            <b-card-header header-tag="header" class="p-1" role="tab">
                                <b-button v-b-toggle.accordion-4 block variant="success">NGÓI LỢP NHÀ</b-button>
                            </b-card-header>
                            <b-collapse id="accordion-4" accordion="my-accordion" role="tabpanel">
                                <b-card-body>
                                    <h3 class="text-center mt-4">" TẤT CẢ SẢN PHẨM "</h3>
                                    <div style="text-align:center;">
                                        <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    </div>
                                    <div class="container bg-white">
                                        <table class="table mt-4">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên sản phẩm</th>
                                                    <th scope="col" class="text-center">Giá tiền(VND)</th>
                                                    <th scope="col" class="text-center">Số lượng</th>
                                                </tr>
                                            </thead>
                                                <tbody >
                                                <tr v-for="(Con,index) in filteredHotCon" :key="index">
                                                    <th scope="row">{{ Con.hotProductId }}</th>
                                                    <td>{{ Con.hotProductName }}</td>
                                                    <td class="text-center">{{ Con.hpPrice }}</td>
                                                    <td class="text-center">{{ Con.hpInStocks }}</td>
                                                    <td><a type="button" class="btn btn-success" :href="getHotProductEditurl(Con.hotProductId)">Edit</a></td>
                                                    <td><button class="btn btn-danger" @click="DeleteHotProduct(Con.hotProductId)" >Delete</button></td>
                                                </tr>
                                                </tbody>
                                        </table>
                                    </div>
                                </b-card-body>
                            </b-collapse>
                        </b-card>
                    </div>
                </b-tab>
                <!--Thêm sản phẩm-->
                <b-tab title="Thêm sản phẩm" :title-link-class="linkClassHotProduct(1)">
                                <h3 class="text-center mt-4">" THÊM SẢN PHẨM "</h3>
                                <div class="container bg-white">
                                    <b-form method="post"  class="mt-3" @submit.prevent="CreateHotProduct">
                                        <!-- Name -->
                                        <b-form-group
                                            id="input-group-1"
                                            label="Tên sản phẩm:"
                                            label-for="input-1"
                                        >
                                            <b-form-input
                                                id="input-1"
                                                v-model="HotProductName"
                                                placeholder="Nhập tên của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>
                                        
                                        <!-- category ID -->
                                        <b-form-group
                                            id="input-group-2"
                                            label="ID danh mục:"
                                            label-for="input-2"
                                        >
                                            <b-form-select
                                                id="input-2"
                                                v-model="HotProductCate"
                                                required
                                            >
                                                <option v-for="(cate, index) in listcate" :key="index" :value="cate.categoryId">
                                                    {{ cate.categoryName }}
                                                </option>
                                            </b-form-select>
                                        </b-form-group>

                                        <!-- price -->
                                        <b-form-group
                                            id="input-group-3"
                                            label="Giá tiền($):"
                                            label-for="input-3"
                                        >
                                            <b-form-input
                                                id="input-3"
                                                v-model="HotProductPrice"
                                                placeholder="Nhập giá tiền của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>
                                        
                                        <!-- image -->
                                        <b-form-group id="input-group-4" label="Link ảnh sản phẩm:" label-for="input-4">
                                            <b-form-input
                                                id="input-4"
                                                v-model="HotProductAvatar"
                                                placeholder="Nhập link ảnh của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- description -->
                                        <b-form-group id="input-group-5" label="Mô tả:" label-for="input-5">
                                            <b-form-textarea
                                            id="input-5"
                                            v-model="HotProductDescription"
                                            placeholder="Nhập mô tả của sản phẩm"
                                            ></b-form-textarea>
                                        </b-form-group>

                                        <!-- quantity -->
                                        <b-form-group id="input-group-6" label="Số lượng:" label-for="input-6">
                                            <b-form-input
                                                id="input-6"
                                                v-model="HotProductQuantity"
                                                placeholder="Nhập số lượng của sản phẩm"
                                                required
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 1 -->
                                        <b-form-group id="input-group-7" label="ảnh chi tiết 1:" label-for="input-7">
                                            <b-form-input
                                                id="input-7"
                                                v-model="HotImg1"
                                                placeholder="Nhập ảnh chi tiết 1 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 2 -->
                                        <b-form-group id="input-group-8" label="ảnh chi tiết 2:" label-for="input-8">
                                            <b-form-input
                                                id="input-8"
                                                v-model="HotImg2"
                                                placeholder="Nhập ảnh chi tiết 2 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 3 -->
                                        <b-form-group id="input-group-9" label="ảnh chi tiết 3:" label-for="input-9">
                                            <b-form-input
                                                id="input-9"
                                                v-model="HotImg3"
                                                placeholder="Nhập ảnh chi tiết 3 của sản phẩm"
                                            ></b-form-input>
                                        </b-form-group>

                                        <!-- img detail 4 -->
                                        <b-form-group id="input-group-10" label="ảnh chi tiết 4:" label-for="input-10">
                                            <b-form-input
                                                id="input-10"
                                                v-model="HotImg4"
                                                placeholder="Nhập ảnh chi tiết 4 của sản phẩm"
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
        tabCate: 0,
        tabCateDetail: 0,
        tabProduct: 0,
        tabHotProduct: 0,
        // danh mục
        listcate: [],
        categoryId: '',
        categoryName: '',
        avatarCate: '',
        // sản phẩm
        listNike: [],
        listDas: [],
        listVans: [],
        listCon: [],
        ProductId: '',
        ProductName:'',
        ProductCate:'',
        ProductPrice: '',
        ProductAvatar: '',
        ProductDescription:'',
        ProductQuantity: '',
        Img1:'',
        Img2:'',
        Img3:'',
        Img4:'',
        // sản phẩm hot
        listHotNike: [],
        listHotDas: [],
        listHotVans: [],
        listHotCon: [],
        HotProductId: '',
        HotProductName: '',
        HotProductCate: '',
        HotProductPrice: '',
        HotProductAvatar: '',
        HotProductDescription: '',
        HotProductQuantity: '',
        HotImg1:'',
        HotImg2:'',
        HotImg3:'',
        HotImg4:'',
        // danh mục 3 6 9
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
    computed:{
        filteredCate(){
            return this.listcate.filter((cate) =>{
                return cate.categoryName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredNike(){
            return this.listNike.filter((Nike) =>{
                return Nike.productName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredDas(){
            return this.listDas.filter((Das) =>{
                return Das.productName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredVans(){
            return this.listVans.filter((Vans) =>{
                return Vans.productName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredCon(){
            return this.listCon.filter((Con) =>{
                return Con.productName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredHotNike(){
            return this.listHotNike.filter((Con) =>{
                return Con.hotProductName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredHotDas(){
            return this.listHotDas.filter((Con) =>{
                return Con.hotProductName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredHotVans(){
            return this.listHotVans.filter((Con) =>{
                return Con.hotProductName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        filteredHotCon(){
            return this.listHotCon.filter((Con) =>{
                return Con.hotProductName.toLowerCase().match(this.search.toLowerCase())
            });
        },
        NikeOfCurrPage () {
            return this.filteredNike.slice(this.pageSizeNike * this.pageIndexNike, this.pageSizeNike * (this.pageIndexNike+1))
        },
        DasOfCurrPage () {
            return this.filteredDas.slice(this.pageSizeDas * this.pageIndexDas, this.pageSizeDas * (this.pageIndexDas+1))
        },
        VansOfCurrPage () {
            return this.filteredVans.slice(this.pageSizeVans * this.pageIndexVans, this.pageSizeVans * (this.pageIndexVans+1));

        },
        ConOfCurrPage () {
            return this.filteredCon.slice(this.pageSizeCon * this.pageIndexCon, this.pageSizeCon * (this.pageIndexCon+1));
        },
    },

    async created(){
        await this.getAllCate()
        await this.getNike()
        await this.getDas()
        await this.getVans()
        await this.getCon()
        await this.getHotNike()
        await this.getHotDas()
        await this.getHotVans()
        await this.getHotCon()
    },

    methods: {
        linkClass(idx) {
            if (this.tabCate === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassCateDetail(idx){
            if (this.tabCateDetail === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassProduct(idx){
            if (this.tabProduct === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        linkClassHotProduct(idx){
            if (this.tabHotProduct === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },
        
        
        // danh mục
        async getAllCate(){
                try{
                const { data } = await catalogApi.getCategories(this.$axios)
                console.log(data)
                this.listcate = data
                }catch(err){
                console.log(err)
                }
        },

        async CreateCategories() {
            try {
            await this.$axios.post('/api/Categories', {
                categoryName: this.categoryName,
                avatar: this.avatarCate,
            })
            alert('Thêm danh mục thành công!')
            this.$router.go()
            // this.$router.push('/productsNcategories')
            } 
            catch (err) {
            console.log(err)
            }
        },


        DeleteCategories(id) {
            this.$axios.delete('/api/Categories/'+ id ).then(() =>{
                this.getAllCate()
            })
        },
        getCategoriesEditurl(CategoriesEditId){
            const url= 'CategoriesEdit/'+ CategoriesEditId;
            return url;
        },

        // sản phẩm
        async getNike(){
                try{
                const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 1 , 11 , 3)
                console.log(data)
                this.listNike = data
                }catch(err){
                console.log(err)
                }
        },

        async getDas(){
                try{
                const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 2 , 11 , 3)
                console.log(data)
                this.listDas = data
                }catch(err){
                console.log(err)
                }
        },

        async getVans(){
                try{
                const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 3 , 11 , 3)
                console.log(data)
                this.listVans = data
                }catch(err){
                console.log(err)
                }
        },

        async getCon(){
                try{
                const { data } = await catalogApi.getProductsviaCategoryId(this.$axios, 4 , 11 , 3)
                console.log(data)
                this.listCon = data
                }catch(err){
                console.log(err)
                }
        },

        async CreateProduct() {
            try {
            await this.$axios.post('/api/Products', {
                productName: this.ProductName,
                categoryId: this.ProductCate,
                price: this.ProductPrice,
                avatar: this.ProductAvatar,
                description: this.ProductDescription,
                inStocks: this.ProductQuantity,
                img1: this.Img1,
                img2: this.Img2,
                img3: this.Img3,
                img4: this.Img4,

            })
            alert('Thêm sản phẩm thành công!')
            this.$router.go()
            // this.$router.push('/productsNcategories')
            } 
            catch (err) {
            console.log(err)
            }
        },
        DeleteProduct(id) {
            this.$confirm("Bạn có muốn xóa sản phẩm này không?").then(() => {
                this.$axios.delete('/api/Products/'+ id ).then(() =>{
                    this.getNike()
                    this.getDas()
                    this.getVans()
                    this.getCon()
                })
            });
        },
        getProductEditurl(ProductEditId){
            const url= 'ProductEdit/'+ ProductEditId;
            return url;
        },
        gotoPrevNike() {this.pageIndexNike -=1},
        gotoNextNike() {this.pageIndexNike +=1},
        gotoPrevDas() {this.pageIndexDas -=1},
        gotoNextDas() {this.pageIndexDas +=1},
        gotoPrevVans() {this.pageIndexVans -=1},
        gotoNextVans() {this.pageIndexVans +=1},
        gotoPrevCon() {this.pageIndexCon -=1},
        gotoNextCon() {this.pageIndexCon +=1},

        // sản phẩm hot
        async getHotNike(){
                try{
                const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 1)
                console.log(data)
                this.listHotNike = data
                }catch(err){
                console.log(err)
                }
        },
        async getHotDas(){
                try{
                const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 2)
                console.log(data)
                this.listHotDas = data
                }catch(err){
                console.log(err)
                }
        },
        async getHotVans(){
                try{
                const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 3)
                console.log(data)
                this.listHotVans = data
                }catch(err){
                console.log(err)
                }
        },
        async getHotCon(){
                try{
                const { data } = await catalogApi.getHotProductsviaCategoryId(this.$axios, 4)
                console.log(data)
                this.listHotCon = data
                }catch(err){
                console.log(err)
                }
        },
        async CreateHotProduct() {
            try {
            await this.$axios.post('/api/HotProducts', {
                hotProductName: this.HotProductName,
                categoryId: this.HotProductCate,
                hpPrice: this.HotProductPrice,
                hpAvatar: this.HotProductAvatar,
                hpDescription: this.HotProductDescription,
                hpInStocks: this.HotProductQuantity,
                img1: this.HotImg1,
                img2: this.HotImg2,
                img3: this.HotImg3,
                img4: this.HotImg4,
            })
            alert('Thêm sản phẩm hot thành công!')
            this.$router.go()
            // this.$router.push('/productsNcategories')
            } 
            catch (err) {
            console.log(err)
            }
        },


        DeleteHotProduct(id) {
            this.$confirm("Bạn có muốn xóa sản phẩm này không?").then(() => {
                this.$axios.delete('/api/HotProducts/'+ id ).then(() =>{
                    this.getHotNike()
                    this.getHotDas()
                    this.getHotVans()
                    this.getHotCon()
                })
            });
        },
        getHotProductEditurl(HotProductEditId){
            const url= 'HotProductEdit/'+ HotProductEditId;
            return url;
        },
    }
}
</script>