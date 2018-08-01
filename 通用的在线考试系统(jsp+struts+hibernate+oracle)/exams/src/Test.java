import java.util.List;

import com.xdf.exams.bean.Subject;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IExamService;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		IExamService ser = BOFactory.getExamService();
		List list = ser.findExamable(new Long(1));
		for (Object o:list) {
			Subject sub = (Subject)o;
			System.out.println(sub.getName());
		}
		
	}

}
