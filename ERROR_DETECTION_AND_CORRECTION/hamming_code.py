def getRedundantBit(m):
    r=0;
    while 2**r < m+r+1:
       r+=1
    return r   
    
print("enter message in binary : ")
msg=list(input())
m=len(msg)
r=getRedundantBit(m)
l=[0]*(m+r)
j=m-1;
for i in range(m+r-1,-1,-1):
    p=m+r-i
    if p&(p-1)!=0:
        l[i]=int(msg[j])
        j-=1

for i in range(r):
    j=m+r-2**i
    idx=j
    length=2**i
    odd=1
    co=0
    for k in range(j,-1,-1):
        if odd:
            l[idx]=l[idx]^l[k]
        co+=1
        if co==length:
            odd=1-odd;
            
        
bit=['0']*r
print('message sent : ',*l)
print('enter message received : ')
msr=list(map(int,input().split()))
for i in range(r):
    p=0
    j=m+r-2**i
    idx=j
    length=2**i
    odd=1
    co=0
    for k in range(j,-1,-1):
        if odd:
            p=p^msr[k]
        co+=1
        if co==length:
            odd=1-odd;
    if p==1:
        bit[r-1-i]='1'
pos=int(''.join(bit),2)
if pos==0:
    print('No error detected')
else:
    print('Error at position : ',pos)
    
