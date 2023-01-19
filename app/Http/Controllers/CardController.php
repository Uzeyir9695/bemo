<?php

namespace App\Http\Controllers;
use App\Models\Card;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->only(['column_id', 'title', 'description']), [
            'column_id' => 'required|integer',
            'title' => 'required|max:60',
            'description' => 'required|max:255',
        ]);

        if($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $primary_access_token = \Illuminate\Support\Str::random(254);

        $card = Card::create([
            'column_id' => $request->column_id,
            'title' => $request->title,
            'description' => $request->description,
            'access_token' => $primary_access_token
        ]);



        return response()->json(['data' => $card, 'message' => 'Column added succssfully', 'status' => 201]);
    }

    public function dragCard(Request $request, $id)
    {
        $card = Card::find($id);
        $card->update(['column_id' => $request->column_id]);
        return response()->json(['message' => 'Card dragged successfully', 'status' => 201]);
    }

    public function repositionArrayElement($array, $key, $order, $columnId)
    {
        $a = array_search($key, array_keys($array));
        $p1 = array_splice($array, $a, 1);
        $p2 = array_splice($array, 0, $order);
        $array = array_merge($p2, $p1, $array);

        $cards = Card::where('column_id', $columnId)->get();
      // Update cards position according to the new position index and column
        foreach ($cards as $key => $card) {
            $card->update([
                'column_id' => $array[$key]['column_id'],
                'title' => $array[$key]['title'],
                'description' => $array[$key]['description'],
            ]);
        }
    }

    public function updateCardPosition(Request $request)
    {
        $cards = Card::where('column_id', $request->column_id)->get();

        $cardIndex = null;
        foreach ($cards as $key => $card) {
            if($card->id === $request->card_id) {
                $cardIndex = $key;
            }
        }
        $this->repositionArrayElement($cards->toArray(), $cardIndex, $request->new_index, $request->column_id);

        return response()->json(['message', 'Congrats! Card position updated successfully.'], 201);

    }

    public function filterCard(Request $request)
    {
        $validator = Validator::make($request->only(['access_token']), [
            'access_token' => 'required|max:42|min:42',
        ]);

        if($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = User::find(1);
        if($user->token === $request->access_token) {
            $card = Card::query();
            $card->when($request->has('date') && $request->date != '' && $request->has('status') && $request->status != '', function ($card) use ($request) {
                $card->where('created_at', $request->date);
                switch ($request->status) {
                    case('0'):
                        $card->onlyTrashed();
                        break;

                    case('1'):
                        $card->whereNull('deleted_at');
                        break;
                    default:
                        $card->whereNull('deleted_at');

                }
            });

            $card = $card->get();
            return response()->json($card, 200);
        } else {
            return response()->json(['error' => 'Invalid Token!'],  401);
        }
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
    public function update(Request $request, Card $card)
    {
        dd($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
