<template>
    <main>
        <div class="card-group">
            <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <a style="text-decoration:none;color:black;" :href="geturl(product.productId)"><img :src="product.avatar" class="img-fluid" alt="Responsive image"></a>
                <h3 class="my-0 font-weight-normal mt-5"><a style="text-decoration:none;color:black;" :href="geturl(product.productId)">{{product.productName}}</a></h3>
                <h5 class="card-title pricing-card-title mt-3" style="max-height: 50px;">
                    {{product.price.toLocaleString()}} VND
                </h5>
            </div>
            </div>
        </div>
    </main>
</template>
<script>
export default {
    props : {
        product:{
            type: Object,
            required: true,
            default(){
                return {}
            },
        },
    },
    methods :{
        geturl(productid){
            const url= 'productdetail/'+productid;
            return url;
        }
    }
}
</script>