<template>
    <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">{{ product.productName }}</h4>
          </div>
          <div class="card-body">
              <img :src="product.avatar" class="img-fluid" alt="">
            <h1 class="card-title pricing-card-title">
                ${{product.price}} <small class="text-muted">/ mo</small>
            </h1>
            <p style="max-height: 340px; overflow-y: scroll">
                {{ product.description }}
            </p>
            <button 
                v-if="product.inStocks > 0"
                type="button" 
                class="btn btn-lg btn-block btn-outline-primary"
                @click="addTocard"
                
                >
                Add to Card
            </button>
            <button 
                v-else
                type="button" 
                class="btn btn-lg btn-block btn-outline-secondary"
                @click="outOfStock"
                >
                Out of Stock
            </button>

          </div>
        </div>
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
        addTocard(){
            this.$emit('add-to-card', this.product)
        },
        outOfStock(){
            this.$emit('out-of-stock', this.product.productName)
        }
    }
}
</script>