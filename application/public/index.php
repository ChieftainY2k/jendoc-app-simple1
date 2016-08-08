<?php
//echo "APPLICATION_ENVIRONMENT = " . getenv("APPLICATION_ENVIRONMENT") . "";
//echo "<hr>";
//phpinfo();

$config = require("../config/config." . getenv("APPLICATION_ENVIRONMENT") . ".php");

echo "<hr>" . $config['appName'] . "<hr>";

//echo "<pre>"; print_r($config);