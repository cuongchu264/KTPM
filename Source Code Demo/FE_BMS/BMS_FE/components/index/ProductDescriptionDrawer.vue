<template>
    <main>
        <div class="drawer-backgorund" :class="{show: active}" @click="$emit('close-product-drawer')" />

        <div class="drawer" :class="{show: active}">
            <div class="drawer-close" @click="$emit('close-product-drawer')">
                X
            </div>

            <div v-if="product" class="product-details">
                <h3 class="text-center">{{ product.productName }}</h3>
                <p class="description">{{ product.description }}</p>
                <h3 class="text-center">${{ product.price }}</h3>

                <div class="cart_total" v-if="product_total">
                    <h3>In Cart</h3>
                    <h4>{{ product_total }}</h4>
                </div>

                <div class="button-container">
                    <button class="remove"></button>
                    <button class="add"></button>
                </div>
            </div>
        </div>
    </main>
</template>
<script>
export default {
    props: ['product','active'],
    computed:{
        product_total(){
            return 56.00
        }
    }
}
</script>
<style>
.drawer-background{
    width: 100%;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    background-color: rgba(124, 124, 124, 0.55);
    z-index: 100;
    display: none;
    transition: display .5s;
}

.drawer{
    width: 95vw;
    height: 100vh;
    background-color: white;
    position: fixed;
    top: 0;
    left: -105vw;
    padding: 15px;
    transition: left .5s;
    z-index: 101;
    overflow-y: scroll;
}


.drawer-close{
    font-size: 1.5rem;
    padding: 5px;
    border-radius: 5px;
    right: 10px;
    border: 2px solid gray;
    color: gray;
    width: 15px;
    float:right;
    cursor: pointer;
}


.product-details{
    display: flex;
    justify-content: center;
    flex-direction: column;
}
.description{
    padding: 20px;
    line-height: 1.5rem;
}
.button-container button{
    width: 150px;
    border: none;
    padding: 10px;
    border-radius: 5px;
    margin: 0 5px 50px 5px;
    cursor: pointer;
}

</style>