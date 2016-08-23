<?php
use PHPUnit\Framework\TestCase;

/**
 * Simple demo tests
 */
class UnitTest extends TestCase
{

    /**
     * test something as a unit test
     */
    public function testSomething()
    {
        $page = new \MyApplication\Entity\Page();
        $page->setTitle($foo = "foo");
        $this->assertEquals($foo, $page->getTitle());
    }

}

