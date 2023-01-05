<template>
    <main>
        <div>
            <div class="container">
                <a href="/Bill" type="button" class="btn btn-success"><svg data-v-41be6633="" viewBox="0 0 16 16" width="1em" height="1em" focusable="false" role="img" aria-label="arrow left" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi-arrow-left mx-auto b-icon bi"><g data-v-41be6633=""><path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path></g></svg></a>
            </div>
            <h3 class="text-center mt-4">" CẬP NHẬT TRẠNG THÁI XÁC NHẬN ĐƠN HÀNG SỐ {{Bill.billId}} "</h3>
            <div class="container bg-white">
                <b-form method="put"  @submit.prevent="UpdateBill(Bill)" class="mt-3">
                    <b-form-group id="input-group-1" label="ID hóa đơn:" label-for="input-1">
                                <b-form-input
                                    id="input-1"
                                    v-model="Bill.billId"
                                    disabled
                                ></b-form-input>
                            </b-form-group>
                    <b-form-group
                                id="input-group-2"
                                label="Tên khách hàng:"
                                label-for="input-2"
                            >
                                <b-form-input
                                    id="input-2"
                                    v-model="Bill.customerName"
                                    disabled
                                ></b-form-input>
                            </b-form-group>

                    <b-form-group
                                id="input-group-3"
                                label="UserName:"
                                label-for="input-3"
                            >
                                <b-form-input
                                    id="input-3"
                                    v-model="Bill.userName"
                                    disabled
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-4" label="Số điện thoại:" label-for="input-4">
                                <b-form-input
                                    id="input-4"
                                    v-model="Bill.phone"
                                    disabled
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="input-group-5"
                                label="Địa chỉ:"
                                label-for="input-5"
                            >
                                <b-form-input
                                    id="input-5"
                                    v-model="Bill.address"
                                    disabled
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group
                                id="input-group-6"
                                label="Ngày đặt hàng:"
                                label-for="input-6"
                            >
                                <b-form-input
                                    id="input-6"
                                    v-model="Bill.dayOrder"
                                    disabled
                                ></b-form-input>
                            </b-form-group>

                            <b-form-group id="input-group-7" label="Trạng thái đơn hàng:" label-for="input-7">
                                <b-form-group
                                    id="input-7"
                                    required
                                    >
                                    <b-form-select
                                        id="input-7"
                                        v-model="Bill.status"
                                        required
                                    >
                                        <option>Chờ xác nhận</option>
                                        <option>Đã xác nhận</option>
                                    </b-form-select>
                                </b-form-group>
                            </b-form-group>
                            <b-button style="margin: auto; display:block;" type="submit" variant="success">Update</b-button>
                </b-form>
            </div>
        </div>
    </main>
</template>
<script>
export default {
    middleware: ['isAuthorize'],
    async asyncData({ $axios,params}) {
        const Bill = await $axios.$get(`api/Bills/${params.BillEditId}`)
        return { Bill }
    },
    data(){
        return{
        }
    },


    methods:{
        async UpdateBill(Bill) {
            try {
            await this.$axios.put('/api/Bills/' + Bill.billId, {
                billId: Bill.billId,
                customerName: Bill.customerName,
                userName: Bill.userName,
                phone: Bill.phone,
                address: Bill.address,
                dayOrder: Bill.dayOrder,
                total: Bill.total,
                status: Bill.status,
            })
            this.$router.push('/Bill')
            } 
            catch (err) {
            console.log(err)
            }
        },
    }
}
</script>