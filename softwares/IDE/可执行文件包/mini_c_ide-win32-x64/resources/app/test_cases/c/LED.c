int main(){
	int a;
	a=0;
	int b;
	b=1;
	while(true){
		b=b<<1;
		if(b==0){
			b=1;
		}
		$0xFFFFFC60=b;
		while(a<100000){
			a=a+1;
		}
		a=0;
		
		
	}
	return 0;
}