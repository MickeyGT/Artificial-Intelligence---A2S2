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
int nrDef, nrParameters,i,j,k,el,startingNode;
vector<int>connections[1000];

class Node
{
private:
	int index, cost;

public:
	Node()
	{
		index = cost = 0;
	}

	Node(int index)
	{
		this->index = index;
		cost = 0;
	}

	void setIndex(int index)
	{
		this->index = index;
	}

	void setCost(int cost)
	{
		this->cost = cost;
	}

	int Index()
	{
		return index;
	}

	int operator==(Node other)
	{
		return other.index = index;
	}

	int Cost()
	{
		return cost;
	}

	int g()
	{
		return 0;
	}

};

Node Nodes[100];

class Problem
{
private:
	vector<Node> G[100100];
	Node goal = 0, initial = 1;

public:

	Problem()
	{
		initial = goal = NULL;
	}

	void add(int a, int b)
	{
		G[a].push_back(Nodes[b]);
		G[b].push_back(Nodes[a]);
	}

	void setInitial(Node initial)
	{
		this->initial = initial;
	}

	void setGoal(Node goal)
	{
		this->goal = goal;
	}

	vector<Node> successors(Node node)
	{
		return G[node.Index()];
	}

	Node Initial()
	{
		return initial;
	}

	int testGoal(Node node)
	{
		return node == goal;
	}

	int H(Node node)
	{
		int heuristic = 1;
		for (int i = 0; i < G[node.Index()].size(); ++i)
		{
			heuristic += G[G[node.Index()][i].Index()].size();
		}

		return heuristic;
	}

};

Node RBFS(Node &node, Problem *p, long limit)
{
	if (p->testGoal(node))
		return node;

	auto nodes = p->successors(node);
	if (!nodes.size())
		return p->Initial();

	for (auto &s : nodes)
		s.setCost(max(s.g() + p->H(s), node.Cost()));

	while (true)
	{
		sort(nodes.begin(), nodes.end(), [](Node &n1, Node &n2) { return n1.Cost() < n2.Cost(); });

		auto best = nodes.at(0);
		if (best.Cost() > limit)
			return p->Initial();

		auto alternative = nodes.at(1);

		auto result = RBFS(best, p, min<long>(limit, alternative.Cost()));
		if (!(result == p->Initial()))
			return result;
	}
}

Node recursiveBestFirstSearch(Problem *p)
{
	return RBFS(p->Initial(), p, std::numeric_limits<long>::max());
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

	return 0;
}
