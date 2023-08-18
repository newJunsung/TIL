#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    int count = -1;
    
    int my[4] = { -1, 1, 0, 0 };
    int mx[4] = { 0, 0, -1, 1 };
    
    
    char miro[100][101];
    for(int i = 0; i < n; i++) {
        scanf("%s", miro[i]);
    }
    
    queue<pair<pair<int,int>, int>> q;
    q.push(pair(pair(0, 0), 1));
    while(!q.empty()) {
        auto l = q.front();
        q.pop();
        // first는 y축 second는 x축
        if(l.first.first == n - 1 && l.first.second == m - 1) {
            count = l.second;
            break;
        }
        
        for(int i = 0; i < 4; i++) {
            int newY = l.first.first + my[i];
            int newX = l.first.second + mx[i];
            
            if((newY >= 0 && newY < n) && (newX >= 0 && newX < m)) {
                if(miro[newY][newX] == '1') {
                    miro[newY][newX] = '0';
                    q.push(pair(pair(newY, newX), l.second + 1));
                }
            }
        }
    }
    printf("%d\n", count);
}
