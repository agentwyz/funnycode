%%变量的绑定
X = 12345678.

%%变量的匹配
%%exception error: 
%%no match of right hand side value 3
X = 3.4.

%%我觉的上面那种写法不好
%%使用下面这种较好
12345678 = X

%%原子以小写字母开头
a = a.

%%元组
P = {10, 45}.

Person = {P}.

%%元组的模式匹配
{X, Y} = P.
{_, {_, Who, _}, _} = Person.

%%列表
List = [1, 2, 3, 4, 5].
Drawing = [{square, {10, 10}}].

%%列表的构造
List1 = [Drawing | List].


%%列表转化为元组
list_to_tuple([12, cat, "hello"]).

%%字符串
Name = "Hello".

%%获取一个字符表示的整数
I = $I.