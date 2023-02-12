package main

import (
	"container/list"
	"fmt"
)



type GrammarNodeType int32

const (

)

func (nodeType *GrammerNodeType) () {

}

type ChaSet struct {

}

type GrammarNode struct {
	//子节点
	Children list.List
	Type GrammarNodeType
	
	charSet CharSet

	
	minTimes int = 1
	maxTimes int = 1

}

func (gnode *GrammarNode) New(name string, Type GrammarNodeType) GrammarNode{
	return &GrammarNode{name: name, Type: Type}
}

func (gnode *GrammarNode) CreateChild(Type GrammarNodeType) GrammarNode {

}

//---------------------------------------------------
type CharSet struct {

}

func (charSet *charSet) NewCharSet


func sampleGrammar1() GrammarNode {
	var node GrammarNode = NewNode("regex1", )

	//------------int-------------------------------
	var intNode GrammarNode = node.CreateChild(GrammarNodeType.And)
	intNode.CreateChild(NewCharSet('i'))
	intNode.CreateChild(NewCharSet('n'))
	intNode.CreateChild(NewCharSet('t'))

	//------------identifier------------------------
	var idNode GrammarNode = node.CreateChild(GrammarNodeType.And)
	var firstLetter GrammarNode = idNode.CreateChild(CharSet.letter)

	var letterOrDigit GrammarNode = idNode.CreateChild(CharSet.letter);
	letterOrDigit.setRepeatTimes(0, -1)

	//------------number--------------------------
	var literalNode GrammarNode = node.CreateChild(CharSet.digit)
	literalNode.setRepeatTimes(1, -1)

	return node
}




func main() {

}