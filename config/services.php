<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mbwin' => [
        'auth_key' => env('MBWIN_AUTH_KEY'),
        'auth_url' => env('MBWIN_AUTH_URL'),
        'auth_port' => env('MBWIN_AUTH_PORT'),
        'auth_last_repo' => env('MBWIN_AUTH_LAST_REPO'),
        'branch' => env('MBWIN_BRANCH'),
        'api_content_type' => env('MBWIN_API_CONTENT_TYPE'),
    ],

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

];
