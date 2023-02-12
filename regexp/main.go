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

func (gNode *GrammarNode) NewNode(Type GrammarNodeType) GrammarNode {
	//返回一个对象
	return GrammarNode{Type: Type}
}

func (gNode *GrammarNode) CreateChild(Type GrammarNodeType) GrammarNode {
	var grammarNode GrammarNode = gNode.NewNode(Type)
	gNode.addChild(grammarNode)
}

func (gNode *GrammarNode) Create(charSet CharSet) GrammarNode {

}

func (gNode *GrammarNode) addChild (child GrammarNode) {
	gNode.Children = *list.New()
	gNode.Children.PushBack(child)

	if child.name != "" {
		if {

		} else {

		}

		if {

		}

		if {

		}
	}

}

func (gnode GrammarNode) setRepeatTimes() {

}

//---------------charset------------------------------
type CharSet struct {
	//----一些常量-------
	digit 		  CharSet //数字
	smallLetter   CharSet //小写字母
	capitalLeter  CharSet //大写字母
	letter        CharSet  //字母, 包括大写和小写
	letterOrDigit CharSet //字母或者数字
	whiteSpace    CharSet  //空白字符

	//起始字符
	fromChar byte
	//终止字符
	toChar byte

	//是否取得补集
	exclude	bool

	//子集
	subSets list.List

	//ascii表, 使用0-17

}

//首先设置一个init函数
func initCharSet() CharSet {
	digit := CharSet{ fromChar: '0', toChar: '9', exclude: false }
	smallLetter := CharSet{ fromChar: 'a', toChar: 'z', exclude: false }
	capitalLetter := CharSet{ fromChar: 'A', toChar: 'Z', exclude: false}
	letter := CharSet{}.InitLetter()

	return CharSet{
		digit: digit,
		smallLetter: smallLetter,
		capitalLeter: capitalLetter,
		letter: letter,
	}
}

func NewCharSet(char byte) CharSet {
	charSet := initCharSet()

	return CharSet{
		fromChar: char,
		toChar: char,
		exclude: false,
		digit: charSet.digit,
		smallLetter: charSet.smallLetter,
		capitalLeter: charSet.capitalLeter,
		letter: charSet.capitalLeter,
	}
}


func (charSet CharSet) InitLetter() CharSet{
	charSet.addSubSet(charSet.smallLetter)
	charSet.addSubSet(charSet.letter)
	return charSet
}


func (charSet *CharSet) addSubSet(set CharSet) {
	if charSet.subSets.Len() == 0 {
		charSet.subSets = *list.New()
	}
	charSet.subSets.PushBack(charSet)
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
	intNode.Create(NewCharSet('i'))
	intNode.Create(NewCharSet('n'))
	intNode.Create(NewCharSet('t'))

	//------------identifier------------------------
	var idNode GrammarNode = node.CreateChild(And)
	var firstLetter GrammarNode = idNode.Create(initCharSet().letter)
	_ = firstLetter

	var letterOrDigit GrammarNode = idNode.Create(initCharSet().letter)
	letterOrDigit.setRepeatTimes(0, -1)

	//------------number--------------------------
	var literalNode GrammarNode = node.Create(initCharSet().digit)
	literalNode.setRepeatTimes(1, -1)

	return node
}

func main() {

}
