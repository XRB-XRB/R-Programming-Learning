# 4 Project 2: Playing Cards 
#How to store, retrieve, and change data values in your computer’s memory

# 5 R Objects


# 5.1 Atomic Vectors 原子向量
five = c(1,2,3,4,5)
is.vector(five)#布尔判断five是否为原子向量

length(five)#返回向量长度

# 5.1.1 Doubles 双精度向量
die = c(1,2,3,4,5,6)
typeof(die)#显示类型
# 5.1.2 integers
int = c(1L,2L,3L)
typeof(int)
# 5.1.3 Characters 字符串
text = c("hello world")
typeof(text)
# 5.1.4 Logicals 逻辑
logic = c(TRUE,FALSE,TRUE)
typeof(logic)
# 5.1.5 Complex and Raw 复数，原始字节
comp <- c(1 + 1i, 1 + 2i, 1 + 3i) 
comp ## 1+1i 1+2i 1+3i  
typeof(comp) ## "complex"

raw(3) ## 00 00 00  
typeof(raw(3)) ## "raw"

#构建一个一维卡牌名称向量
hand = c("ace", "king", "queen", "jack", "ten")
hand
typeof(hand)


# 5.2 Attributes 属性

# 你可以用attributes()查看一个object具有哪些属性。如果一个对象没有属性，属性将返回NULL。
attributes(die)
# 5.2.1 Names
names(die)
names(die) = c("one", "two", "three", "four", "five", "six")#给向量添加名称属性
names(die)
attributes(die)
die#此时每个元素上方会显示对应的name
names(die)=NULL#删除属性
die
# 5.2.2 Dim 维度
dim(die) = c(2,3)#将die定义为2*3的矩阵
die
dim(die) = c(1,2,3)#1行，2列，3片的超立方体
die


# 5.3 Matrices 矩阵
m = matrix(die,2,3,byrow = TRUE)#byrow参数实现元素按行填充(默认按列填充)
m


# 5.4 Arrays 数组
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar
#创建一个矩阵记录黑桃卡牌的花色和名称
hand1 <- c("ace", "king", "queen", "jack", "ten", 
           "spades", "spades", "spades", "spades", "spades")
matrix(hand1,nrow = 5)


# 5.5 Class类
class(die)
die = matrix(die,2,3)
class(die)
# 5.5.1日期和时间
now <- Sys.time() 
now
class(now)#日期、时间的类是"POSIXct" "POSIXt"（它有两个类）
# 5.5.2 Factors 分类变量
#ggplot绘图过程中已经学习了

# 如果您试图将多种类型的数据放入一个向量中，R将把元素强制转换coercion为单一类型的数据。
card <- c("ace", "hearts", 1) 
card ## "ace"    "hearts" "1" 
typeof(card)


# 5.6 coercion 强制转换
# 如果原子向量中存在字符串，R 会将向量中的其他所有内容转换为字符串。
# 如果向量仅包含逻辑值和数字，R 会将逻辑值转换为数字；everyTRUE变为 1，everyFALSE变为 0

sum(c(TRUE, TRUE, FALSE, FALSE))#R会转化为sum(c(1, 1, 0, 0))，相当于求true的数量


#可以明确要求 R 使用as函数将数据从一种类型转换为另一种类型
as.character(1) ## "1"  
as.logical(1) ## TRUE  
as.numeric(FALSE) ## 0

# 5.7 Lists列表
#使用list函数创建一个列表，list创建列表和c创建向量的方式相同，逗号分隔每个元素：
list1 = list(100:130, "R", list(TRUE, FALSE))

#练习：创建一个列表记录红桃A扑克牌，元素包括：牌面(ace)；花色(hearts)；点数(1)
card = list("ace","hearts",1)
card

# 5.8 Data Frames 数据框
#数据框可看作列表的二维版本
# 输入多个向量，构成一个Data Frame
df = data.frame(face = c("ace","one","two"),
                suit = c("clubs", "clubs", "clubs"), 
                value = c(1, 2, 3))
df

#用数据框知识创建整副扑克牌：
deck = data.frame(face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
                          "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten", 
                          "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace", 
                          "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", 
                          "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine", 
                          "eight", "seven", "six", "five", "four", "three", "two", "ace"),
                  suit = c("spades", "spades", "spades", "spades", "spades", "spades", 
                          "spades", "spades", "spades", "spades", "spades", "spades", "spades", 
                          "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", 
                          "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds", 
                          "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", 
                          "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts", 
                          "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", 
                          "hearts", "hearts", "hearts", "hearts", "hearts"),
                  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 
                           7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 
                           10, 9, 8, 7, 6, 5, 4, 3, 2, 1))
head(deck)
write.csv(deck,file = "cards.csv",row.names = FALSE)

# 5.11总结
# 迄今为止，学习了5种在R中保存数据的方法：vector，list，matrix，data frame，array
# 其中data frame为数据科学领域重点需要掌握的

