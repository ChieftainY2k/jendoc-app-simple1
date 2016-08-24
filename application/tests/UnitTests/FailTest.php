<?php
use PHPUnit\Framework\TestCase;

/**
 * Simple demo tests
 */
class FailTest extends TestCase
{

    /**
     * simulate something and fail
     */
    public function testAndFail()
    {
        $this->assertEquals(1, 2);
    }

}

