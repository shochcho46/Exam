<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Models\ProductImage;
use App\Models\Variant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use SebastianBergmann\Environment\Console;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function index()
    {
            $data = Product:: paginate(2);
            $varient = Variant::all();




            // foreach ($varient as $key => $varint) {

            //     echo $varint->title ;
            //     echo "<br> ";

            //     foreach ($varint->productVariants as $key => $varintname) {
            //         echo $varintname->variant ;
            //         echo "<br> ";
            //     }
            //     echo "<br><br> ";
            // }




   /// table desing content /////


            // foreach ($products as $key => $pvalue) {
            //     echo $pvalue ;
            //     echo "<br> <br> <br> <br>";

            //     foreach ($pvalue->productVariantPrices as $key => $pricevarients) {

            //         $varientName = array();


            //            foreach ($pvalue->productVariants as $key => $varient) {



            //             if ($pricevarients->product_variant_one == $varient->id) {

            //                 array_push($varientName,$varient->variant);
            //             }

            //             if ($pricevarients->product_variant_two == $varient->id) {

            //                 array_push($varientName,$varient->variant);
            //             }

            //             if ($pricevarients->product_variant_three == $varient->id) {

            //                 array_push($varientName,$varient->variant);
            //             }

            //             // echo $varient;
            //             // echo "<br> ";
            //            }

            //            echo implode("/",$varientName);

            //            echo $pricevarients->price;
            //            echo "<br><br>  ";

            //     }




            // }

    /// table desing content /////



        return view('products.index', compact('data','varient'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function create()
    {
        $variants = Variant::all();
        return view('products.create', compact('variants'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $Product = new Product();
        $ProductVariant = new ProductVariant;
        $Variant = new Variant;
        $ProductImage = new ProductImage;
        $ProductVariantPrice = new ProductVariantPrice;


        //product detailsupload

        $Product->title = $request->input('title');
        $Product->sku = $request->input('sku');
        $Product->description = $request->input('description');

        $Product->save();



         $productId = $Product->id;

        //product varient upload

        $vari = $request->input('product_variant');



         foreach ($vari as $key => $p) {
            $option = $p['option'];
            $tags = $p['tags'];

            foreach ($tags as $key => $value) {
                $ProductVariant = new ProductVariant;
                $ProductVariant->variant_id = $option;
                $ProductVariant->product_id = $productId;
                $ProductVariant->variant  = $value;
                $ProductVariant->save();

            }


         }

         //product varient price upload


        $price =  $request->input('product_variant_prices');
        foreach ($price as $key =>  $taka) {
            $ProductVariantPrice = new ProductVariantPrice;
            $alltag = $taka['title'];

            $separatedtag = (explode("/", $alltag));
            array_pop($separatedtag);
            $arraylenght = count($separatedtag);


            if (count($separatedtag) == 1) {


                $varient= ProductVariant::where('variant', $separatedtag[0])->get();
                $vid = $varient[0]->id;
                $vid2 = null;
                $vid1 = null;

            }

            if (count($separatedtag) == 2) {


               $varient= ProductVariant::where('variant', $separatedtag[0])->get();
               $vid = $varient[0]->id;

                $varient1 = ProductVariant::where('variant', $separatedtag[1])->get();
                $vid1 = $varient1[0]->id;
                $vid2 = null;



            }

            if (count($separatedtag) == 3) {

                $varient= ProductVariant::where('variant', $separatedtag[0])->get();
                $vid = $varient[0]->id;

                $varient1 = ProductVariant::where('variant', $separatedtag[1])->get();
                $vid1 = $varient1[0]->id;

                $varient2 = ProductVariant::where('variant', $separatedtag[2])->get();
                $vid2 = $varient2[0]->id;

            }



            $ProductVariantPrice->product_variant_one = $vid;
            $ProductVariantPrice->product_variant_two = $vid1;
            $ProductVariantPrice->product_variant_three = $vid2;


            $ProductVariantPrice->price = $taka['price'];
            $ProductVariantPrice->stock = $taka['stock'];
            $ProductVariantPrice->product_id = $productId;
            $ProductVariantPrice->save();

        }





            //imageupload

            $imageup = $request->input('product_image');
            foreach ($imageup as $key => $value) {
                $ProductImage = new ProductImage;
                $fullpathurl = url('/') . '/storage/productpic/' . $value;

                $ProductImage->product_id = $productId;
                $ProductImage->file_path = $fullpathurl;
                $ProductImage->save();

            }




         return response(json_encode(var_dump( $request->all())));






    }


    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {

        // dd($product);

        $variants = Variant::all();
        return view('products.edit', compact('variants','product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }

    public function fileupload (Request $request)
    {
        $images = $request->file('file');



            $images = $request->file('file');

            $name = $images->getClientOriginalName();


            $path =  $images->storeAs('productpic', $name, 'public');
    }


    public function search (Request $request)

    {
        $title = $request->input('title');
        $variant = $request->input('variant');
        $price_from = $request->input('price_from');
        $price_to = $request->input('price_to');
        $date = $request->input('date');


        if (empty($variant)) {
            $variant = "empty";
          }


        $pushdata =array();



            $gdata = DB::table('products')
                                ->join('product_variant_prices', 'products.id', '=', 'product_variant_prices.product_id')
                                // ->join('product_variants', 'products.id', '=', 'product_variants.product_id')
                                // ->select('products.*', 'product_variant_prices.*', 'product_variants.*')
                                ->select('products.*','product_variant_prices.*')
                                // ->where('products.title',$title)
                                ->where('products.title', 'like', '%'.$title.'%')
                                 ->orwhere('product_variant_prices.product_variant_one',$variant)
                                ->orwhere('product_variant_prices.product_variant_two',$variant)
                                ->orwhere('product_variant_prices.product_variant_three',$variant)

                                ->orwhereDate('product_variant_prices.created_at',  $date)
                                ->orwhereBetween('product_variant_prices.price', [$price_from , $price_to ])
                                ->groupBy('product_variant_prices.product_id')
                                ->get();





        foreach ($gdata as $key => $value) {

            array_push($pushdata,$value->product_id);

        }



        $pushdata  = implode(", ", $pushdata);

        return redirect()->route('searchresult',  $pushdata);


    }

    public function searchresult(Request $request ,$pushdata)

    {

        $makearray = explode(",",$pushdata);

        $varient = Variant::all();
        $data = Product::whereIn('id', $makearray)
                    ->paginate(2);


            return view('products.index', compact('data','varient'));

    }



}
