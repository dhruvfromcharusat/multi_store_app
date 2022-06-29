#include<bits/stdc++.h>
#include<unordered_map>
using namespace std;
vector<int> rd(int a[],int _size) {
    vector<int> result;
    unordered_map<int,bool> mymap;
    for(int i=0;i<_size;i++) {
        if(mymap.count(a[i])==0)
        {
            result.push_back(a[i]);
            mymap[a[i]]=true;
        }
    }
    return result;
}
int main() {
    vector<int> result;
    int n;
    cin>>n;
    int arr[n];
    for(int i=0;i<n;i++) {
        cin>>arr[i];
    }
    result=rd(arr,n);
    for(int i=0;i<n;i++) {
        cout<<result[i];
    }
    return 0;
}
