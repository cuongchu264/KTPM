<template>
<main>
    <h1 class="text-center mt-2">" GIỚI THIỆU "</h1>
    <section  style="background-image: url('https://cdn.pixabay.com/photo/2014/09/17/21/43/bricks-450106_960_720.jpg');">
        <div class="container mt-3">
            <div class="bg-white">
                <b-media>
                    <template #aside>
                        <b-img src="@/img/logo.png" height="75" width="78" alt="placeholder"></b-img>
                    </template>

                    <h5 class="mt-0">Building Material Shop</h5>
                    <p>
                        Xin chào quý khách! – Chào mừng quý khách đến với Website bán hàng của <strong> BMS</strong>. 
                    </p>

                    <b-media class="mt-3" v-for="(founder,index) in listFounder" :key="index">
                        <template #aside>
                        <b-img :src="founder.founderImg" width="64" rounded="circle"></b-img>
                        </template>

                        <h5 class="mt-0">{{ founder.founderName }}</h5>
                        <p class="mb-0">
                            {{ founder.founderComment }}
                        </p>
                    </b-media>
                </b-media>
            </div>
        </div>
    </section>
</main>
</template>
<style>
    .about{
        background-color: red  !important;
    }
</style>
<script>
import catalogApi from '@/api/catalogApi'
export default {
    data(){
        return{
            listFounder: [],
        }
    },
    async created(){
    await this.getFounders()
    },
    methods:{
        async getFounders(){
            try{
                const { data } = await catalogApi.getFounder(this.$axios)
                this.listFounder = data
            }catch(err){
                console.log(err)
            }
        },
    }
}
</script>
