#include<bits/stdc++.h>
using namespace std;
int main(){
int n,slotSize;
cout<<"Enter Number of User: ";
cin>>n;
cout<<"Enter time required to each user \n";
int arr[n+1];
queue<int> q;
for(int i=1;i<=n;i++)
{
    cin>>arr[i];
    q.push(i);
}
cout<<"Enter slot size : ";
cin>>slotSize;
int t=0;
while(!q.empty()){
        int id=q.front();
        q.pop();
        cout<<" At time : "<<t<<" , user : "<<id<<" is using\n";
        if(arr[id]>slotSize){
            arr[id]-=slotSize;
            q.push(id);
        }else{
           arr[id]=0;
        }
        t+=slotSize;
}
}
