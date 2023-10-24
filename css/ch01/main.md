- 按照类型将CSS属性进行分类并且记忆
- 按照功能将CSS选择器进行分类并且记忆
- 将效果颗粒度化

解析文件:
- 将Html文件转换为DOM树
- 将CSS文件转换成为CSSOM 树


几何属性:
包括布局、尺寸等可用数学几何衡量的属性
布局
display
float
position
list
table
flex
columns
grid

尺寸:
margin
padding
border
width
height

回流一定会发生重新绘制
重绘不一定会引发回流

使用transform代替top

top是几何属性, 操作top会改变

使用visibility:hidden替换display:none
避免使用Table进行布局

避免样式节点层级过多


盒子模型
盒子模型是CSS中非常重要的一个概念, 将文档节点看成一个盒子

在HTML文档解析中, 每个节点都会被描述成为一个盒模型
在依据各个节点对应的CSS规则, 最后渲染成为一个完整的页面

盒模型由以下属性组成
1. margin: 边距
2. border:  表示
3. padding: 填充, 内部着色区域 
4. content