#include<fstream>
#include<cstring>
#include<queue>
#include<algorithm>
#include<string.h>
#include<bitset>
#include<ctime>
#include<set>
#include<cmath>
#include<unordered_map>
#include<iomanip>
#include<map>
#include<stack>
#include<vector>
#include<bitset>
#include<functional>
#include<iostream>
#include<deque>
#include<unordered_set>
#include<queue>
#include<list>
#include<array>
#include<ctype.h>
using namespace std;
int nrDef, nrParameters,i,j,k,el,startingNode,querryNodes[1000],nrQuerryNodes;
vector<int>connections[1000];
deque<int>toProve;
void RBFS()
{
	
}
int main() 
{
	ifstream f("file.in");
	ofstream g("file.out");
	int n;
	f >> nrDef;
	for (i = 1; i <= n; i++) 
	{
		f >> nrParameters>>startingNode;
		if (nrParameters==0)
			connections[startingNode].push_back(0); // 0 means the true node.

		for (j=1;j<=nrParameters;j++) 
		{
			f >> el;
			connections[startingNode].push_back(el);
		}
	}
	f >> nrQuerryNodes;
	for (i = 1; i <= nrQuerryNodes; i++)
		f >> querryNodes[i];
	RBFS();
	return 0;
}
