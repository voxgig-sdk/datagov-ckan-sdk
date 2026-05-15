<?php
declare(strict_types=1);

// DatagovCkan SDK utility: result_body

class DatagovCkanResultBody
{
    public static function call(DatagovCkanContext $ctx): ?DatagovCkanResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
