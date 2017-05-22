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
int nrDef, nrParameters, i, j, k, el, startingNode, querryNodes[1000], nrQuerryNodes;
vector<vector<int>>frontConnections[1000];
int backConnection[1000],completed[1000];
vector<int>toProve,temp;
deque<vector<int>>initialState;
void RBFS(deque<vector<int>>que)
{
	int maxSize=1LL<<30;
	vector<int>toSplit;
	for (auto it = que.begin(); it != que.end(); it++)
		if(int((*it).size())<maxSize)
		{
			maxSize = int((*it).size());
			toSplit = *it;
		}
	for (auto it = toSplit.begin(); it != toSplit.end(); it++)
	{
		for (auto iter = frontConnections[*it].begin(); iter != frontConnections[*it].end(); iter++)
			if((*iter).size()!=1&&*(*iter).begin()!=0)
			{
				que.push_back(*iter);
			}
			else
			{
				completed[*it] = 1;
			}
	}
	int ok = 1;
	for (auto it = toSplit.begin(); it != toSplit.end(); it++)
		if(completed[*it]==0)
		{
			ok = 0;
			break;
		}
	if (ok)
		completed[backConnection[*toSplit.begin()]] = 1;
	if (completed[startingNode])
	{
		cout << "Done";
	}
	else
		RBFS(que);
}
int main()
{
	ifstream f("file.in");
	ofstream g("file.out");
	int n;
	f >> nrDef;
	for (i = 1; i <= n; i++)
	{
		f >> nrParameters >> startingNode;
		if (nrParameters == 0)
		{
			temp.clear();
			temp.push_back(0);
			frontConnections[startingNode].push_back(temp); // 0 means the true node.
		}
		temp.clear();
		for (j = 1; j <= nrParameters; j++)
		{
			f >> el;
			temp.push_back(el);
			backConnection[el] = startingNode;
		}
		frontConnections[startingNode].push_back(temp);
	}
	f >> nrQuerryNodes;
	for (i = 1; i <= nrQuerryNodes; i++)
	{
		f >> el;
		toProve.push_back(el);
	}
	for (auto it = toProve.begin(); it != toProve.end(); it++)
	{
		for (auto iter = frontConnections[*it].begin(); iter != frontConnections[*it].end(); iter++)
			initialState.push_back(*iter);
	}
	RBFS(initialState);
	return 0;
}
