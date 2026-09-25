<?php

namespace App\Http\Controllers;

use App\Models\Portfolio;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    public function index()
    {
        return response()->json(Portfolio::all());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image_url' => 'nullable|string',
            'category' => 'nullable|string',
        ]);

        return response()->json(Portfolio::create($validated), 201);
    }
}

// Controller for Portfolio API Endpoints

// Controller for Portfolio API Endpoints
