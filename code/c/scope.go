package c


type Scope struct {
	symbol []Symbol
}


type BlockScope struct {

}

type Function


type Symbol struct {
	name string 		  //函数的名称
	enclosingScope Scope //函数的作用域
	visibility int		//表示可见性
	ctx ParserRuleContext //symbol关联的节点
}