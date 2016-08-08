<?php
/**
 * Low-level system bootstrapper, application config init
 */
use MyApplication\Config;

mb_internal_encoding('utf-8');
setlocale(LC_ALL, "pl_PL");

require(__DIR__ . "/vendor/autoload.php");

$envName = getenv("APPLICATION_ENVIRONMENT");
if (empty($envName)) {
    throw new \Exception("APPLICATION_ENVIRONMENT is empty.");
}

Config::setConfig(require(__DIR__ . "/config/config." . $envName . ".php"));
