total_packets_received=0
total_generated_packets=0
start_time=0
end_time=0
with open('star_topology.tr') as f:
     for line in f:
         p=line.split()
         for i in range(len(p)):
             if i==1:
                if total_packets_received==0:
                   start_time=float(p[i])
                else:
                   end_time=float(p[i])
             if i==0 and p[i]=='r':
                total_packets_received+=1
         total_generated_packets+=1
   
print('total packets received : ',total_packets_received)
print('total packets generated : ',total_generated_packets)
print('packet delivery ratio : ',total_packets_received/total_generated_packets)
print('throughput : ',total_packets_received/(end_time-start_time)*1000)

 
