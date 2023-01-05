<template>
    <main>
        <div class="container">
            <a href="/Bill" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
        </div>
        <h3 class="text-center mt-4">" CHI TIẾT HÓA ĐƠN SỐ {{BillDetail[0].billId}} "</h3>
                    <div class="container bg-white">
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col" class="text-center">Số lượng</th>
                                <th scope="col">Giá</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(cartDetail,index) in BillDetail" :key="index">
                                    <th scope="row">{{ cartDetail.productName }}</th>
                                    <td class="text-center">{{ cartDetail.quantity }}</td>
                                    <td>{{ cartDetail.price }}VND</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="container mt-5" style="border-top: 1px solid black;">
                        <h5 class="mt-3">Tổng cộng {{BillDetail.length}} sản phẩm: <span>{{ total }} VND</span></h5>
                    </div>
    </main>
</template>
<script>
export default {
    middleware: ['isAuthorize'],
    async asyncData({ $axios,params}) {
        const BillDetail = await $axios.$get(`api/CartDetails/SearchBill?BillId=${params.BillDetailId}`)
        return { BillDetail }
    },
    computed:{
        total() {
            let total = 0;
            for(let i = 0; i < this.BillDetail.length; i++) {
                total += this.BillDetail[i].price * this.BillDetail[i].quantity;
            }
                return total;
        },
    },
}
</script>