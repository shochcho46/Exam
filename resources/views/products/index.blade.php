@extends('layouts.app')

@section('content')
<style>
    .ex1 {
      font-size: 30px;
    }
    .ex2 {
      font-size: 50px;
    }
</style>

    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Products</h1>
    </div>

    @if($errors->any())
        <h4 class="text-danger text-center">{{$errors->first()}}</h4>


    @else
    <div class="card">
        <form  method="POST" action="/search" class="card-header" enctype="multipart/form-data">

            {{-- <form method="POST" id="newsid" action="{{ route('news.update',$news->id) }}" enctype="multipart/form-data">--}}
                @csrf
                @method('POST')


            <div class="form-row justify-content-between">
                <div class="col-md-2">
                    <input type="text" name="title" placeholder="Product Title" class="form-control">
                </div>



            <div class="col-md-2">
                <select name="variant" id="" class="form-control">
                    <option value="">Select a varint</option>
                    @foreach ($varient as $key => $varint)

                    <option disabled    value=""><b>{{ strtoupper($varint->title) }}</b></option>

                    @foreach ($varint->productVariants as $key => $varintname)
                    <small class="ml-2">
                        <option    value="{{ $varintname->id }}"><i>{{  $varintname->variant }}</i> </option></small>
                    @endforeach

                    @endforeach
                </select>
            </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text ">Price Range</span>
                        </div>
                        <input type="text" name="price_from" aria-label="First name" placeholder="From" class="form-control">
                        <input type="text" name="price_to" aria-label="Last name" placeholder="To" class="form-control">
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="date" name="date" placeholder="Date" class="form-control">
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary float-right"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>

        <div class="card-body">
            <div class="table-response">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Variant</th>
                        <th>picture</th>
                        <th width="100px">Action</th>
                    </tr>
                    </thead>

                    <tbody>






        @foreach($data as  $key => $value)

                    <tr>
                        <td>{{ $data->firstItem() + $key }}</td>



                        <td>{{ $value->title }} <br> Created at : {{ $value->created_at->diffForHumans() }}</td>
                        <td>{{ $value->description }}</td>

                        <td>

             @foreach($value->productVariantPrices as  $key => $pricevarients)

                            @php
                                  $varientName = array();
                            @endphp

                    @foreach($value->productVariants as  $key => $varient)


                            @if ($pricevarients->product_variant_one == $varient->id)

                                @php array_push($varientName,$varient->variant); @endphp

                            @elseif ($pricevarients->product_variant_two == $varient->id)

                                @php array_push($varientName,$varient->variant); @endphp

                            @elseif ($pricevarients->product_variant_three == $varient->id)
                                @php array_push($varientName,$varient->variant); @endphp

                            @endif



                    @endforeach

                            <dl class="row mb-0" style="height:30px; width:450px; overflow: hidden" id="variant">

                                <dt class="col-sm-3 pb-0">

                                    {{ implode("/",$varientName) }}
                                </dt>
                                <dd class="col-sm-9">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-4 pb-0">Price : {{ number_format($pricevarients->price) }}</dt>
                                        <dd class="col-sm-8 pb-0">InStock : {{ number_format($pricevarients->stock) }}</dd>
                                    </dl>
                                </dd>
                            </dl>


              @endforeach



                            <button onclick="$('#variant').toggleClass('h-auto')" class="btn btn-sm btn-link">Show more</button>



                        </td>

                            <td>
                                @foreach($value->productImages as  $key => $pic)
                                <img src="{{ $pic->file_path }}" height="50px" width="50px" />
                                @endforeach
                            </td>

                        <td>
                            <div class="btn-group btn-group-sm">
                                <a href="{{ route('product.edit', $value->id) }}" class="btn btn-success">Edit</a>
                            </div>
                        </td>




                    </tr>


         @endforeach


                    </tbody>









                </table>
            </div>

        </div>



        <div class="card-footer">
            <div class="row justify-content-between">
                <div class="col-md-6">

                    <p>Showing {{ $data->firstItem() }} to {{ $data->lastItem() }} out of {{ $data->total() }}</p>
                </div>
                <div class="col-md-4">
                    <div class="text-center pagination ">

                        {{ $data->links() }}

                    </div>
                </div>
            </div>
        </div>





    </div>

    @endif



@endsection
