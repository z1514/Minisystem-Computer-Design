int fib(int n){
	if(n<=2)
		return 1;
	int a;
	int b;
	a=fib(n-1);
	b=fib(n-2);
	return a+b;
}
void main(){
	int c;
	c=fib(5);
}
	
