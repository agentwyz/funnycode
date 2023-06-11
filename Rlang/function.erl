%%这是一次绑定
X = 1234567

%%注意这里它不是一个等号它是一个赋值符号
X = X
Y = (2 + 4)

%%原子以小写字母开头
Y = hello

%%元组
P = {10, 45}

Person = {person, 
            {name, joe}, 
            {heigit, 1.45} 
            {footsize, 42}, 
            {eyecolour, brown}}.

Point = {point, 10, 45}

%%使用这种模式匹配
{point, X, Y} = Point
{_, {_, Who, _}, _} = Person


%%列表
Drawing = [{square, {10, 10}, 10}, 
           {triangle, {15, 10}, {35, 10}, {30, 40}}]

%%得到这个
ThingsToBuy = [{apples, 10}, {pears, 6}, {milk, 3}]
ThingsToBuy1 = [{oranges, 4}, {newspaper, 1} | ThingsToBuy]

%%提取列表元素
[Buy1 | ThingsToBuy2] = ThingsToBuy1

%%在erlang中的字符串
Name = "Hello".

%%表示某一个字符表示的整数
I = $s.