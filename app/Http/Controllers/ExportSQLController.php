<?php

namespace App\Http\Controllers;

use Illuminate\Http\Client\ResponseSequence;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Spatie\DbDumper\Databases\MySql;

class ExportSQLController extends Controller
{
    public function exportSQL()
    {
        MySql::create()
            ->setDbName(env('DB_DATABASE'))
            ->setUserName(env('DB_USERNAME'))
            ->setPassword(env('DB_PASSWORD'))
            ->includeTables(['columns', 'cards'])
            ->dumpToFile(base_path('database/schema/mysql-schema.dump'));

        $headers = [
            'Content-Type' => 'application/dump',
        ];
            return response()->download(base_path('database/schema/mysql-schema.dump'), 'db.dump', $headers);
    }
}
