<template>
    <main>
        <div>
            <div class="container">
                <a href="/productsNcategories" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT DANH MỤC "</h3>
            <div class="container bg-white">
                        <b-form method="put"  class="mt-3" @submit.prevent="UpdateCategories(cate)">
                            <b-form-group id="input-group-1" label="ID:" label-for="input-1">
                                <b-form-input
                                    id="input-1"
                                    v-model="cate.categoryId"
                                    placeholder="Nhập ID của danh mục cần cập nhật"
                                    disabled
                                ></b-form-input>
                            </b-form-group>
                        
                            <b-form-group
                                id="input-group-2"
                                label="Tên danh mục:"
                                label-for="input-2"
                            >
                                <b-form-input
                                    id="input-2"
                                    v-model="cate.categoryName"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-3" label="Link ảnh danh mục:" label-for="input-3">
                                <b-form-input
                                    id="input-3"
                                    v-model="cate.avatar"
                                    required
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
        const cate = await $axios.$get(`/api/Categories/${params.CategoriesEditId}`)
        return { cate }
    },
    data(){
        return{
            listcate: [],
        }
    },

    async created(){
        await this.getCategories()
    },

    methods:{
        async UpdateCategories(cate) {
            try {
            await this.$axios.put('/api/Categories/' + cate.categoryId, {
                categoryId: cate.categoryId,
                categoryName:cate.categoryName,
                avatar: cate.avatar,
            })
            this.$router.push('/productsNcategories')
            } 
            catch (err) {
            console.log(err)
            }
        },
        async getCategories(){
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