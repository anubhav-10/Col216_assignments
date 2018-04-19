#include <stdio.h>

#define GRID_X 8
#define GRID_Y 8

int board[64];
int score[2];
int turn = 1;
char player[3];

int get_index(int x,int y)
{
	return (x*8 + y);
}

int onBoard(int x,int y)
{
	if(x < 0 || y < 0 || x > 7 || y > 7)
		return 0;
	return 1;
}

void display()
{
	printf("   ");
	for(int i=0;i<8;i++)
		printf("%3d",i);
	printf("\n");
	for(int i=0;i<8;i++)
	{
		printf("%3d",i);
		for(int j=0;j<8;j++)
			printf("  %c",player[board[get_index(i,j)]]);
		printf("\n");
	}
	printf("\n\n");
	printf("Player %c : %d\nPlayer %c : %d\n",player[1],score[0],player[2],score[1]);
}

int check(int player)
{
	int isPossible = 0;
	int original_turn = turn;
	int i=0,j=0;
	turn = player;
	for(i=0;(i<8)&&(isPossible == 0);i++)
		for(j=0;(j<8)&& (isPossible == 0);j++)
			if(board[get_index(i,j)] == 0)
				isPossible = conversions(i,j,0);
	turn = original_turn;
	return isPossible;
}
int isValid(int i,int j)
{
	if(!onBoard(i,j) || board[get_index(i,j)] == turn)
		return 0;
	return 1;
}
int conversions(int i,int j, int set)
{
	int count = 0;
	if(isValid(i-1,j))
		count += convert(i-1,j,-1,0,set);
	if(isValid(i+1,j))
		count += convert(i+1,j,1,0,set);
	if(isValid(i,j-1))
		count += convert(i,j-1,0,-1,set);
	if(isValid(i,j+1))
		count += convert(i,j+1,0,1,set);
	if(isValid(i+1,j+1))
		count += convert(i+1,j+1,1,1,set);
	if(isValid(i-1,j-1))
		count += convert(i-1,j-1,-1,-1,set);
	if(isValid(i+1,j-1))
		count+= convert(i+1,j-1,1,-1,set);
	if(isValid(i-1,j+1))
		count += convert(i-1,j+1,-1,1,set);

	return count;
}

int play(int x, int y)
{
	if(!onBoard(x,y) || board[get_index(x,y)] != 0)
		return 0;

	int isValid = 0;
	int i=0,j=0;
	isValid = conversions(x,y,1);
	if(isValid == 0)
		return 0;

	int next_turn = (turn % 2)+1;
	board[get_index(x,y)] = turn;
	score[turn-1]++;
	if(check(next_turn))
	{
		turn = next_turn;
		return next_turn;
	}
	else if(check(turn))
	{
		printf("Not possible for new turn\n");
		return turn;
	}
	else
		return -1;
}

int convert(int x,int y, int inc_x, int inc_y, int set)
{
	if(!onBoard(x,y) || board[get_index(x,y)] == 0)
		return 0;
	if(board[get_index(x,y)] == turn)
		return 1;
	int ans = convert(x+inc_x,y+inc_y,inc_x,inc_y,set);
	if(ans == 1)
	{
		if(set == 1)
		{
			board[get_index(x,y)] = turn;
			score[turn-1]++;
			score[(turn%2)]--;
		}
		return 1;
	}
	else
		return 0;
}

int main()
{
	int end = 0;
	int x=0,y = 0;
	board[get_index(3,3)] = 1;
	board[get_index(4,4)] = 1;
	board[get_index(3,4)] = 2;
	board[get_index(4,3)] = 2;
	player[0] = '-';
	player[1] = '1';
	player[2] = '2';
	score[0] = 2;
	score[1] = 2;

	while(end == 0)
	{
		display();
		printf("\nPlayer %c:\n",player[turn]);
		scanf("%d %d",&x,&y);
		int ret = play(x,y);
		if(ret == 0)
			printf("\nInvalid Move\n\n");
		else if(ret == -1)
		{
			printf("Game Over\n");
			end = 1;
		}
	}
	return 0;
}