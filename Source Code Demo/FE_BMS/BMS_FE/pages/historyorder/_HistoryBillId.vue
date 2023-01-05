<template>
    <main>
        <div class="container">
            <a href="/historyorder/historybill" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
        </div>
        <div class="text-center mt-2">
            <h1>" LỊCH SỬ MUA HÀNG "</h1>
        </div>
        <div class="container">
            <div class="row">
                <div v-for="(item, index) in bill" :key="index" class="col-12 col-md-12 mb-3">
                    <b-card-group deck class="mt-4">
                        <b-card  border-variant="white" :img-src="item.avatar" img-alt="Card image" img-fluid img-height="100" img-width="150" img-left class="mb-3 rounded-5">
                            <b-card-title>
                                <h5> {{ item.productName }} </h5>
                            </b-card-title>
                            <p><strong>{{ item.price.toLocaleString() }} VND</strong></p>
                            <small>Số lượng: {{item.quantity}}</small>
                        </b-card>
                    </b-card-group>  
                </div>
            </div>
            <div style="border-top: 1px solid black;">
                <h5 class="mt-3">Tổng cộng: <span>{{ total.toLocaleString() }} VND</span></h5>
            </div>
        </div>
    </main>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
    async asyncData({ $axios,params}) {
        const bill = await $axios.$get(`api/CartDetails/SearchBill?BillId=${params.HistoryBillId}`)
        return { bill }
    },
    layout: 'default',
    middleware: ['isAuthorize'],
    data(){
        return{
            listcart: [],
            listBill: [],
            CustomerName:'',
            Phone:'',
            Address:'',
            Size: '',
            Quantity: '',
            UserName: '',
        }
    },
    async created(){
        await this.getCart()
    },
    computed: {
        total() {
            let total = 0;
            for(let i = 0; i < this.bill.length; i++) {
                total += this.bill[i].price * this.bill[i].quantity;
            }
                return total;
        },
        tranferMoney(){
            let transfer = 0;
            for(let i = 0; i < this.bill.length; i++) {
                transfer += this.bill[i].price * this.bill[i].quantity * 23000;
            }
                return transfer;
        },

    },
    methods:{
        async getCart(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getCartviaUserName(this.$axios,this.UserName.username)
                this.listcart = data
            }catch(err){
                console.log(err)
            }
        },

    }
}
</script>