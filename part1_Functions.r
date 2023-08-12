# Project 1: Weighted Dice
getwd()
setwd("/Users/xrb/Desktop/R语言学习/R Programming/Hands-On Programming with R")
#2.2 Objects:What is an object? Just a name that you can use to call up stored data. 
a = 1:6
#there are a few rules. 
# First, a name cannot start with a number. 
# Second, a name cannot use some special symbols, like ^, !, $, @, +, -, /, or *:

#使用ls()函数查看已经使用的对象名称 list objects
ls()

#2.3 Functions
round(mean(a)) #round()取整，mean()取均值,函数计算由内层到外层

sample(x = a,size = 2)#sample()随机从x中返回size个值
sample(a,size = 2)#可简写
#注意到第二个值永远无法和第一个值相等，因为sample()默认条件下为不放回抽样

#加入参数replace实现放回抽样，模拟投掷两个骰子
sample(a,size = 2,replace = TRUE)
#把它赋值到一个对象
dice = sample(a,size = 2,replace = TRUE)

#2.4编写自定义函数
# 要创建您自己的函数，您需要复制这些部分并将它们存储在 R 对象中，
# 您可以使用function函数来完成此操作。
# 为此，请调用function()并在其后面加上一对大括号{}。
# function将从您在大括号之间放置的任何 R 代码构建一个函数。
# my_function <- function() {}

#使用function()函数封装掷骰子代码，命名为roll
roll = function(){
  a = 1:6
  dice = sample(a,size = 2,replace = TRUE)
  dice
}
roll()#调用函数
#定义一个函数实现两个骰子的数字求和
rollsum = function(a=1:6){
  dice = sample(a,size=2,replace = TRUE)
  sum(dice)
}
rollsum()

#2.5函数参数,每次调用时可指定不同的参数
roll2 = function(bones){
  dice = sample(bones,size = 2,replace = TRUE)
  dice
}#添加参数bones
roll2(bones = 1:9)

#提取函数：
# To use it, highlight the lines of code in your R script that you want to turn into a function. 
# Then click Code > Extract Function in the menu bar. 
# RStudio will ask you for a function name to use and then wrap your code in a function call.

#3 Packages
library(pacman)
p_load(ggplot2)

x = c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
y = x^3
data = data.frame(x,y)
ggplot(data,aes(x=x,y=y))+
  geom_point(color = "steelblue")
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3,binwidth = 1)

#使用replicate()函数来重复运行某一函数，将返回值保存为向量
rolls = replicate(1000,rollsum())#参数：重复次数,要重复的函数
qplot(rolls,binwidth = 1)
#用ggplot命令实现
data2 = data.frame(rolls)#把向量存到data frame中以供ggplot使用
ggplot(data2,aes(x=rolls))+
  geom_bar()
#从图像可以看出，骰子是均匀分布的，公平的

#现在给sample()函数中添加参数来改变骰子出现数字6的概率改为3/8，其余为1/8
rollsum1 = function(a = 1:6){
  dice = sample(a,size = 2,replace = TRUE,
                prob = c(1/8,1/8,1/8,1/8,1/8,3/8))#定义一个不均匀的骰子
  sum(dice)
}
#画图查看一下分布情况：
rolls1 = replicate(1000,rollsum1())
data3 = data.frame(rolls1)
ggplot(data3,aes(x=rolls1))+
  geom_bar()
#发现包含数字6的求和频率明显增加
#The End
