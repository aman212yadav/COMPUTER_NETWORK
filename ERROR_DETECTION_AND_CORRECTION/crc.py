def getCrc(gen,message):
    gen=list(gen)
    msg=list(message+'0'*(len(gen)-1))
    crc=msg[0:len(gen)-1]
    for i in range(len(gen)-1,len(msg)):
            crc.append(msg[i])
            for j in range(1,len(gen)):
                if crc[0]=='1':
                  if gen[j] == crc[j] :
                      crc[j]='0'  
                  else:
                      crc[j]='1'          
            del(crc[0])              
    return "".join(crc)
def isError(gen,received):
    crc=getCrc(gen,received)
    return '1' in crc
print('enter message in binary : ',end=" ")
message=input()
print('enter crc generating bits : ',end=" ")
crc_generator=input()
crc=getCrc(crc_generator,message)
print('crc of message is : ',crc)
print('message sent to user : ',message+crc)
print('enter message received by user : ',end=" ")
received=input()
if isError(crc_generator,received):
    print('received message has error')
else:
    print('received message is error free')
