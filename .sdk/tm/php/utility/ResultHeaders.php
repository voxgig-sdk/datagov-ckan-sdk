<?php
declare(strict_types=1);

// DatagovCkan SDK utility: result_headers

class DatagovCkanResultHeaders
{
    public static function call(DatagovCkanContext $ctx): ?DatagovCkanResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
