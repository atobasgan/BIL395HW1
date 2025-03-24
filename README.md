aşağıdaki şekilde derliyoruz
bison -d calculator.y
flex calculator.l
gcc lex.yy.c calculator.tab.c -lm -o calculator
run ise şu şekilde: ./calculator
burdan input girdiğimizde output alıyoruz terminal üzerinden
