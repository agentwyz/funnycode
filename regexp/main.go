package main

import (
	"container/list"
)

type GrammarNode struct {
	//子节点
	name     string
	Children list.List
	Type     GrammarNodeType

	charSet CharSet

	minTimes int
	maxTimes int
}

func NewNode(name string, Type GrammarNodeType) GrammarNode {
	return GrammarNode{name: name, Type: Type, minTimes: 1, maxTimes: 1}
}

func (gnode GrammarNode) CreateChild(Type GrammarNodeType) GrammarNode {

}

func (gnode GrammarNode) setRepeatTimes() {

}

//---------------charset------------------------------
type CharSet struct {
	Letter      CharSet
	SmallLetter CharSet

	//其实字符
	fromChar byte
	//终止字符
	toChar byte

	//是否取得补集
	exclude	bool

	//----一些常量-------
	
}

func NewCharSet(char byte) CharSet {
	return CharSet{
		formChar: char,
		toChar: char,
		exclude: false,
	}
}

func (charSet CharSet) InitLetter() {
	charSet.addSubSet(charSet.SmallLetter)
	charSet.addSubSet(charSet.Letter)
}

func (charSet *CharSet) addSubSet() {

}

//---------------GrammarNodeType---------------------
type GrammarNodeType int

const (
	And     GrammarNodeType = iota //并运算
	Or                             //或运算
	char                           //字符, 用于表示
	Token                          //一个
	Epsilon                        //空集合
)

//-------------simpleGrammar1-----------------------
func sampleGrammar1() GrammarNode {
	var node GrammarNode = NewNode("regex1", Or)

	//------------int-------------------------------
	var intNode GrammarNode = node.CreateChild(And)
	intNode.CreateChild(NewCharSet('i'))
	intNode.CreateChild(NewCharSet('n'))
	intNode.CreateChild(NewCharSet('t'))

	//------------identifier------------------------
	var idNode GrammarNode = node.CreateChild(And)
	var firstLetter GrammarNode = idNode.CreateChild(letter)
	_ = firstLetter

	var letterOrDigit GrammarNode = idNode.CreateChild(letter)
	letterOrDigit.setRepeatTimes(0, -1)

	//------------number--------------------------
	var literalNode GrammarNode = node.CreateChild(CharSet.digit)
	literalNode.setRepeatTimes(1, -1)

	return node
}

func main() {

}
