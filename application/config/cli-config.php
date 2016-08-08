<?php
/**
 * CLI CONFIG for Doctrine Entity Manager
 */
use MyApplication\Config;

mb_internal_encoding('utf-8');
setlocale(LC_ALL, "pl_PL");

require(__DIR__ . "/../vendor/autoload.php");
Config::setConfig(require(__DIR__ . "/../config/config." . getenv("APPLICATION_ENVIRONMENT") . ".php"));

return \Doctrine\ORM\Tools\Console\ConsoleRunner::createHelperSet(Config::getDoctrineEntityManager());

