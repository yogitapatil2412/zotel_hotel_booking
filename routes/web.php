<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\inventoryontroller;
use App\Http\Controllers\BookingController;


Route::get('/', [SearchController::class, 'index'])->name('search.index');
Route::post('/search', [SearchController::class, 'search'])->name('search.rooms');
Route::post('/booking', [SearchController::class, 'store'])->name('booking.store');
Route::get('/config', [DiscountController::class, 'index'])->name('config.index');
Route::post('/config/{id}', [DiscountController::class, 'update'])->name('config.update');
Route::get('/inventory', [inventoryontroller::class, 'index'])->name('inventory.index');
Route::post('/booking', [BookingController::class, 'store'])->name('booking.store');
