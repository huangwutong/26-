package com.laodong.test;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;


public class WordManager {
	public static void mainn(String[] args) {

		ActiveXComponent app = new ActiveXComponent("Word.Application"); //����word
		String inFile = "F:\\test.doc"; //Ҫ�滻��word�ļ�
		boolean flag = false;
		try {
		app.setProperty("Visible", new Variant(false)); //����word���ɼ�
		Dispatch docs = app.getProperty("Documents").toDispatch();
		
		Dispatch doc = Dispatch.invoke(
				docs, 
				"Open", 
				Dispatch.Method,
		        new Object[] {inFile, new Variant(false), new Variant(false)},
		        new int[1]
		        ).toDispatch(); //��word�ļ���ע���������������Ҫ��Ϊfalse�����������ʾ�Ƿ���ֻ����ʽ�򿪣���Ϊ����Ҫ����ԭ�ļ��������Կ�д��ʽ�򿪡�
		System.out.println("----222");
		Dispatch content = Dispatch.get(doc, "Content").toDispatch(); //��ȡword�ĵ����ݶ���
		Dispatch finder = Dispatch.get(content, "Find").toDispatch(); //��ȡfind����Ҳ�Ͳ����滻���Ǹ�����
		Variant f = new Variant(false);

		boolean rt = true;
		while (rt) {
		rt = Dispatch.invoke(finder, "Execute", Dispatch.Method,
		new Object[] {"ww", f, f, f, f, f, f, f, f, "��68��",  //ǰ����Ҫ���滻�����ִ������������ִ�
		new Variant(true)}
		, new int[1]).toBoolean(); //�滻Old ---> New
		}

		Dispatch.call(doc, "Save"); //����
		Dispatch.call(doc, "Close", f);
		flag = true;
		System.out.println("is over");
		}
		catch (Exception e) {
		e.printStackTrace();
		}
		finally {
		app.invoke("Quit", new Variant[] {});
		}
		}
	public static void main(String[] args) {
		ActiveXComponent app = null;
		try{
		String bookMarkKey = "LB_KJGG";
		String inFile = "F:\\test.doc"; //Ҫ�滻��word�ļ�
		app = new ActiveXComponent("Word.Application");
		Dispatch docs = app.getProperty("Documents").toDispatch();
		System.out.println("----111");
		
		Dispatch doc = Dispatch.invoke(
		docs,
		"Open",
		Dispatch.Method,
		new Object[] { inFile, new Variant(false), new Variant(false) }, 
		new int[1]
		).toDispatch(); // ��word�ļ�
		System.out.println("----222");
		Dispatch activeDocument = app.getProperty("ActiveDocument")
		.toDispatch();
		System.out.println("activedocument");
		   
		Dispatch bookMarks = app.call(activeDocument, "Bookmarks")
		.toDispatch();



		boolean bookMarkExist1 = Dispatch.call(bookMarks, "Exists",
		bookMarkKey).toBoolean();

		if (bookMarkExist1 == true) {
		System.out.println("exists bookmark!");
		Dispatch rangeItem = Dispatch.call(bookMarks, "Item",
		bookMarkKey).toDispatch();
		System.out.println("range item!");
		Dispatch range = Dispatch.call(rangeItem, "Range").toDispatch();
		System.out.println("range !");
//		 ȡ��ǩ��ֵ
		String bookMarkValue = Dispatch.get(range, "Text").toString();
		bookMarkValue = "test76";
		if (bookMarkValue != null) {
		Dispatch.put(range, "Text", new Variant(bookMarkValue));
		}

		} else {
		System.out.println("not exists bookmark!");
		}
		Dispatch.call(doc, "Save"); //����
		Variant f = new Variant(false);
		Dispatch.call(doc, "Close", f);
		/**
		 * ������رվͻ����
		 */
		boolean flag = true;
		System.out.println("is over");
//		 �����ļ�
//		Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {
//				inFile, new Variant(0) }, new int[1]);
		}
		catch (Exception e) {
			System.out.println("----enter Exception");
			e.printStackTrace();
			}
			finally {
				System.out.println("---enter finally");
				/**
				 * ���������ﲶ��δ�����ر�ʱ���쳣���Ա����ͷ��ļ�������ᷢ����������
				 */
			app.invoke("Quit", new Variant[] {});
			}

	}

}

