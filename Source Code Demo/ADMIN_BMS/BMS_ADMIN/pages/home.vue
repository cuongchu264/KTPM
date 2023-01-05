<template>
  <main>
    <div class="container">
      <div class="admin-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">TRANG QUẢN LÍ BUILDING MATERIALS SHOP</h1>
        <p class="lead">“Cái người đời thường thiếu là ý chí chứ không phải là sức mạnh” – Victor Hugo</p>
        <img style="height: 300px; width: 300px" src="https://cdn-icons-png.flaticon.com/512/1059/1059509.png" alt="">
      </div>
    </div>
  </main>   
</template>

<script>
export default {
  layout: 'default',
  middleware: ['isAuthorize'],
}
</script>
