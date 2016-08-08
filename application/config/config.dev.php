<?php
/**
 * Sample configuration file
 */

return [
    "appName" => "Demo App for Development Environment",
    "doctrine" => [
        "cache" => [
            "enabled" => false,
            "isDevMode" => true,
            "dir" => __DIR__ . "/../../cache-dev/"
        ]
    ],
    "database" => [
        "host" => "mysql",
        "dbname" => "database",
        "user" => "dev",
        "password" => "dev",
        "port" => 3306
    ],
    "memcached" => [
        "host" => "memcached",
        "port" => 11211
    ]

];