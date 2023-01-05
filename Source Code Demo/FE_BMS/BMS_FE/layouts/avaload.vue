<template>
    <div>

        <Header />
        
        <Nuxt />
        
    
        
    </div>
</template>
<script>
//import conponent
import Header from '@/components/Shared/Header.vue'
export default {
    name:'Default',
    //decleare component
    components:{
        Header,
    },
};
</script>