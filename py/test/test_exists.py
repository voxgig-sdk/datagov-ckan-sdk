# ProjectName SDK exists test

import pytest
from datagovckan_sdk import DatagovCkanSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = DatagovCkanSDK.test(None, None)
        assert testsdk is not None
