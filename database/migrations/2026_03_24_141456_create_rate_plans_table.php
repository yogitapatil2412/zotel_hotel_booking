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
        Schema::create('rate_plans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('room_type_id')->constrained()->cascadeOnDelete();

            $table->string('code'); // EP, CP, MAP
            $table->string('name'); // Room Only, Breakfast Included, All Meals Included
            $table->string('meal_plan')->nullable();

            $table->decimal('base_price');

            $table->foreignId('discount_id')->nullable()
                ->constrained('rate_plan_discounts')
                ->nullOnDelete();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rate_plans');
    }
};
