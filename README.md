급여 관리 프로그램 만들기
=======================
```
#include <stdio.h>
#define MAX 10

//구조체 선언
struct employee {
    char name[50];
    char phone[50];
    int time;
    int pay;
};

//각 데이터들을 입력받음 & 총 입력받은 사람 수를 리턴하기 위한 함수
int input(struct employee data[]);
//각각의 사람들이 받을 월급 & 월급 계산을 위한 함수 
int calc_pay(struct employee data[], int total_employee);
//내림차순으로 정렬하기 위한 함수
int sort_data(struct employee data[], int total_employee);
//최종 출력을 표시하기 위한 함수
int output(struct employee data[], int tot_employee);
//시급을 나타낼 인자 언급
int pay ;

int main()
{
    int tot_employee;
    int total_pay;
    int pay=8720;
    struct employee data[MAX];
    tot_employee = input(data); //input함수로부터 입력된 총 직원 수를 리턴
    total_pay = calc_pay(data, tot_employee); //calc_pay함수로부터 지불해야 할 월급 리턴
    output(data, tot_employee); //output함수로부터 결과 출력
    printf(" 총 직원 수 : %d명\n", tot_employee);
    return 0;
}

int input(struct employee data[]) //입력 함수
{
    int i;
    int pay=8720; //시급 정의
    printf("# 데이터를 입력하세요(이름, 전화번호, 이번 달 근무시간 합--> 순차적으로 출력되므로 순서에 맞게 입력하세요.)\n");
    printf("# 최대 %03d개의 데이터를 입력할 수 있습니다.\n ", MAX);
    printf("# 이름에 공백(Space)입력 금지");
    printf("# finish 입력 시 입력은 종료가 되며 이후 결과가 출력됩니다.\n");
    printf("# 2021년 최저 시급 : %5d원\n", pay);

    for (i=0 ; i < MAX ; i++)
    {
        printf("%d번째 근무자\n", i+1);
        printf("이름 : ");
        scanf("%s", data[i].name);
        if ((data[i].name[0] == 'x') && ((char)data[i].name[1] == '\0')) //선택문 : 'x'입력 시 종료
                goto OUT;
        printf("전화번호: ");
        scanf("%s", data[i].phone);
        printf("이번 달 근무시간 합계 :");
        scanf("%d", &data[i].time);
    }
OUT:
    return i;
}

int calc_pay(struct employee data[], int total_employee) //개인별 월급, 총 월급 계산 함수
{
    int i;
    int pay=8720;
    int total = 0;
    for (i=0 ; i < total_employee ; i++)
    {
        data[i].pay = (data[i].time)* pay; //각각의 직원이 받을 월급의 데이터들
        total += data[i].pay; //최종적으로 지불해야할 월급을 더하는 과정
    }
    return total;
}

int sort_data(struct employee data[], int tot_employee) //내림차순 정렬 함수
{
    int i,j;
    struct employee temp; //정렬을 하기 위해 임시로 사용하는 구조체
    for (i=0 ; i < tot_employee -1 ; i++)
    {
        for (j=i; j < tot_employee ; j++)
        {
            if (data[i].pay < data[j].pay) // 내림차순 정렬
            {
                temp = data[i];
                data[i]=data[j];
                data[j]= temp;
             }
        }
    }
    return 0;
}

int output(struct employee data[], int tot_employee) //직원 데이터 출력 함수
{
    int i;
    printf("\n");
    for (i=0 ; i< tot_employee; i++)
    {
            printf("이름=%16s\n", data[i].name);
            printf("휴대폰 번호=%16s \n", data[i].phone);
            printf("근무 시간=%11d 시간 \n", data[i].time);
            printf("월=%13d 원 \n", data[i].pay);
    }
    printf("이번달도 모두 고생 많았습니다. 감사합니다:) ");
    return 0;
}
----------------------------------------------------------------------------------------------------
Flow Chart
![image](https://user-images.githubusercontent.com/91776093/144867819-323f52ea-88bb-4d4b-9e1d-6bfff745acb1.png)
