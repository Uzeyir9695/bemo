<?php

namespace App\Http\Controllers;

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
            ->dumpToFile(base_path('database/schema/mysql-schema.sql'));

        $headers = [
            'Content-Type: application/blob',
        ];

        return response()->download(base_path('database/schema/mysql-schema.sql'), 'db.sql', $headers);
    }
}
