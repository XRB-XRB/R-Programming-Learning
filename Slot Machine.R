#Slot Machine

#获得三个符号
get_symbols = function(){
  wheels = c("DD","7","BBB","BB","B","C","0")
  sample(wheels,size = 3,replace = TRUE,prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

symbols = get_symbols()
#根据三个符号进行奖励分配
score <- function(symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  # get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,    "B" = 10, "C" = 10, "0" = 0) #用向量构建各个符号对应的奖励值
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5 # 情况二只有一种奖励值
  } else {
    cherries = sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1] #上方的if树可以用查找table的形式实现
  }
  # adjust for diamonds
  diamonds = sum(symbols == "DD")
  prize = prize*2^diamonds
  prize
}

#整合得到play函数
play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}
#调用老虎机
play()

