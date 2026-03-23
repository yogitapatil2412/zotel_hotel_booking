<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('reference');
            $table->string('room');
            $table->string('plan');
            $table->date('check_in');
            $table->date('check_out');
            $table->integer('guests');
            $table->integer('long_discount')->default(0);
            $table->integer('last_discount')->default(0);
            $table->integer('total_price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
