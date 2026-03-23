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
        Schema::create('inventories', function (Blueprint $table) {
            $table->id();

            $table->foreignId('room_type_id')
                ->constrained('room_types')
                ->cascadeOnDelete();

            $table->date('date');
            $table->integer('available');
            $table->integer('price_1_person');
            $table->integer('price_2_person');
            $table->integer('price_3_person');
            $table->integer('breakfast_price');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventories');
    }
};
