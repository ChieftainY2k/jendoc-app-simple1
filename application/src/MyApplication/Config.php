<?php
/**
 * Application config class
 */
namespace MyApplication;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Tools\Setup;

class Config
{
    /**
     * Simple config
     * @var array
     */
    static $config;

    /**
     * ORM entity manager
     * @var EntityManager
     */
    static $entityManager;

    /**
     * Set config
     * @param $config
     */
    static function setConfig($config)
    {
        self::$config = $config;
    }

    /**
     * Get config
     * @return array
     */
    static function getConfig()
    {
        return self::$config;
    }

    /**
     * Get Doctrine Entity manager
     * @return EntityManager
     */
    static function getDoctrineEntityManager()
    {
        if (!empty(self::$entityManager)) {
            return self::$entityManager;
        }

        //read configuration
        $appConfig = self::getConfig();

        $isCacheEnabled = $appConfig['doctrine']['cache']['enabled'];

        // Create a simple "default" Doctrine ORM configuration for Annotations
        $isDevMode = $appConfig['doctrine']['cache']['isDevMode'];
        $proxyDir = null;

        //$cache = null;

        if (!empty($isCacheEnabled)) {

            $cacheDir = $appConfig['doctrine']['cache']['dir'];
            $cache = new \Doctrine\Common\Cache\FilesystemCache($cacheDir);
            //$cache = new \Doctrine\Common\Cache\ApcuCache();

        } else {

            $cache = new \Doctrine\Common\Cache\ArrayCache();

        }

        $useSimpleAnnotationReader = false;
        $entityManagerConfig = Setup::createAnnotationMetadataConfiguration(
            array(
                __DIR__ . "/Entity/"
            ),
            $isDevMode,
            $proxyDir,
            $cache,
            $useSimpleAnnotationReader
        );
        $entityManagerConfig->setNamingStrategy(new \Doctrine\ORM\Mapping\UnderscoreNamingStrategy());

        $connectorConfig = array(
            'driver' => 'pdo_mysql',
            'dbname' => $appConfig['database']['dbname'],
            'user' => $appConfig['database']['user'],
            'password' => $appConfig['database']['password'],
            'host' => $appConfig['database']['host'],
            'driverOptions' => array(
                \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
            )
        );

        // obtaining the entity manager
        $entityManager = EntityManager::create($connectorConfig, $entityManagerConfig);

        //FIX: http://docs.doctrine-project.org/projects/doctrine-orm/en/latest/cookbook/mysql-enums.html
        $platform = $entityManager->getConnection()->getDatabasePlatform();
        $platform->registerDoctrineTypeMapping('enum', 'string');

        self::$entityManager = $entityManager;

        return self::$entityManager;

    }


}