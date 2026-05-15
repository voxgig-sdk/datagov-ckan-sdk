-- DatagovCkan SDK error

local DatagovCkanError = {}
DatagovCkanError.__index = DatagovCkanError


function DatagovCkanError.new(code, msg, ctx)
  local self = setmetatable({}, DatagovCkanError)
  self.is_sdk_error = true
  self.sdk = "DatagovCkan"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function DatagovCkanError:error()
  return self.msg
end


function DatagovCkanError:__tostring()
  return self.msg
end


return DatagovCkanError
