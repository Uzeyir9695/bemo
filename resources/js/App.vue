<template>
    <div class="row mt-1">
        <div class="col-2 ml-2">
            <!-- Button HTML (to Trigger Modal) -->
            <a href="#myModal" role="button" class="btn btn-primary" data-bs-toggle="modal">Add column</a>
                       <!-- Modal HTML to add new column-->
            <div id="myModal" class="modal fade" tabindex="-1" data-bs-keyboard="false" data-bs-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add new column</h5>
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
                                    <label class="form-label" for="inputTitle">Title:</label>
                                    <input type="text" v-model="columnData.title" class="form-control" id="inputTitle" placeholder="Type here...">
<!--                                    <span class="text-danger" v-if="errors">{{ errors.title[0]}}</span>-->
                                </div>
                                <button type="button" class="btn btn-primary" @click="addColumn">Add</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  @click="errors=null">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="row mt-2">
            <!-- Columns -->
            <div class="col-3" v-for="(column, key) in columns" :key="column.id">
                <div class="card text-white bg-info mb-4" :id="column.id">
                    <div class="card-body">
                        <div class="d-flex justify-content-center bg-warning mb-3 column-title p-2">
                            {{ column.title }} <button id="deleteColumn" class="btn btn-sm m-lg-1 badge rounded-pill bg-danger" @click="deleteColumn(column.id)">X</button>
                        </div>
                        <!-- Draggable column cards -->
                        <section class="list">
                        <draggable class="drag-area" :list="column.cards" :id="column.id" @add="onAdd($event, column.id)" :move="checkMove" @change="onUpdate($event)"  :group="{ name: 'tasks'}">
                            <!-- Column cards list -->
                            <BemoDraggable :cards="column.cards" :columnid="column.id"></BemoDraggable>
                        </draggable>
                        </section>
                        <!-- Column add new card footer -->
                        <NewCard :columnid="column.id"  @update-columns="updateColumns" ></NewCard>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" v-if="columns.length > 0">
        <div class="col-2 ml-1">
            <a id="dumpsql" type="button" class="btn bg-info" @click="exportSQL">Export board SQL</a>
        </div>
    </div>

</template>
<script>
import axios from "axios";
import Swal from 'sweetalert2'
import { VueDraggableNext } from 'vue-draggable-next'
import BemoDraggable from "./components/BemoDraggable.vue";
import NewCard from "./components/NewCard.vue";
export default {
    components: {
        NewCard,
        draggable: VueDraggableNext,
        BemoDraggable,
    },
data() {
    return {
        columnData: {
            title: '',
        },
        columns: [],
        updatedCardPosition: null,
        errors: null,
        order: []
    }
},

    watch: {
        columns: {
            handler() {
              this.columns
            }
        },

        cardData: {
            handler() {
              this.cardData
            }
        },
    },

    created() {
        axios.get('api/column')
            .then((res) => {
                this.columns = res.data
            }).catch(err => {
            this.errors = err.response.data.error
        })
    },

    methods: {
        exportSQL() {

            axios.get('api/export-sql')
            .then(res => {
                console.log('Dumped')
            })
        },
        // Get future card, column ids and position index and set is as object
        checkMove: function(evt){
            this.updatedCardPosition = {
                column_id: evt.to.attributes.id.value,
                card_id: JSON.parse(JSON.stringify(evt.draggedContext.element.id)),
                new_index: JSON.parse(JSON.stringify(evt.draggedContext.futureIndex))
            }
            // console.log(this.updatedCardPosition)
        },

        // When card is moved into other column's list keep, it in that column's list even after page refresh
       onAdd(event, columnId) {
            let id = event.item.getAttribute('data-id');
            axios.patch('api/drag-card/' + id, { column_id: columnId})
                .then((response) => {
                    this.updateCardPosition()
                }).catch((error) => {
                console.log(error);
            })
        },

        // Keeps position. this method called when the card is rearranged on the same column
        onUpdate(e) {
            if(e.moved) {
                this.updateCardPosition()
            }
        },

        updateCardPosition() {
            axios.patch('api/update-card-position', this.updatedCardPosition)
                .then((response) => {
                    console.log(response.data[1])
                }).catch((error) => {
                console.log(error);
            })
        },


       addColumn() {
           axios.post('api/column', this.columnData)
            .then((res) => {
                this.columns.push(res.data.data)
                this.columnData.title = ''
            }).catch(err => {
                this.errors = err.response.data.error
            })
        },

        updateColumns() {
            this.columns.filter( async (val) => {
               await axios.get('api/column')
                    .then((res) => {
                        this.columns = res.data
                    }).catch(err => {
                    this.errors = err.response.data.error
                })
            })
        },

       deleteColumn(id) {
           Swal.fire({
               title: 'Are you sure?',
               text: "All the cards includes this column will also be deleted!",
               icon: 'warning',
               showCancelButton: true,
               confirmButtonColor: '#3085d6',
               cancelButtonColor: '#d33',
               confirmButtonText: 'Yes, delete it!'
           }).then((result) => {
               if (result.isConfirmed) {
                   axios.delete('api/column/'+id)
                   .then((res) => {
                       var columns = this.columns
                       const index = columns.findIndex(object => {
                           return object.id === id;
                       });
                       this.columns.splice(index, 1)
                       Swal.fire(
                           'Success!',
                           res.data.message,
                           'success'
                       )
                   }).catch(err => {
                       this.errors = err.response.data.error
                   })
               }
           })

        }
    },
}
</script>

<style>
.column-title {
    border-radius: 50px;
    font-size: 18px;
    align-items: center;
    font-weight: bold;
}

.column-title button {
    font-size: 11px;
    font-weight: bold;

}
#deleteColumn:hover {
    cursor: pointer;
}
#deleteColumn {
    text-decoration: none;
}

</style>
