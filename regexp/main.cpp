#include <iostream>

using namaespace std;


struct Status {
    vector<Edge*> InEdges;
    vector<Edge*> OutEdges;
    bool FinalStatus;
};

struct Edge {
    XXX MatchContent;
    vector<YYY> Actions;
    Status *Start;
    Status *End;
};


/*
CharClass: charclass数组
DFA: DFA二维数组
Final: 长度为状态数量的数组, 记录某个状态是否
Input: 输入的字符串
Begin: 成功匹配的起始位置, 0为失败
Length: 成功匹配的长度

*/
int RunDFA(int *CharClass, int **DFA, bool *Final, wchar_t *Input) {
    int LastFinalLength = -1;
    int Status = 0;
    wchar_t* Init = Input;

    while (Status != -1) {
        if (Final[Status]) {
            LastFinalLength = Input - Init;
        }

        int cc = CharClass[*Input];
        *Input ++;

        if (cc < 0) break;

        Status = DFA[Status][cc];
    }
    return 
}


int main()
{
    //这里会构造两个对象池子
    vector<Status*> AllStatuses;
    vector<Edge*> AllEdges;
    return 0;
}