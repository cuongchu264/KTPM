<template>
    <main>
        <div class="card-group" style="border: none;">
            <b-card-group deck class="mt-4">
                <b-card  border-variant="light" :img-src="News.newImg" img-alt="Card image" img-fluid img-height="300" img-width="350" img-left class="mb-3 rounded-5">
                    <p>{{ News.newCategoryName }} - BUILDING MATERIAL SHOP</p>
                    <b-card-title>
                    <a style="text-decoration: none; color: black;" :href="News.newLink"> {{ News.newTitle }} </a>
                    </b-card-title>
                    <p>{{ News.newComment }}</p>
                </b-card>
            </b-card-group>
        </div>
    </main>
</template>
<script>
export default {
    props : {
        News:{
            type: Object,
            required: true,
            default(){
                return {}
            },
        },
    },
}
</script>