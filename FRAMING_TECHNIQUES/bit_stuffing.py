print('enter message : ',end=" ")   # in binary form like 0111011
s=input()
co=0
print('message after bit stuffing : ',end=" ")
for i in s:
     print(i,end="")
     if i == '1':
        co+=1
     else:
        co=0   
     if co==5:
        print('0',end="")
     

        
