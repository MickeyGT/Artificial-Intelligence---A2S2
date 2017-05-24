#include<iostream>
#include<string.h>
using namespace std;
int i, nr;
int main()
{
	string s = "Turcu Gabriel";
	for (i = 0; i <= s.size() - 1; i++)
		nr += s[i];
	cout << "Your problem is: "<<(nr % 4) + 1;
	return 0;
}