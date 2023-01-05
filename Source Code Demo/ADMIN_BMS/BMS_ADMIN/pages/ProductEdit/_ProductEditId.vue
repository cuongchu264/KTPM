<template>
    <main>
        <div>
            <div class="container">
                <a href="/productsNcategories" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT SẢN PHẨM "</h3>
            <div class="container bg-white">
                <b-form method="put"  class="mt-3" @submit.prevent="UpdateProduct(product)">
                    <!-- ID -->
                    <b-form-group
                        id="input-group-1"
                        label="ID sản phẩm:"
                        label-for="input-1"
                        >
                        <b-form-input
                                                id="input-1"
                                                v-model="product.productId"
                                                disabled
                        ></b-form-input>
                    </b-form-group>
                                        
                    <!-- Name -->
                    <b-form-group
                                            id="input-group-2"
                                            label="Tên sản phẩm:"
                                            label-for="input-2"
                                        >
                                            <b-form-input
                                                id="input-2"
                                                v-model="product.productName"
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
                                                v-model="product.categoryId"
                                                required
                                            >
                                                <option v-for="(cate, index) in listcate" :key="index" :value="cate.categoryId">
                                                    {{ cate.categoryName }}
                                                </option>
                                            </b-form-select>
                    </b-form-group>

                    <!-- price -->
                    <b-form-group
                                            id="input-group-4"
                                            label="Giá tiền($):"
                                            label-for="input-4"
                                        >
                                            <b-form-input
                                                id="input-4"
                                                v-model="product.price"
                                                
                                                required
                                            ></b-form-input>
                    </b-form-group>
                                        
                    <!-- image -->
                    <b-form-group id="input-group-5" label="Link ảnh sản phẩm:" label-for="input-5">
                                            <b-form-input
                                                id="input-5"
                                                v-model="product.avatar"
                                                
                                                required
                                            ></b-form-input>
                    </b-form-group>

                    <!-- description -->
                    <b-form-group id="input-group-6" label="Mô tả:" label-for="input-6">
                                            <b-form-textarea
                                            id="input-6"
                                            v-model="product.description"
                                            
                                            ></b-form-textarea>
                    </b-form-group>

                    <!-- quantity -->
                    <b-form-group id="input-group-7" label="Số lượng:" label-for="input-7">
                                            <b-form-input
                                                id="input-7"
                                                v-model="product.inStocks"
                                                required
                                            ></b-form-input>
                    </b-form-group>

                    <!-- img detail 1 -->
                    <b-form-group id="input-group-8" label="ảnh chi tiết 1:" label-for="input-8">
                        <b-form-input
                        id="input-8"
                        v-model="product.img1"
                        placeholder="Nhập ảnh chi tiết 1 của sản phẩm"
                        ></b-form-input>
                    </b-form-group>

                    <!-- img detail 2 -->
                    <b-form-group id="input-group-9" label="ảnh chi tiết 2:" label-for="input-9">
                        <b-form-input
                        id="input-9"
                        v-model="product.img2"
                        placeholder="Nhập ảnh chi tiết 2 của sản phẩm"
                        ></b-form-input>
                    </b-form-group>

                    <!-- img detail 3 -->
                    <b-form-group id="input-group-10" label="ảnh chi tiết 3:" label-for="input-10">
                        <b-form-input
                        id="input-10"
                        v-model="product.img3"
                        placeholder="Nhập ảnh chi tiết 3 của sản phẩm"
                        ></b-form-input>
                    </b-form-group>

                    <!-- img detail 4 -->
                    <b-form-group id="input-group-11" label="ảnh chi tiết 4:" label-for="input-11">
                        <b-form-input
                        id="input-11"
                        v-model="product.img4"
                        placeholder="Nhập ảnh chi tiết 4 của sản phẩm"
                        ></b-form-input>
                    </b-form-group>
                    <b-button style="margin: auto; display:block;" type="submit" variant="success">Update</b-button>
                </b-form>
            </div>
        </div>
    </main>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
    middleware: ['isAuthorize'],
    async asyncData({ $axios,params}) {
        const product = await $axios.$get(`api/Products/${params.ProductEditId}`)
        return { product }
    },
    data(){
        return{
            listcate:[],
            listNike: [],
            listDas: [],
            listVans: [],
            listCon: [],
        }
    },

    async created(){
        await this.getCategories()
    },

    methods:{
        async UpdateProduct(product) {
            try {
            await this.$axios.put('/api/Products/' + product.productId, {
                productId: product.productId,
                productName: product.productName,
                categoryId: product.categoryId,
                price: product.price,
                avatar: product.avatar,
                description: product.description,
                inStocks: product.inStocks,
                img1: product.img1,
                img2: product.img2,
                img3: product.img3,
                img4: product.img4
            })
            this.$router.push('/productsNcategories')
            } 
            catch (err) {
            console.log(err)
            }
        },
        async  getCategories(){
                try{
                const { data } = await catalogApi.getCategories(this.$axios)
                console.log(data)
                this.listcate = data
                }catch(err){
                console.log(err)
                }
        },
    }
}
</script>