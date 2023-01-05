<template>
    <main>
        <div class="text-center mt-2">
            <h1>" LỊCH SỬ MUA HÀNG "</h1>
        </div>
        <div class="container mt-5">
            <div v-if="!listBill.length" class="mt-3">
                <h3 class="text-center mb-5">Bạn chưa có đơn hàng nào, hãy mua sắm ngay thôi!</h3>
            </div>
                        <div class="row">
                            <div v-for="(item, index) in sortedList" :key="index" class="col-6 col-md-6 mt-4">
                            <div>
                                <b-card 
                                overlay
                                img-src="https://png.pngtree.com/thumb_back/fh260/background/20210912/pngtree-aesthetic-background-pink-pastel-image_866344.jpg"
                                img-height="290"
                                v-if="item.status === 'Chờ xác nhận'"
                                :title="getDate(item.dayOrder)" :sub-title="item.customerName">
                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="house" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-house mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path><path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path></g></svg>
                                        {{item.address}}
                                    </b-card-text>
                                    
                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="telephone" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-telephone mx-auto b-icon bi"><g data-v-41be6633=""><path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path></g></svg>
                                        {{ item.phone }}
                                    </b-card-text>

                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" style="color:red;" width="1em" height="1em" focusable="false" role="img" aria-label="x circle" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-x-circle mx-auto b-icon bi"><g data-v-41be6633=""><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"></path></g></svg>
                                        {{item.status}}
                                    </b-card-text>

                                    <b-card-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16"><path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/><path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/></svg>
                                        Chưa có hình thức thanh toán
                                    </b-card-text>

                                    <a :href="geturl(item.billId)" class="btn btn-success">Chi tiết</a>
                                    <a @click="ConfirmCOD(item)" class="btn btn-success">Thanh toán COD</a>
                                    <a :href="getVNPayUrl(item.billId)" class="btn btn-success">Thanh toán VNPay</a>
                                </b-card>

                                <b-card 
                                overlay
                                img-src="https://png.pngtree.com/thumb_back/fh260/background/20210912/pngtree-aesthetic-background-pink-pastel-image_866344.jpg"
                                img-height="290"
                                v-if="item.status === 'Đã hủy đơn hàng'"
                                :title="getDate(item.dayOrder)" :sub-title="item.customerName">
                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="house" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-house mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path><path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path></g></svg>
                                        {{item.address}}
                                    </b-card-text>
                                    
                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="telephone" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-telephone mx-auto b-icon bi"><g data-v-41be6633=""><path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path></g></svg>
                                        {{ item.phone }}
                                    </b-card-text>

                                    <b-card-text>
                                        <svg data-v-41be6633="" viewBox="0 0 16 16" style="color:red;" width="1em" height="1em" focusable="false" role="img" aria-label="x circle" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-x-circle mx-auto b-icon bi"><g data-v-41be6633=""><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"></path></g></svg>
                                        {{item.status}}
                                    </b-card-text>

                                    <b-card-text>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16"><path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/><path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/></svg>
                                        Chưa có hình thức thanh toán
                                    </b-card-text>

                                    <a :href="geturl(item.billId)" class="btn btn-success">Chi tiết</a>
                                </b-card>

                                <b-card 
                                    overlay
                                    img-src="https://png.pngtree.com/thumb_back/fh260/background/20210912/pngtree-aesthetic-background-pink-pastel-image_866344.jpg"
                                    img-height="290"
                                    v-if="item.status === 'Đã xác nhận'"
                                    :title="getDate(item.dayOrder)" :sub-title="item.customerName">
                                        <b-card-text>
                                            <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="house" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-house mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path><path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path></g></svg>
                                            {{item.address}}
                                        </b-card-text>
                                        
                                        <b-card-text>
                                            <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="telephone" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-telephone mx-auto b-icon bi"><g data-v-41be6633=""><path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path></g></svg>
                                            {{ item.phone }}
                                        </b-card-text>

                                        <b-card-text>
                                            <svg data-v-41be6633="" viewBox="0 0 16 16" style="color:green;" width="1em" height="1em" focusable="false" role="img" aria-label="check2 circle" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-check2-circle mx-auto b-icon bi"><g data-v-41be6633=""><path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z"></path><path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z"></path></g></svg>
                                            {{item.status}}
                                        </b-card-text>

                                        <b-card-text>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16"><path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/><path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/></svg>
                                            {{item.description}}
                                        </b-card-text>

                                        <a :href="geturl(item.billId)" class="btn btn-success">Chi tiết</a>
                                </b-card>
                            </div>
                            </div>
                        </div>
            </div>
    </main>
</template>
<script>
import Vue from "vue"
import VueSimpleAlert from "vue-simple-alert"
import catalogApi from '@/api/catalogApi'
Vue.use(VueSimpleAlert);
export default {
    layout: 'default',
    middleware: ['isAuthorize'],
    data(){
        return{
            listBill: [],
            CustomerName:'',
            Phone:'',
            Address:'',
            Size: '',
            Quantity: '',
            UserName: '',
            sortBy: "BillId",
            sortOrder: 1,
        }
    },
    mounted() {
        if (localStorage.getItem("user")){
            this.UserName = JSON.parse(localStorage.getItem("user"))
        }
    },
    computed:{
        sortedList() {
            return [...this.listBill]
                .map(i => ({...i}))
                .sort((a,b) => {
                if (a[this.sortBy] >= b[this.sortBy]) {
                    return this.sortOrder
                }
                return -this.sortOrder
            })
        },
    },
    async created(){
        await this.getBillviaUserName()
    },
    methods:{
        async getBillviaUserName(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getBillviaUserName(this.$axios,this.UserName.username)
                
                this.listBill = data

            }catch(err){
                console.log(err)
            }
        },

        geturl(HistoryBillId){
            const url= '/historyorder/'+HistoryBillId;
            return url;
        },

        getVNPayUrl(HistoryBillId){
            const url= '/payment/'+HistoryBillId;
            return url;
        },

        getDate(datetime) {

            const date = new Date(datetime);

            const dateString = ("0" + date.getDate()).slice(-2) + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" +
                            date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2);

            return dateString
        },

        ConfirmCOD(Bill)
        {
            this.$confirm("Bạn có muốn thanh toán bằng hình thức COD không?").then(() => {
                this.$axios.put('/api/Bills/' + Bill.billId, {
                    billId: Bill.billId,
                    customerName: Bill.customerName,
                    userName: Bill.userName,
                    phone: Bill.phone,
                    address: Bill.address,
                    dayOrder: Bill.dayOrder,
                    total: Bill.total,
                    status: "Đã xác nhận",
                    description: "Thanh toán bằng hình thức COD"
                }).then(() =>{
                    this.$router.go().then(() =>{
                        this.getBillviaUserName()
                    })
                })
            });
            
        },
    }
}
</script>