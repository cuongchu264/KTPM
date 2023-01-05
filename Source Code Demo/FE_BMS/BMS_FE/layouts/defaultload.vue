<template>
    <div>

        <Header />
        
        <Nuxt />
        
        
        
        <Footer />
        
    </div>
</template>
<script>
//import conponent
import Header from '@/components/Shared/Header.vue'
import Footer from '@/components/Shared/Footer'
export default {
    name:'Default',
    //decleare component
    components:{
        Header,
        Footer,
    },
};
</script>