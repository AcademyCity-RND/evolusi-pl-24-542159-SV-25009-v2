<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class PortfolioApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_fetch_portfolios()
    {
        $this->getJson('/api/portfolios')->assertStatus(200);
    }

    public function test_can_create_portfolio()
    {
        $this->postJson('/api/portfolios', ['title' => 'Bespoke Suit'])->assertStatus(201);
    }
}


