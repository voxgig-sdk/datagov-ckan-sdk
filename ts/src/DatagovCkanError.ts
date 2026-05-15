
import { Context } from './Context'


class DatagovCkanError extends Error {

  isDatagovCkanError = true

  sdk = 'DatagovCkan'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  DatagovCkanError
}

