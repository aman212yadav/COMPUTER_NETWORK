# assuming user will enter FLAG as flag
print("enter message : ",end=" ")
s=input().split()
print("message after byte stuffing : ",end=" ")
for i in s:
    if i=='flag' or i=='esc':
        print('esc',end=" ")
    print(i,end=" ")    
