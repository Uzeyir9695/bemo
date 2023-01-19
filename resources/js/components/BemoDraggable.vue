<template>
    <transition-group name="flip-transition">
    <div  class="row" v-for="(cardData, key) in cards" :class="'mycard'+cardData.id" :data-id="cardData.id" :id="columnid" :key="cardData.id">
        <div class="col" :id="cardData.id">
            <div class="card text-white bg-primary mb-4">
                <div class="card-body" :id="cardData.id">
                    <h5 class="card-title" :id="cardData.id">
                        <a :href="'#editModal'+cardData.id"  role="button" class="btn btn-lg btn-primary card-title" data-bs-toggle="modal" @clik="getColumnId(column.id)"><header>{{ cardData.title}}</header></a>
                        <div :id="'editModal'+cardData.id"  class="modal fade" tabindex="-1"  data-bs-keyboard="false" data-bs-backdrop="static">
                            <div class="modal-dialog" >
                                <div class="modal-content" >
                                    <div class="modal-header" >
                                        <h5 class="modal-title text-black-50">Edit or close</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"  @click="errors=null"></button>
                                    </div>
                                    <div class="modal-body" >
                                        <div v-for="v in errors" >
                                            <p v-for="error in v" :key="error" class="text-sm text-danger">
                                                {{ error }}
                                            </p>
                                        </div>
                                        <form :id="'editCard_'+cardData.id" @submit.prevent="editCard(cardData.id, columnid)">
                                            <div class="mb-3">
                                                <label class="form-label text-black" :for="'inputTitle2_'+cardData.id">Title:</label>
                                                <input v-if="card.title.length > 0" type="text" v-model="card.title" class="form-control" :id="'inputTitle2_'+cardData.id" placeholder="Title...">
                                                <input v-else type="text" v-model="cardData.title" class="form-control" :id="'inputTitle2_'+cardData.id" placeholder="Title...">
                                                <!--                                    <span class="text-danger" v-if="errors">{{ errors.title[0]}}</span>-->
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label text-black" :for="'inputDescription_'+cardData.id">Description:</label>
                                                <textarea v-if="card.description.length > 0" class="form-control" v-model="card.description" placeholder="Describe..." rows="3" :id="'inputDescription_'+cardData.id"></textarea>
                                                <textarea class="form-control" v-model="cardData.description" placeholder="Describe..." rows="3" :id="'inputDescription_'+cardData.id"></textarea>
                                                <!--                                    <span class="text-danger" v-if="errors">{{ errors.description[0]}}</span>-->
                                            </div>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" :ref="'addCard'+cardData.id"  @click="errors=null">Close</button>
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
            card: {
                column_id: null,
                title: '',
                description: '',
            },
            errors: null,
            order: []
        }
    },

    methods: {
        editCard(cardId, columnId) {
            console.log(this)
            this.card.column_id = columnId
            // console.log(this.cardData.title)
            axios.put('api/card/'+cardId, this.card)
            .then((res) => {
            }).catch(err => {
                this.errors = err.response.data.error
            })
        },
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
