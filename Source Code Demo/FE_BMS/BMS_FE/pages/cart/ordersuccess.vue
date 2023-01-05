<template>
    <main class="mb-5">
        <div class="text-center">
            <img src="https://thumbs.gfycat.com/QuaintLikelyFlyingfish-size_restricted.gif" width="280" height="200" alt="">
            <h1>" ĐẶT HÀNG THÀNH CÔNG "</h1>
            <p>Chúc bạn một năm mới vui vẻ và hạnh phúc bên gia đình! Building Material Shop sẽ liên hệ và xác nhận đơn hàng của bạn.</p>        
        </div>
        <!-- <div class="container">
            <iframe
                src="https://viettelpost.vn/order/tao-don-le"
                width="100%"
                height="500"
                frameborder="0" 
                target="_blank">
            </iframe>
        </div> -->
    </main>
</template>
<script>
export default {
    middleware: ['isAuthorize'],
    layout: 'ordersuccesslayout',
    created(){
        setTimeout( () => this.$router.push({ path: '/historyorder/historybill'}), 3000)
    }
}
</script>