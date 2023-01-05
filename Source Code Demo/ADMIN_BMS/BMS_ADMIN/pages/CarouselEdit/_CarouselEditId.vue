<template>
    <main>
        <div>
            <div class="container">
                <a href="/adsNnew" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT CAROUSEL "</h3>
            <div class="container bg-white">
                <b-form method="put"  @submit.prevent="UpdateCarousel(Carousel)" class="mt-3">
                      <b-form-group id="input-group-1" label="ID Carousel:" label-for="input-1">
                                <b-form-input
                                    id="input-1"
                                    v-model="Carousel.carouselId"
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
                                    v-model="Carousel.caption"
                                    placeholder="Nhập tên Carousel cần cập nhật"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-3" label="Nội dung Carousel:" label-for="input-3">
                                <b-form-textarea
                                    id="input-3"
                                    v-model="Carousel.text"
                                    placeholder="Nhập nội dung của Carousel cần cập nhật"
                                    required
                                ></b-form-textarea>
                            </b-form-group>

                            <b-form-group
                                id="input-group-4"
                                label="Link ảnh Carousel:"
                                label-for="input-4"
                            >
                                <b-form-input
                                    id="input-4"
                                    v-model="Carousel.img"
                                    placeholder="Nhập link ảnh Carousel cần cập nhật"
                                    required
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="input-group-5"
                                label="Link bài viết Carousel:"
                                label-for="input-5"
                            >
                                <b-form-input
                                    id="input-5"
                                    v-model="Carousel.link"
                                    placeholder="Nhập link bài viết Carousel cần cập nhật"
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
        const Carousel = await $axios.$get(`api/Carousels/${params.CarouselEditId}`)
        return { Carousel }
    },

    methods:{
        async UpdateCarousel(Carousel) {
            try {
            await this.$axios.put('/api/Carousels/' + Carousel.carouselId, {
                carouselId: Carousel.carouselId,
                caption: Carousel.caption,
                text: Carousel.text,
                img: Carousel.img,
                link: Carousel.link,
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