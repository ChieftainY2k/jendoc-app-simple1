<?php
/**
 * Demo app stub.
 */
use MyApplication\Config;

mb_internal_encoding('utf-8');
setlocale(LC_ALL, "pl_PL");

require(__DIR__ . "/../vendor/autoload.php");
Config::setConfig(require(__DIR__ . "/../config/config." . getenv("APPLICATION_ENVIRONMENT") . ".php"));

echo "Hello world! My name is " . Config::getConfig()['appName'] . "<hr>";

//display some page
$page = new \MyApplication\WebsitePage();
$page->display();
