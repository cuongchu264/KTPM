<template>
    <main>
        <div>
            <!-- <b-tabs v-model="tabBill" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success"> -->
                <!--Bảng hóa đơn-->
                <!-- <b-tab title="Hóa đơn"  active :title-link-class="linkClassBill(0)"> -->
                    <b-tabs v-model="tabBIllStatus" content-class="mt-3" align="center" active-nav-item-class="font-weight-bold text-uppercase text-success">
                        <!--đơn hàng chờ xác nhận-->
                        <b-tab title="Chờ xác nhận"  active :title-link-class="linkClassBillStatus(0)">
                            <h3 class="text-center mt-4">" ĐƠN HÀNG CHỜ XÁC NHẬN"</h3>
                            <!-- <div style="text-align:center;">
                                <form action="" @submit.prevent="SearchCart">
                                    <input  v-model="searchcart" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                                    <button type="submit" class="btn btn-success">Search</button>
                                </form>    
                            </div> -->
                            <div style="text-align:center;">
                                <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                            </div>
                            <div class="container-fluid bg-white">
                                <table class="table mt-4">
                                    <thead>
                                        <tr>
                                        <th scope="col" @click="sort1('billId')">ID <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                        <th scope="col" @click="sort1('customerName')">Tên khách hàng <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                        <th scope="col">UserName</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Ngày đặt hàng</th>
                                        <th scope="col">Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <tr v-for="(bill,index) in filteredBillUnConfirm" :key="index">
                                            <th scope="row">{{ bill.billId }}</th>
                                            <td>{{ bill.customerName }}</td>
                                            <td>{{ bill.userName }}</td>
                                            <td>{{ bill.phone }}</td>
                                            <td>{{ bill.address }}</td>
                                            <td>{{ getDate(bill.dayOrder) }}</td>
                                            <td>{{ bill.status }}</td>
                                            <td><a type="button" class="btn btn-primary" :href="getBillDetailurl(bill.billId)">Detail</a></td>
                                            <td><a type="button" class="btn btn-success" :href="getBillEditurl(bill.billId)">Edit</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            <!-- <p class="text-center"><a  v-if="pageIndexUCBill>0" type="button" class="btn btn-success" @click="gotoPrevUCBill()">Prev</a> Trang {{pageIndexUCBill + 1}} <a v-if="pageIndexUCBill<=UCBillOfCurrPage.length-5" class="btn btn-success" @click="gotoNextUCBill()">Next</a></p> -->
                            <p class="text-center">
                                <button class="btn btn-success" @click="prevPage1" :hidden="cantGoBack1">Previous</button> 
                                Trang {{currentPage1}}
                                <button class="btn btn-success" @click="nextPage1" :hidden="this.currentPage1 > cantGoNext1">Next</button>
                            </p>
                            </div>
                        </b-tab>
                        <!--đơn hàng đã xác nhận-->
                        <b-tab title="Đã xác nhận" :title-link-class="linkClassBillStatus(1)">
                            <h3 class="text-center mt-4">" ĐƠN HÀNG ĐÃ XÁC NHẬN"</h3>
                            <div style="text-align:center;">
                                <input  v-model="search" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                            </div>
                            <div class="container-fluid bg-white">
                                <table class="table mt-4">
                                    <thead>
                                        <tr>
                                        <th scope="col" @click="sort2('billId')">ID <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                        <th scope="col" @click="sort2('customerName')">Tên khách hàng <svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow down up" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-down-up mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z"></path></g></svg></th>
                                        <th scope="col">UserName</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Ngày đặt hàng</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <tr v-for="(bill,index) in filteredBillConfirm" :key="index">
                                            <th scope="row">{{ bill.billId }}</th>
                                            <td>{{ bill.customerName }}</td>
                                            <td>{{ bill.userName }}</td>
                                            <td>{{ bill.phone }}</td>
                                            <td>{{ bill.address }}</td>
                                            <td>{{ getDate(bill.dayOrder) }}</td>
                                            <td>{{ bill.status }}</td>
                                            <td>{{ bill.description }}</td>
                                            <td><a type="button" :id="'create_order_'+ bill.billId" class="btn btn-warning" :href="getBillDeliveryurl(bill.billId)">Delivery</a></td>
                                            <td><a type="button" class="btn btn-primary" :href="getBillDetailurl(bill.billId)">Detail</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            <!-- <p class="text-center"><a  v-if="pageIndexCBill>0" type="button" class="btn btn-success" @click="gotoPrevCBill()">Prev</a> Trang {{pageIndexCBill + 1}} <a v-if="pageIndexCBill<=CBillOfCurrPage.length-5" class="btn btn-success" @click="gotoNextCBill()">Next</a></p> -->
                            <p class="text-center">
                                <button class="btn btn-success" @click="prevPage2" :hidden="cantGoBack2">Previous</button> 
                                Trang {{currentPage2}}
                                <button class="btn btn-success" @click="nextPage2" :hidden="this.currentPage2 > cantGoNext2">Next</button>
                            </p>
                            </div>
                        </b-tab>
                    </b-tabs>
                <!-- </b-tab> -->
                <!-- Bảng chi tiết hóa đơn
                <b-tab title="Tra cứu chi tiết hóa đơn" :title-link-class="linkClassBill(1)">
                    <h3 class="text-center mt-4">" TRA CỨU CHI TIẾT HÓA ĐƠN "</h3>
                    <div style="text-align:center;">
                        <form action="" @submit.prevent="SearchCart">
                            <input  v-model="searchcart" size="md" class="mr-md-2 text-center mt-3 mb-3" type="text" placeholder="Search">
                            <button type="submit" class="btn btn-success">Search</button>
                        </form>    
                    </div>
                    <div class="container bg-white">
                        <div class="mb-5">
                                    <span  style="float:right;">Chi tiết hóa đơn: 
                                    <select v-model="pageSizeCartDetail" placeholder="Page Size">
                                        <option value="3">3</option>
                                        <option value="6">6</option>
                                        <option value="9">9</option>
                                    </select>
                                    </span>
                                </div>
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                <th scope="col" class="text-center">Hóa Đơn</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Size</th>
                                <th scope="col" class="text-center">Số lượng</th>
                                <th scope="col">Giá</th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr v-for="(cartDetail,index) in CartDetailOfCurrPage" :key="index">
                                    <th scope="row" class="text-center">{{ cartDetail.billId }}</th>
                                    <td>{{ cartDetail.productName }}</td>
                                    <td>{{ cartDetail.size }}</td>
                                    <td class="text-center">{{ cartDetail.quantity }}</td>
                                    <td>${{ cartDetail.price }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="text-center"><a  v-if="pageIndexCartDetail>0" type="button" class="btn btn-success" @click="gotoPrevCartDetail()">Prev</a> Trang {{pageIndexCartDetail + 1}} <a v-if="pageIndexCartDetail<=CartDetailOfCurrPage.length" class="btn btn-success" @click="gotoNextCartDetail()">Next</a></p>
                    </div>
                    <div class="container mt-5" style="border-top: 1px solid black;">
                        <h5 class="mt-3">Tổng cộng: <span>${{ total }} = {{ tranferMoney }}VND</span></h5>
                    </div>
                </b-tab> -->
            <!-- </b-tabs> -->
        </div>
    </main>
</template>
<script>
export default {
    layout:'default',
    middleware: ['isAuthorize'],
    data(){
        return{
            tabBIllStatus: 0,
            search: '',
            // searchbill:'',
            // sort and pagination
            listBillUnConfirm:[],
            currentSort1:'billId',
            currentSortDir1:'asc',
            pageSize1:10, 
            currentPage1:1,
            //
            listBillConfirm:[],
            currentSort2:'billId',
            currentSortDir2:'asc',
            pageSize2:10, 
            currentPage2:1,
            isCreatedOrder: false
        }
    },

    computed:{

        cantGoBack1() {
            return this.currentPage1 === 1;
        },
        cantGoNext1() {
            const totalPages = (Math.floor(this.filteredBillUnConfirm.length / this.pageSize1)) + 1;
            return totalPages;
        },
        sortStr1() {
            let s = '';
            if(this.currentSortDir1 === 'desc') s += '-';
                return s + this.currentSort1;
        },

        cantGoBack2() {
            return this.currentPage2 === 1;
        },
        cantGoNext2() {
            const totalPages = (Math.floor(this.filteredBillConfirm.length / this.pageSize2)) + 1;
            return totalPages;
        },
        sortStr2() {
            let s = '';
            if(this.currentSortDir2 === 'desc') s += '-';
                return s + this.currentSort2;
        },


        filteredBillUnConfirm(){
            return this.listBillUnConfirm.filter((bill) =>{
                return bill.customerName.toLowerCase().match(this.search.toLowerCase()) || bill.userName.toLowerCase().match(this.search.toLowerCase()) || bill.address.toLowerCase().match(this.search.toLowerCase()) 
            });
        },
        filteredBillConfirm(){
            return this.listBillConfirm.filter((bill) =>{
                return bill.customerName.toLowerCase().match(this.search.toLowerCase())
            });
        },

    },

    async created(){
        await this.loadListBillUC()
        await this.loadListBillC()
        await this.CheckCreatedOrder()
    },


    methods:{

        async loadListBillUC() {
            const data = await fetch(`https://localhost:44389/api/Bills/viaSortingAndPagination?Page_size=${this.pageSize1}&Current_page=${this.currentPage1}&Sort=${this.sortStr1}&Status=Ch%E1%BB%9D%20x%C3%A1c%20nh%E1%BA%ADn`);
            this.listBillUnConfirm  = await data.json();  
            },
            sort1(s) {
            // if s == current sort, reverse
            if(s === this.currentSort1) {
                this.currentSortDir1 = this.currentSortDir1==='asc'?'desc':'asc';
            } else this.currentSortDir1 = 'asc';
            this.currentSort1 = s;
            this.loadListBillUC();
            },
            nextPage1() {
            this.currentPage1++;
            this.loadListBillUC();
            },
            prevPage1() {
            if(this.currentPage1 > 1) this.currentPage1--;
            this.loadListBillUC();
        },

        async loadListBillC() {
            const data = await fetch(`https://localhost:44389/api/Bills/viaSortingAndPagination?Page_size=${this.pageSize2}&Current_page=${this.currentPage2}&Sort=${this.sortStr2}&Status=%C4%90%C3%A3%20x%C3%A1c%20nh%E1%BA%ADn`);
            this.listBillConfirm = await data.json();  
            },
            sort2(s) {
            // if s == current sort, reverse
            if(s === this.currentSort2) {
                this.currentSortDir2 = this.currentSortDir2==='asc'?'desc':'asc';
            } else this.currentSortDir2 = 'asc';
            this.currentSort2 = s;
            this.loadListBillC();
            },
            nextPage2() {
            this.currentPage2++;
            this.loadListBillC();
            },
            prevPage2() {
            if(this.currentPage2 > 1) this.currentPage2--;
            this.loadListBillC();
        },

        async CheckCreatedOrder(){
            await this.listBillConfirm.forEach(async bill => {
                const {data} = await this.$axios.get('/api/Delivery/ViettelPost/CheckOrderCreated?billId=' + bill.billId)
                if(data === true){
                    document.getElementById('create_order_'+ bill.billId).style.display = "none"
                }
                else{
                    document.getElementById('create_order_'+ bill.billId).style.display = "block"
                }
            });
        },


        linkClassBillStatus(idx){
            if (this.tabBIllStatus === idx) {
            return ['bg-success', 'text-light']
            } else {
            return ['bg-light', 'text-secondary']
            }
        },

        getBillEditurl(BillEditId){
            const url= 'BillEdit/'+ BillEditId;
            return url;
        },

        getBillDetailurl(BillDetailId){
            const url= 'BillDetail/'+ BillDetailId;
            return url;
        },

        getBillDeliveryurl(BillDeliveryId){
            const url= 'Delivery/'+ BillDeliveryId;
            return url;
        },

        SearchBill(){
            fetch("https://localhost:44389/api/Bills/SearchBill?search="+this.searchbill)
                .then(response => response.json())
                .then(res => {
                    this.listBillUnComfirm = res;
                })
        },

        getDate(datetime) {

            const date = new Date(datetime);

            const dateString = ("0" + date.getDate()).slice(-2) + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" +
                            date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2);

            return dateString
        }
    }
}
</script>
