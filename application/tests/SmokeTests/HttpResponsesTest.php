<?php
use PHPUnit\Framework\TestCase;

/**
 * Simple demo tests
 */
class HttpResponsesTest extends TestCase
{

    /**
     * test general http response
     */
    public function testHttpResponse()
    {
        $ch = curl_init();
        $timeout = 5;
        curl_setopt($ch, CURLOPT_URL, "http://app?smoketest=1");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $data = curl_exec($ch);
        curl_close($ch);
        //return $data;
        $this->assertEquals($data, "SMOKE TEST OK");
    }

}

