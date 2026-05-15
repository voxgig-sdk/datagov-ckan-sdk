
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { DatagovCkanSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await DatagovCkanSDK.test()
    equal(null !== testsdk, true)
  })

})
