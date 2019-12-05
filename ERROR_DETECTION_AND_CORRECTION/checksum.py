def getOnesComplement(n):
    n=list(bin(n)[2:])
    for i in range(len(n)):
        if n[i]=='0':
            n[i]='1'
        else:
            n[i]='0'
    return "".join(n)       

    


print("Enter data received : ",end=" ")
data_received=list(map(int,input().split()))

if int(getOnesComplement(sum(data_received)),2)!=0:
    print('received message has error')
else:
    print('received message is error free')

