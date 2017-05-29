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
int nrDef, nrParameters, i, j, k, el, startingNode, querryNodes[1000], nrQuerryNodes, programFinished = -1;
vector<vector<int>>frontConnections[1000];
int backConnection[1000], completed[1000];
vector<int>toProve, temp;
deque<vector<int>>initialState;
void RBFS(deque<vector<int>>que)
{
	// the size we need to find the minimum vector to split.
	int minSize = 1LL << 30;
	// the vector in which we will hold the vector we need to split
	vector<int>toSplit;
	for (auto it = que.begin(); it != que.end(); it++)
		// finding the vector
		if (int((*it).size())<minSize)
		{
			// updating the value of minSize
			minSize = int((*it).size());
			// updating the value of the toSplit vector
			toSplit = *it;
		}
	// for each node in the toSplit, we look at its frontConnections and see if they're completed or if we add them to the deque.
	for (auto it = toSplit.begin(); it != toSplit.end(); it++)
	{
		for (auto iter = frontConnections[*it].begin(); iter != frontConnections[*it].end(); iter++)
			// if it only has one frontConnection and that one points to the "yes" node, we mark it as completed
			if ((*iter).size() == 1 && *(*iter).begin() == 0)
			{
				completed[*it] = 1;
			}
			else
			{
				que.push_back(*iter);
			}
	}
	// Deleting from the deque the vector we have previously split.
	for (auto it = que.begin(); it != que.end(); it++)
		if (*it == toSplit)
		{
			que.erase(it);
			break;
		}
	// If there are no nodes that still need to be proven.
	if (que.size() == 0)
		programFinished = 1;
	int ok = 1;
	// Checking if all the sons of a node are marked as complete so we can mark the parent as well.
	for (auto it = toSplit.begin(); it != toSplit.end(); it++)
		if (completed[*it] == 0)
		{
			ok = 0;
			break;
		}
	// Marking it as complete if ok==1 and the toSplit vector isn't emtpy.
	if (ok&&toSplit.size() != 0)
		completed[backConnection[*toSplit.begin()]] = 1;
	ok = 1;
	//Checking if all the nodes that we needed to complete have been completed.
	for (auto it = toProve.begin(); it != toProve.end(); it++)
		if (completed[*it] == 0)
		{
			ok = 0;
			break;
		}
	//Modify the value of programFinished based on wether or not all the nodes that we need to prove have been proven.
	if (ok)
		programFinished = 0;
	if (programFinished == 1)
	{
		// This means there is at least 1 path that leads to "yes" for our nodes in toProve.
		cout << "The answer to the querry is true.";
		return;
	}
	else
		if (programFinished == 0)
		{
			// This means there is no path that leads to "yes" for our nodes in toProve.
			cout << "The answer to the querry is false.";
			return;
		}
	RBFS(que);
}
int main()
{
	ifstream f("file.in");
	// Reading the number of pre-defined definitons.
	f >> nrDef;
	// for each one of them
	for (i = 1; i <= nrDef; i++)
	{
		// we read the number of parameters in between the ^ and the starting node from which the node can consist.
		f >> nrParameters >> startingNode;
		// if the number of parameters is 0, that means we have a node that is connected to the "yes" node.
		if (nrParameters == 0)
		{
			temp.clear();
			// the node "0" will be our "yes" node.
			temp.push_back(0);
			// frontConnections holds the rules for each node.
			frontConnections[startingNode].push_back(temp);
		}
		temp.clear();
		// for each parameter
		for (j = 1; j <= nrParameters; j++)
		{
			f >> el;
			// we add them to the temp vector
			temp.push_back(el);
			// we mark their parents
			backConnection[el] = startingNode;
		}
		// we push the temp vector in the frontConnections vector
		frontConnections[startingNode].push_back(temp);
	}
	// reding the number of querry nodes.
	f >> nrQuerryNodes;
	for (i = 1; i <= nrQuerryNodes; i++)
	{
		f >> el;
		// we add them to the toProve vector.
		toProve.push_back(el);
	}
	for (auto it = toProve.begin(); it != toProve.end(); it++)
	{
		for (auto iter = frontConnections[*it].begin(); iter != frontConnections[*it].end(); iter++)
			// we create the initial state deque that we will call the first RBFS function with.
			initialState.push_back(*iter);
	}
	// first and only required call of the function
	RBFS(initialState);
	return 0;
}