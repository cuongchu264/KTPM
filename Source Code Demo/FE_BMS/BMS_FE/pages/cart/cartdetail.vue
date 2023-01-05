<template>
    <main>
        <div class="text-center mt-2">
            <h1>" GIỎ HÀNG "</h1>
        </div>
        <div class="container">
            <div v-if="!listcart.length" class="mt-3">
                <h3 class="text-center mb-5">Giỏ hàng đang trống, hãy mua sắm ngay thôi!</h3>
            </div>
            <div class="row">
                <div v-for="(item, index) in listcart" :key="index" class="col-12 col-md-12 mb-3">
                    <b-card-group deck class="mt-4">
                        <b-card  border-variant="white" :img-src="item.avatar" img-alt="Card image" img-fluid img-height="100" img-width="150" img-left class="mb-3 rounded-5">
                            <b-card-title>
                                <h5><a style="text-decoration:none;color:black;" :href="geturl(item.productId)"> {{ item.productName }} </a></h5>
                            </b-card-title>
                            <p><strong>{{ item.price.toLocaleString() }} VND</strong></p>
                            <small>Số lượng: {{item.quantity}}</small>
                        </b-card>
                        <div><button class=" btn btn-danger" @click="DeleteCartItem(item.cartId)" >Xóa</button></div>
                    </b-card-group>  
                </div>
            </div>
            <div style="border-top: 1px solid black;" v-if="listcart.length">
                <h5 class="mt-3">Tổng cộng: <span>{{ total.toLocaleString() }} VND</span></h5>
            </div>
            <div class="col-4 col-md-4 mb-3 mt-5" v-if="listcart.length">
                    <div v-for="(info, index) in listInfomation" :key="index">
                        <div >
                            <b-card  title="Thông tin giao hàng" :sub-title="info.fullName">
                                <b-card-text>
                                    <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="house" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-house mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path><path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path></g></svg>
                                    {{info.address}}
                                </b-card-text>
                                
                                <b-card-text>
                                    <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="telephone" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-telephone mx-auto b-icon bi"><g data-v-41be6633=""><path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path></g></svg>
                                    {{ info.phone }}
                                </b-card-text>
                                <a href="/account/profile" class="btn btn-success">Cập nhật thông tin</a>
                            </b-card>
                        </div> 
                    </div>
                </div>
            <div class="mt-5" v-if="listcart.length">
                <!-- <h3 class="text-center">" THÔNG TIN ĐẶT HÀNG "</h3> -->
                <b-form  @submit.prevent="Order()">
                    <!-- <b-form-group id="input-group-1" label="Tên của bạn:" label-for="input-1">
                        <b-form-input
                            id="input-1"
                            v-model="CustomerName"
                            placeholder="Nhập tên của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-2" label="Số điện thoại của bạn:" label-for="input-2">
                        <b-form-input
                            id="input-2"
                            v-model="Phone"
                            placeholder="Nhập số điện thoại của bạn"
                            required
                        ></b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-3" label="Địa chỉ của bạn:" label-for="input-3">
                        <b-form-input
                            id="input-3"
                            v-model="Address"
                            placeholder="Nhập địa chỉ của bạn"
                            required
                        ></b-form-input>
                    </b-form-group> -->
                    <b-button  style="margin: auto; display:block;" type="submit" variant="success">Đặt hàng</b-button>
                </b-form>
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
    layout: 'defaultload',
    middleware: ['isAuthorize'],
    data(){
        return{
            listcart: [],
            listBill: [],
            listInfo:[],
            listInfomation:[],
            CustomerName:'',
            Phone:'',
            Address:'',
            Size: '',
            Quantity: '',
            UserName: '',
        }
    },
    mounted() {
        if (localStorage.getItem("user")){
            this.UserName = JSON.parse(localStorage.getItem("user"))
        }
    },
    async created(){
        await this.getCart()
        await this.getInfo()
    },
    computed: {
        total() {
            let total = 0;
            for(let i = 0; i < this.listcart.length; i++) {
                total += this.listcart[i].price * this.listcart[i].quantity;
            }
                return total;
        },
        tranferMoney(){
            let transfer = 0;
            for(let i = 0; i < this.listcart.length; i++) {
                transfer += this.listcart[i].price * this.listcart[i].quantity * 23000;
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

        async getInfo(){
            try{
                this.UserName = JSON.parse(localStorage.getItem("user"))
                const { data } = await catalogApi.getInfoviaUserName(this.$axios,this.UserName.username)
                this.listInfomation = data
            }catch(err){
                console.log(err)
            }
        },



        async getBill(){
            try{
            const { data } = await catalogApi.getBill(this.$axios)
                

            this.listBill = data
            }catch(err){
                console.log(err)
            }
        },


        DeleteCartItem(id)
        {
            this.$confirm("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng không?").then(() => {
                this.$axios.delete('/api/Carts/'+ id ).then(() =>{
                    this.$router.go().then(() =>{
                        this.getCart()
                    })
                })
            });
            
        },

        async Order() {
            try {
                const res = await catalogApi.getInfoviaUserName(this.$axios, this.UserName.username)
                this.listInfo = res.data
                await this.$axios.post('/api/Bills', {
                    customerName: this.listInfo[0].fullName,
                    username: this.UserName.username,
                    phone: this.listInfo[0].phone,
                    address: this.listInfo[0].address,
                    total: this.total,
                    status: 'Chờ xác nhận',
                })
                const { data } = await catalogApi.getBill(this.$axios)
                this.listBill = data
                const tmp = this.listBill[this.listBill.length - 1].billId;
                for(let i=0; i< this.listcart.length; i++)
                {
                    await this.$axios.post('/api/CartDetails',{
                        productName: this.listcart[i].productName,
                        avatar: this.listcart[i].avatar,
                        size: this.listcart[i].size,
                        quantity: this.listcart[i].quantity,
                        price: this.listcart[i].price,
                        billId: tmp,
                        productId: this.listcart[i].productId
                    })
                    await this.$axios.delete('/api/Carts/' + this.listcart[i].cartId)
                }
                this.$router.push('/cart/ordersuccess')
                } 
            catch (e) {
            this.error = e.response.data.message
            }
        },
        

        geturl(productid){
            const url= '/productdetail/'+productid;
            return url;
        }

    }
}
</script>