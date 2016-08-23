<?php
/**
 * Demo app stub.
 */
use MyApplication\Config;

require(__DIR__ . "/../bootstrap.php");

//smoke test
if (isset($_GET['smoketest'])) {
    echo "SMOKE TEST OK";
    exit;
}

echo "Hello world! My name is " . Config::getConfig()['appName'] . "<hr>";

//display some page
$page = new \MyApplication\WebsitePage();
$page->display();
