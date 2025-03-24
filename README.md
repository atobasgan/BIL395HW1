aşağıdaki şekilde derliyoruz
bison -d calculator.y
flex calculator.l
gcc lex.yy.c calculator.tab.c -lm -o calculator
run ise şu şekilde: ./calculator
burdan input girdiğimizde output alıyoruz terminal üzerinden enter + (control+d) yaptığımızda çıktı geliyor

calculator.l   burda girdiyi tokenlere ayırıp bu tokenlerin isimlerine göre işlem yapılır mesela + sembolunde plus dönüyoruz ona göre işlem yapıyoruz örneğin (2 + 3)  ifadesi ( 2 + 3 ) şeklinde tokenlere ayrılır LPAREN FLOAT PLUS FLOAT RPAREN şeklinde tokenler oluşur 

calculatoru.y kısmıdna ise amaç karakterleri tokene çevirip bu tokenlere göre işlemler yapmaktır float tokenlerini double tutuyoruz 
aynı zamanda işlem önceliklerini de atıyoruz * / mesela + - den önce yapılıyor ^işlemi ise en önce ardından işlem yapıyoruz ve sonucu yazdırıyoruz
