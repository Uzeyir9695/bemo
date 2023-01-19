<?php

namespace App\Http\Controllers;

use App\Models\Column;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ColumnController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $columns = Column::with('cards')->get();
        return response()->json($columns);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->only('title'), [
            'title' => 'required|max:60',
        ]);
        if($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $column = Column::create([
            'title' => $request->title,
        ]);


        return response()->json(['data' => $column, 'message' => 'Column added succssfully', 'status' => 201]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Column $column)
    {
        $column->delete();
        $freshColumns = Column::with('cards')->get();
        return response()->json(['data' => $freshColumns, 'message' => 'Column deleted Successfully']);
    }
}
