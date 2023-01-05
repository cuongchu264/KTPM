<template>
    <main>
        <div>
            <div class="container">
                <a href="/adsNnew" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT DANH MỤC BÀI VIẾT "</h3>
            <div class="container bg-white">
                <b-form method="put"  class="mt-3" @submit.prevent="UpdateNewCategories(NewCate)">
                      <b-form-group id="input-group-1" label="ID:" label-for="input-1">
                                <b-form-input
                                    id="input-1"
                                    v-model="NewCate.newCateId"
                                    disabled
                                ></b-form-input>
                            </b-form-group>
                        
                            <b-form-group
                                id="input-group-2"
                                label="Tên danh mục bài viết:"
                                label-for="input-2"
                            >
                                <b-form-input
                                    id="input-2"
                                    v-model="NewCate.newCateName"
                                    placeholder="Nhập tên danh mục bài viết cần cập nhật"
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
export default {
    middleware: ['isAuthorize'],
    async asyncData({ $axios,params}) {
        const NewCate = await $axios.$get(`api/NewsCategories/${params.NewCategoryEditId}`)
        return { NewCate }
    },
    methods:{
        async UpdateNewCategories(NewCate) {
            try {
            await this.$axios.put('/api/NewsCategories/' + NewCate.newCateId, {
                newCateId: NewCate.newCateId,
                NewCateName: NewCate.newCateName
            })
            this.$router.push('/adsNnew')
            } 
            catch (err) {
            console.log(err)
            }
        },
    }
}
</script>