<template>
    <main>
        <div>
            <div class="container">
                <a href="/adsNnew" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT BÀI VIẾT "</h3>
            <div class="container bg-white">
                <b-form method="put"  @submit.prevent="UpdateNew(New)" class="mt-3">
                    <b-form-group id="input-group-1" label="ID bài viết:" label-for="input-1">
                                <b-form-input
                                    id="input-1"
                                    v-model="New.newId"
                                    disabled
                                ></b-form-input>
                            </b-form-group>
                    <b-form-group
                                id="input-group-2"
                                label="Tên bài viết:"
                                label-for="input-2"
                            >
                                <b-form-input
                                    id="input-2"
                                    v-model="New.newTitle"
                                    placeholder="Nhập tên bài viết cần cập nhật"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-3" label="Nội dung:" label-for="input-3">
                                <b-form-textarea
                                    id="input-3"
                                    v-model="New.newComment"
                                    placeholder="Nhập nội dung của bài viết cần cập nhật"
                                    required
                                ></b-form-textarea>
                            </b-form-group>

                            <b-form-group
                                id="input-group-4"
                                label="Link ảnh bài viết:"
                                label-for="input-4"
                            >
                                <b-form-input
                                    id="input-4"
                                    v-model="New.newImg"
                                    placeholder="Nhập link ảnh bài viết cần cập nhật"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="input-group-5"
                                label="Link bài viết:"
                                label-for="input-5"
                            >
                                <b-form-input
                                    id="input-5"
                                    v-model="New.newLink"
                                    placeholder="Nhập link bài viết cần cập nhật"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-6" label="Tên thể lọai:" label-for="input-6">
                                <b-form-select
                                    id="input-6"
                                    v-model="New.newCategory"
                                    required
                                    >
                                        <option v-for="(cate, index) in listNewCate" :key="index" :value="cate.newCateId">
                                            {{ cate.newCateName }}
                                        </option>
                                </b-form-select>
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
        const New = await $axios.$get(`api/News/${params.NewEditId}`)
        return { New }
    },
    data(){
        return{
            listNew: [],
            listNewCate: [],
        }
    },

    async created(){
        await this.getNewCate()
    },

    methods:{
        async UpdateNew(New) {
            try {
            await this.$axios.put('/api/News/' + New.newId, {
                newId: New.newId,
                newTitle: New.newTitle,
                newComment: New.newComment,
                newImg: New.newImg,
                newLink: New.newLink,
                newCategory: New.newCategory,
                newCategoryName: New.newCategoryName,
            })
            this.$router.push('/adsNnew')
            } 
            catch (err) {
            console.log(err)
            }
        },

        async getNewCate(){
                try{
                const { data } = await catalogApi.getNewCate(this.$axios)
                console.log(data)
                this.listNewCate = data
                }catch(err){
                console.log(err)
                }
        },
    }
}
</script>