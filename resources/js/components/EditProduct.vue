<template>
    <section>
        <div class="row">
            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="">Product Name</label>
                            <input type="text" v-model="product_name" placeholder="Product Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Product SKU</label>
                            <input type="text" v-model="product_sku" placeholder="Product Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Description</label>
                            <textarea v-model="description" id="" cols="30" rows="4" class="form-control"></textarea>
                        </div>
                    </div>
                </div>





                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Media</h6>
                    </div>
                    <div class="card-body border">
                        <vue-dropzone ref="myVueDropzone" id="dropzone" :options="dropzoneOptions"   v-on:vdropzone-success="uploadSuccess" v-on:vdropzone-removed-file="removefile" ></vue-dropzone>
                    </div>
                </div>

                <!-- <vue-dropzone ref="myVueDropzone" id="dropzone" :options="dropzoneOptions"></vue-dropzone> -->


            </div>

            <div class="col-md-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Variants</h6>
                    </div>
                    <div class="card-body">
                        <div class="row" v-for="(item,index) in product_variant">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Option</label>
                                    <select v-model="item.option" class="form-control">
                                        <option v-for="variant in variants"
                                                :value="variant.id">
                                            {{ variant.title }}
                                        </option>
                                    </select>
                                </div>
                            </div>





                            <div class="col-md-8">
                                <div class="form-group">
                                    <label v-if="product_variant.length != 1" @click="product_variant.splice(index,1); checkVariant();"
                                           class="float-right text-primary"
                                           style="cursor: pointer;">Remove</label>
                                    <label v-else for="">.</label>
                                    <input-tag v-model="item.tags" @input="checkVariant" class="form-control"></input-tag>
                                </div>
                            </div>










                        </div>
                    </div>
                    <div class="card-footer" v-if="product_variant.length < variants.length && product_variant.length < 3">
                        <button @click="newVariant" class="btn btn-primary">Add another option</button>
                    </div>

                    <div class="card-header text-uppercase">Preview</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>Variant</td>
                                    <td>Price</td>
                                    <td>Stock</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="variant_price in product_variant_prices">
                                    <td>{{ variant_price.title }}</td>
                                    <td>
                                        <input type="text" class="form-control" v-model="variant_price.price">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" v-model="variant_price.stock">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button @click="updateProduct" type="submit" class="btn btn-lg btn-primary">Update</button>
        <button type="button" class="btn btn-secondary btn-lg">Cancel</button>
    </section>
</template>

<script>
import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'
import InputTag from 'vue-input-tag'

export default {
    components: {
        vueDropzone: vue2Dropzone,
        InputTag
    },
    props: {
        variants: {
            type: Array,
            required: true
        },
        product:{},
        productvarients:{},
        varientsprice:Array,


    },
    data() {
        return {
            checkrowprice:[],
            getimage:'',
            product_name: '',
            product_sku: '',
            description: '',
            tagarray:[],
            varientoption:[],
            images: [],
            provarients: [],

            editid:'',

            product_variant: [
                {
                    option: '',
                    tags: []
                },


            ],
            product_variant_prices: [],


            dropzoneOptions: {

                 url: "/fileup",
                thumbnailWidth: 150,
                maxFilesize:100,
                addRemoveLinks:true,
                headers: {
                "X-CSRF-TOKEN": document.head.querySelector("[name=csrf-token]").content
               }


            }
        }
    },
    methods: {






            uploadSuccess: function(file, response) {

                  this.images.push( file.name );
                  console.log(this.images);

                },

                removefile: function(file, error, xhr)
                {
                    let filename = file.name;

                     let result =  this.images.filter(picname => picname !== filename);

                        this.images = result;
                     console.log(this.images);

                },


        // it will push a new object into product variant
        newVariant() {
            let all_variants = this.variants.map(el => el.id)
            let selected_variants = this.product_variant.map(el => el.option);
            let available_variants = all_variants.filter(entry1 => !selected_variants.some(entry2 => entry1 == entry2))
            // console.log(available_variants)

            this.product_variant.push({
                option: available_variants[0],
                tags: []
            })
        },




        // check the variant and render all the combination
       checkVariant() {
            //this.currentarray();
            let tags = [];
            var getcurrnttag = [];
            var new_product_varient_price = this.product_variant_prices;
            this.product_variant_prices = [];
            this.product_variant.filter((item) => {
                tags.push(item.tags);
            })

                console.log(tags);

            this.getCombn(tags).forEach(item => {

                  getcurrnttag.push(item);


            })

            getcurrnttag.forEach(itemtitle => {
                 new_product_varient_price.forEach(storetitle => {

                        if (storetitle.title === itemtitle) {
                                 this.product_variant_prices.push({
                                title: itemtitle,
                                price: storetitle.price,
                                stock: storetitle.stock,
                            })

                             getcurrnttag = getcurrnttag.filter(e => e !== itemtitle);

                        }

                    })

                })

                    getcurrnttag.forEach(settitle =>{

                         this.product_variant_prices.push({
                                title: settitle,
                                price: 0,
                                stock: 0,
                            })

                    })
                    getcurrnttag =[];


        },

        // combination algorithm
        getCombn(arr, pre) {
            pre = pre || '';
            if (!arr.length) {
                return pre;
            }
            let self = this;
            let ans = arr[0].reduce(function (ans, value) {
                return ans.concat(self.getCombn(arr.slice(1), pre + value + '/'));
            }, []);
            return ans;
        },


        provariencepricecal(){

            // this.product_variant_prices = this.varientsprice;

           this.varientsprice.forEach(value => {

                var gettitle = [];
               var bbvalue ="";
               this.productvarients.forEach(element => {

                   var one = "";
                   var two = "";
                   var three = "";

                   if ((value.product_variant_one)&&(value.product_variant_one === element.id)) {

                       one = element.variant
                       if (one) {
                            gettitle.push(one+'/');
                       }

                   }

                   if ((value.product_variant_two)&&(value.product_variant_two === element.id)) {

                       two = element.variant
                       if (two) {
                            gettitle.push(two+'/');
                       }

                   }

                   if ((value.product_variant_three)&&(value.product_variant_three === element.id)) {

                       three = element.variant

                       if (three) {
                            gettitle.push(three);
                       }

                   }




             });

                    var newStr = gettitle.join('').trim()





                    var  titelname = newStr;
                    var pprice =value.price;
                    var pstock = value.stock;



                        this.product_variant_prices.push({title: titelname , price : pprice, stock: pstock})
                        this.checkrowprice.push(newStr);

             });

             console.log(this.product_variant_prices);
             console.log(this.checkrowprice);


        },

        // store product into database
        updateProduct() {
            let product = {
                title: this.product_name,
                sku: this.product_sku,
                description: this.description,
                id: this.editid,

                product_image: this.images,

                product_variant: this.product_variant,
                 product_variant_prices: this.product_variant_prices
            }



            axios.put('/product/'+ this.editid, product).then(response => {

                console.log(response.data);
                alert("data has been updated successfully")

            }).catch(error => {
                console.log(error);
            })

            // console.log(product);

        },

        productvarientprice(){

            this.productvarients.forEach(element => {

                    if (!(this.provarients.includes(element.variant_id))) {
                        this.provarients.push(element.variant_id);

                    }


             });

             this.provarients.forEach(el => {
                 this.tagarray = [];
                //  this.product_variant={};

                 this.productvarients.forEach(nel => {

                    if(el == nel.variant_id)
                    {
                        this.tagarray.push(nel.variant);
                    }

             });

                   var  option = el;
                    var tag = this.tagarray;

                        this.product_variant.push({option: option , tags : tag })


             });


                this.product_variant.shift();


        },

         getimg() {


            axios.get('/productimg/'+ this.editid,).then(response => {
                this.getimage = response.data;



                this.getimage.forEach(element => {

                    var url = element.file_path;
                     var filename = url.split("/").pop();
                      var file = { size: 123, name: filename, type: "image/png/jpg/jpeg/gif" };
                    this.$refs.myVueDropzone.manuallyAddFile(file, url);

                    this.images.push( file.name );

                });




                console.log(this.images);
            }).catch(error => {
                console.log(error);
            })

            // console.log(product);
        }


    },
    mounted() {

        this.product_name = this.product.title;
        this.product_sku = this.product.sku;
        this.description = this.product.description;
        this.editid = this.product.id;


        console.log('Component mountedcc.');
        console.log(this.product_variant_prices);
         this.provariencepricecal();

        this.getimg();
        this.productvarientprice();








    }
}
</script>
