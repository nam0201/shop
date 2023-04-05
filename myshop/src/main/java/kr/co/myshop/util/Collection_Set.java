package kr.co.myshop.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

public class Collection_Set {

	public static void main(String[] args) {
		// Collection 객체 Set : 순서 x , 중복 x, 
		
		// 메소드 : add(), get(), size()
		
		HashSet<String> set1=new HashSet<String>();
		set1.add("홍길동");
		set1.add("슈퍼맨");
		set1.add("배트맨");
		
		TreeSet<String> set2=new TreeSet<String>();
		set2.add("홍길동");
		set2.add("슈퍼맨");
		set2.add("배트맨");
		set2.add("홍길동");
		
		System.out.println(set1.size());
		System.out.println(set2.size());
		
		// get()이 없다..Iterator //순서가 없다 무작위로 나옴 중복도없엄.
		Iterator<String> my=set2.iterator();
		
		while(my.hasNext())
		{
			System.out.println(my.next());
		}
		
		System.out.println("=================================");
		//삭제 : remove()
		set2.remove("배트맨");
        my=set2.iterator();
		
		while(my.hasNext())
		{
			System.out.println(my.next());
		}
		
		//전체 삭제 : clear()
		set1.clear();
		System.out.println(set1.size());
	}

}
