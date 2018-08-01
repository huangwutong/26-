package sys.cls;

public class Replace
{
	public static String pep(String str)
	{
		System.out.println(str);
		return str.replace(" ", "").replace("'", "");
	}
}
