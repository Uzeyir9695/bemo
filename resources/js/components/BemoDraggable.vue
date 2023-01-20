<template>
    <transition-group name="flip-transition">
    <div  class="row" v-for="(cardData, key) in cards" :class="'mycard'+cardData.id" :data-id="cardData.id" :key="cardData.id">
        <div class="col">
            <div class="card text-white bg-primary mb-4">
                <div class="card-body">
                    <h5 class="card-title">
                        <a :href="'#editModal'+cardData.id"  role="button" class="btn btn-md btn-primary card-title" data-bs-toggle="modal" @clik="getColumnId(column.id)"><header>{{ cardData.title}}</header></a>
                        <div :id="'editModal'+cardData.id"  class="modal fade" tabindex="-1"  data-bs-keyboard="false" data-bs-backdrop="static">
                            <div class="modal-dialog" >
                                <div class="modal-content" >
                                    <div class="modal-header" >
                                        <h5 class="modal-title text-black-50">Edit or close</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"  @click="reloadPage"></button>
                                    </div>
                                    <div class="modal-body" >
                                        <div v-for="v in errors" >
                                            <p v-for="error in v" :key="error" class="text-sm text-danger">
                                                {{ error }}
                                            </p>
                                        </div>
                                        <form :id="'editCard_'+cardData.id" @submit.prevent="editCard(cardData.id)">
                                            <div class="mb-3">
                                                <label class="form-label text-black" :for="'inputTitle2_'+cardData.id">Title:</label>
                                                <input type="text" v-model="cardData.title"   class="form-control" :id="'inputTitle2_'+cardData.id" placeholder="Title...">
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label text-black" :for="'inputDescription_'+cardData.id">Description:</label>
                                                <textarea class="form-control" v-model="cardData.description" placeholder="Describe..." rows="3" :id="'inputDescription_'+cardData.id"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </h5>
                </div>
            </div>
        </div>
    </div>
    </transition-group>
</template>

<script>
import axios from "axios";
import { VueDraggableNext } from 'vue-draggable-next'
export default {
    components: {
        draggable: VueDraggableNext,
    },

    props: ['cards', 'columnid'],
    data() {
        return {
            cardData: null,
            errors: null,
            order: [],
        }
    },

    watch: {
        cards: {
            handler(obj) {
            obj.forEach((val) => {
                this.$watch(() => val, this.handleCardChange,  {deep: true, immediate: true});
                });
            },
            deep: true,
        },
    },
    methods: {
        handleCardChange (newVal) {
            this.cardData = JSON.parse(JSON.stringify(newVal))
        },

        editCard(cardId) {
            axios.put('api/card/'+cardId, this.cardData)
            .then((res) => {
                console.log(res.data.message)
            }).catch(err => {
                this.errors = err.response.data.error
            })
        },

        reloadPage() {
            window.location.reload();
        }
    }
}
</script>

<style scoped>
.flip-transition-move {
    transition: all 0.7s;
}
.list-item{
    padding: 10px;
    border: 1px solid #ccc;
}
</style>
