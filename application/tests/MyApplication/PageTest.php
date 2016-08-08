<?php
use PHPUnit\Framework\TestCase;

class PageTest extends TestCase
{

    public function testFakeTrue()
    {
        $this->assertEquals(1, 1);
    }

    public function testCanEntityBeCreated()
    {
        $page = new \MyApplication\Entity\Page();
        $page->setTitle("test title");
        $em = \MyApplication\Config::getDoctrineEntityManager();
        $em->persist($page);
        $em->flush();
    }

}

