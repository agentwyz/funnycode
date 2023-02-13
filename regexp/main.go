package main

import (
	"container/list"
)

type GrammarNode struct {
	//子节点
	children list.List
	//节点类型
	nodeType     GrammarNodeType
	//用于词法规则, 指的是该节点能匹配的字符集合
	//其中CharSet可以是一个树状结构, 有
	charSet CharSet

	//该节点可以重复的次数
	//默认次数
	minTimes int
	maxTimes int

	//节点名称
	name string

	//语法规则中的Token, 也就是终结符
	token *Token

	//是否被词法处理器忽略, 比如空白字符
	neglect bool

}

func NewNode(name string, ) {

}

func NewNode(name string, nodeType GrammarNodeType) GrammarNode {
	return GrammarNode{
		name: name,
		nodeType: nodeType,
		minTimes: 1,
		maxTimes: 1,
		neglect: false,
	}
}




func (this *GrammarNode) NewNodeType(set CharSet) GrammarNode {
	this.nodeType = char
	this
}


func (this *GrammarNode) NewNode(Type GrammarNodeType) GrammarNode {
	//返回一个对象
	return GrammarNode{nodeType: Type}
}

func (this *GrammarNode) CreateChild(Type GrammarNodeType) GrammarNode {
	var grammarNode GrammarNode = this.NewNode(Type)
	this.addChild(grammarNode)

}

func (this *GrammarNode) Create(charSet CharSet) GrammarNode {
	var grammarNode GrammarNode = NewNode(charSet)
	this.addChild(grammarNode)
	return grammarNode
}

func (this *GrammarNode) addChild (child GrammarNode) {
	this.children = *list.New()
	this.children.PushBack(child)

	if child.name != "" {
		if child.getGrammarName() != "" {
			child.name = "_" + child.getGrammarName() + string(this.children.Len())
		} else {
			child.name = "_" + string(child.nodeType) + string(this.children.Len())
		}

		if this.name != "" {
			child.name = this.name + child.name
		}

		if child.name[0] != '_' {
			child.name = "_" + child.name
		}
	}

}

func (this *GrammarNode) getGrammarName () string {
	if this.token != nil {
		return this.token.getType()
	} else if this.isNamedNode() {
		return this.name
	}
	return ""
}

func (this *GrammarNode) isNamedNode() bool {
	if this.name != "" && len(this.name) > 1 && this.name[0] != '_' {
		return true
	} else {
		return false
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

//首先设置一个init函数, 使用进行初始化结构体中的字段
func initCharSet() CharSet {
	digit := CharSet{ fromChar: '0', toChar: '9', exclude: false }
	smallLetter := CharSet{ fromChar: 'a', toChar: 'z', exclude: false }
	capitalLetter := CharSet{ fromChar: 'A', toChar: 'Z', exclude: false}

	return CharSet{
		digit: digit,
		smallLetter: smallLetter,
		capitalLeter: capitalLetter,
	}
}

func NewCharSet(char byte) CharSet {
	charSet := initCharSet()
	letter := charSet.InitLetter()

	return CharSet{
		fromChar: char,
		toChar: char,
		exclude: false,
		digit: charSet.digit,
		smallLetter: charSet.smallLetter,
		capitalLeter: charSet.capitalLeter,
		letter: letter,
	}
}


func (this *CharSet) InitLetter() CharSet {
	this.addSubSet(this.smallLetter)
	this.addSubSet(this.letter)
	return *this
}


func (this *CharSet) addSubSet(set CharSet) {
	if this.subSets.Len() == 0 {
		this.subSets = *list.New()
	}
	this.subSets.PushBack(set)
}

//---------------GrammarNodeType---------------------
type GrammarNodeType int

const (
	and     GrammarNodeType = iota //并运算
	or                             //或运算
	char                           //字符, 用于表示
	token                          //一个
	epsilon                        //空集合
)

//-------------simpleGrammar1-----------------------
func sampleGrammar1() GrammarNode {
	var node GrammarNode = NewNode("regex1", or)

	//------------int-------------------------------
	var intNode GrammarNode = node.CreateChild(and)
	intNode.Create(NewCharSet('i'))
	intNode.Create(NewCharSet('n'))
	intNode.Create(NewCharSet('t'))

	//------------identifier------------------------
	var idNode GrammarNode = node.CreateChild(and)
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
