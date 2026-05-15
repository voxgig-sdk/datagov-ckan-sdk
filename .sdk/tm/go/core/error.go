package core

type DatagovCkanError struct {
	IsDatagovCkanError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewDatagovCkanError(code string, msg string, ctx *Context) *DatagovCkanError {
	return &DatagovCkanError{
		IsDatagovCkanError: true,
		Sdk:              "DatagovCkan",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *DatagovCkanError) Error() string {
	return e.Msg
}
