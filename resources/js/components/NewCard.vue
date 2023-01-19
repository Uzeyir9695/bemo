<template>
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-center mt-2">
                <a :href="'#myModal_'+columnid" role="button" class="btn btn-sm btn-success card-title" data-bs-toggle="modal">Add card</a>
            </div>
            <div :id="'myModal_'+columnid" class="modal fade" tabindex="-1"  data-bs-keyboard="false" data-bs-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-black-50">Add new card</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"  @click="errors=null"></button>
                        </div>
                        <div class="modal-body">
                            <div v-for="v in errors" >
                                <p v-for="error in v" :key="error" class="text-sm text-danger">
                                    {{ error }}
                                </p>
                            </div>
                            <form>
                                <div class="mb-3">
                                    <label class="form-label" for="inputTitle3">Title:</label>
                                    <input type="text" v-model="cardData.title" class="form-control" id="inputTitle3" placeholder="Title...">
                                    <!--                                    <span class="text-danger" v-if="errors">{{ errors.title[0]}}</span>-->
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="inputDescription">Description:</label>
                                    <textarea class="form-control" placeholder="Describe..." v-model="cardData.description" rows="3" id="inputDescription"></textarea>
                                    <!--                                    <span class="text-danger" v-if="errors">{{ errors.description[0]}}</span>-->
                                </div>
                                <button type="button" class="btn btn-primary" @click="addCard(columnid)">Add</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  ref="addCardRef" @click="errors=null">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    components: {},
    props: ['columnid'],
    emits: ['updateColumns'],
    data() {
        return {
            cardData: {
                column_id: null,
                title: '',
                description: '',
            },
            errors: null,
        }
    },

    methods: {
        async addCard(columnId) {
            this.cardData.column_id = columnId
            await axios.post('api/card', this.cardData)
                .then((res) => {
                    this.cardData.column_id = ''
                    this.cardData.title = ''
                    this.cardData.description = ''
                    this.$emit('updateColumns')
                }).catch(err => {
                    this.errors = err.response.data.error
                })
        },
    }
}
</script>
