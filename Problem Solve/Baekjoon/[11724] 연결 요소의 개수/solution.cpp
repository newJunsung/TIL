#include <iostream>
#include <vector>
#include <queue>

using namespace std;

bool isVisited[1000] = { false };

void dfs(int i, vector<int> map[]) {
    isVisited[i] = true;
    for(int j: map[i]) {
        if(isVisited[j] == false) {
            dfs(j, map);
        }
    }
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    
    vector<int> map[n];
    for(int i = 0; i < m; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        
        map[a - 1].push_back(b - 1);
        map[b - 1].push_back(a - 1);
    }
    
    int count = 0;
    for(int i = 0; i < n; i++) {
        if(isVisited[i] == false) {
            dfs(i, map);
            count++;
        }
    }
    printf("%d\n", count);
}
