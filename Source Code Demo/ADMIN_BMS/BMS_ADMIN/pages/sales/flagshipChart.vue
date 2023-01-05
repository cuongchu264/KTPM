<script>
import { Bar, mixins} from 'vue-chartjs'
import axios from 'axios'
import { scaleService } from 'chart.js'

export default {
  mixins: [mixins.reactiveData],
  data() {
    return {
      chartData: '',
    }
  },
  extends: Bar,
  mounted() {
    this.renderChart(this.chartData,this.options)
  },
  created() {
    axios.get(`https://localhost:44389/api/CartDetails/FlagshipProduct`)
      .then(response => {
        // JSON responses are automatically parsed.
        const responseData = response.data
        this.chartData = {
          labels: responseData.map(item => item.productName),
          datasets: [
            {
             label: 'Top 5 sản phẩm bán chạy (đơn vị: sản phẩm)',
             data: responseData.map(item => item.quantity),
             backgroundColor: "green",
            }
          ]
        }
        this.options ={
          responsive: scaleService,
          maintainAspectRatio: false,
          title: {
            display: true,
            text: "MATERIAL BULIDING SHOP"
          }
        }
      })
      .catch(e => {
        this.errors.push(e)
      })
  }
}
</script>

