<?php
use PHPUnit\Framework\TestCase;

/**
 * Simple demo tests
 */
class PageTest extends TestCase
{
    //public static function setUpBeforeClass()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //
    //    ////destroy and recreate schema for entities
    //    //$em = \MyApplication\Config::getDoctrineEntityManager();
    //    //$metadatas = $em->getMetadataFactory()->getAllMetadata();
    //    //$schema_tool = new \Doctrine\ORM\Tools\SchemaTool($em);
    //    //$schema_tool->dropSchema($metadatas);
    //    //$schema_tool->createSchema($metadatas);
    //}
    //
    //protected function setUp()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //}
    //
    //protected function assertPreConditions()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //}
    //
    //protected function assertPostConditions()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //}
    //
    //protected function tearDown()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //}
    //
    //public static function tearDownAfterClass()
    //{
    //    //echo("***". __METHOD__ . "\n");
    //}

    public function testFakeTrue()
    {
        //echo("***". __METHOD__ . "\n");
        $this->assertEquals(1, 1);
    }

    public function testCanEntityBeCreated()
    {
        //echo("***". __METHOD__ . "\n");
        $page = new \MyApplication\Entity\Page();
        $page->setTitle("test title");
        $em = \MyApplication\Config::getDoctrineEntityManager();
        $em->persist($page);
        $em->flush();

        $id = $page->getId();
        $repo = \MyApplication\Config::getEntityRepository(\MyApplication\Entity\Page::class);
        $foundEntity = $repo->find($id);
        /* @var $foundEntity \MyApplication\Entity\Page */

        $this->assertEquals($id, $foundEntity->getId());

    }

}

