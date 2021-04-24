<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->to('/login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::middleware('auth')->group(function () {
    Route::resource('product-variant', 'VariantController');
    Route::resource('product', 'ProductController');
    Route::resource('blog', 'BlogController');
    Route::resource('blog-category', 'BlogCategoryController');
});

Route::post('/fileup', 'ProductController@fileupload')->middleware('auth');


Route::post('/search', 'ProductController@search')->middleware('auth');

Route::get('/searchresult/{search}', 'ProductController@searchresult')->middleware('auth')->name('searchresult');

Route::get('/productimg/{productimg}', 'ProductController@productimg')->middleware('auth')->name('productimg');
