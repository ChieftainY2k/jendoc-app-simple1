<?php
/**
 * CLI CONFIG for Doctrine Entity Manager
 */
use MyApplication\Config;

require(__DIR__."/../bootstrap.php");

return \Doctrine\ORM\Tools\Console\ConsoleRunner::createHelperSet(Config::getDoctrineEntityManager());

