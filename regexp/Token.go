package main

type Token struct {
	//token的类型
	tokenType string
	//token的文本值
	text	string

	//token在整个字符流中的起始位置
	startPos int
	endPos	int

	//token所在的行列位置
	lineNumber int
	startColumn int
	endColumn int

	//程序结束符号
	eof Token
}

func initToken() Token {
	return Token{
		tokenType:   "",
		text:        "",
		startPos:    0,
		endPos:      0,
		lineNumber:  0,
		startColumn: 0,
		endColumn:   0,
		eof:         Token{tokenType: "$"},
	}
}

func NewToken(tokenType string, text string) Token {
	token := initToken()
	return Token{
		tokenType: tokenType,
		text:	text,
		lineNumber: token.lineNumber,
		startColumn: token.startColumn,
		endColumn:	token.endColumn,
		eof: token.eof,
	}
}

func (this *Token) getType() string {
	return this.tokenType
}


func (this *Token) setType(tokenType string) {
	this.tokenType = tokenType
}


func (this *Token) getText() string {
	return this.text
}


func (this *Token) setText(text string) {
	this.text = text
}


func (this *Token) getStartPos() int {
	return this.startPos
}


func (this *Token) setStartPos(startPos int) {
	this.startPos = startPos
}


func (this *Token) getEndPos() int {
	return this.endPos
}

func (this *Token) setEndPos(endPos int) {
	this.startPos = endPos
}

func (this *Token) getLineNumber() int {
	return this.lineNumber
}

func (this *Token) setLineNumber(lineNumber int) {
	this.lineNumber = lineNumber
}

func (this *Token) getStartColumn() int {
	return this.startColumn
}

func (this *Token) setStartColumn(startColumn int) {
	this.startColumn = startColumn
}

func (this *Token) getEndColumn() int {
	return this.endColumn
}

func (this *Token) setEndColumn(endColumn int) {
	this.endColumn = endColumn
}

func (this *Token) equals(obj interface{}) bool {
	//当前调用的对象this, 传入的对象
	if this == obj {
		return true
	}

	var token *Token = obj.(*Token)

	if this.tokenType != token.tokenType {
		return false
	}

	if this.text == "" {
		if token.text != ""{
			return false
		}
	} else {
		if this.text != token.text {
			return false
		}
	}

	return true
}


func (this *Token) toString() string {
	var rtn string = this.tokenType
	rtn += ":"

	if this.text != "" {
		rtn += this.text
	}

	return rtn
}