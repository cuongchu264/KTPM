<template>
  <main class="mb-5">
      <div class="text-center">
          <img src="https://thumbs.gfycat.com/QuaintLikelyFlyingfish-size_restricted.gif" width="280" height="200" alt="">
          <h1>" THANH TOÁN THÀNH CÔNG "</h1>
          <p>Bạn đã thanh toán thành công đơn hàng thông qua VNPay với mã giao dịch {{orderResponse.vnp_TransactionNo}}, cửa hàng sẽ kiểm tra và xác nhận đơn hàng của bạn.</p>        
      </div>
  </main>
</template>
<script>
export default {
  middleware: ['isAuthorize'],
  layout: 'ordersuccesslayout',
  data(){
    return{
      orderResponse: []
    }
  },
  async created(){
    await this.getParam()
  },
  methods: {
    async getParam(){
      this.orderResponse = await this.$route.query
      const Bill = await this.$axios.$get(`api/Bills/${this.orderResponse.vnp_OrderInfo}`)
      await this.$axios.put('/api/Bills/' + Bill.billId, {
          billId: Bill.billId,
          customerName: Bill.customerName,
          userName: Bill.userName,
          phone: Bill.phone,
          address: Bill.address,
          dayOrder: Bill.dayOrder,
          total: Bill.total,
          status: "Đã xác nhận",
          description: "Đã thanh toán bằng VNPay với mã giao dịch "+ this.orderResponse.vnp_TransactionNo
      })
      setTimeout( () => this.$router.push({ path: '/historyorder/historybill'}), 5000)
    }
  }
}
</script>