package business;

import org.apache.commons.lang.RandomStringUtils;

public class Test {
public static void main(String[] args){
	//RandomStringUtils r=new RandomStringUtils();
	String random=RandomStringUtils.randomNumeric(20);
	String str1="13910000000";
	String str2="13910000010";
	String before=str1.substring(0,2);
	int a1=Integer.parseInt(str1.substring(2,11));
	int a2=Integer.parseInt(str2.substring(2,11));
	for(int i=a1;i<=a2;i++){
		System.out.println(before+i);
	}
	//System.out.println(random);
}
}
