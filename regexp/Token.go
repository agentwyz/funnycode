package main

import "net/textproto"

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

func (this *Token) setStartPos(startPos int) int {
	
}
