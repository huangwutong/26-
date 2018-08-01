package control;

import java.io.Serializable;

public class ExceptionHandler extends Exception 
					implements Serializable{
		public ExceptionHandler(String s){
			super(s);
		}
}
