package bookstore;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;

import bookstore.database.HibernateUtil;

public class ViewCartAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm srcForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        // 从Session中取得购物车对象(一个ArrayList，其中包括用户购买图书的bookid)
        List cart = (List) session.getAttribute("cart");
        // 根据bookid查找相应的图书信息
        List bookInfo = getBookInfo(cart);
        session.setAttribute("books", bookInfo);

        return mapping.findForward("viewCart");
    }

    private List getBookInfo(List cart) {
        List bookInfo = new ArrayList();
        if (cart != null) {
            ListIterator iterator = cart.listIterator();
            Session dbSession = HibernateUtil.currentSession();
            Query query = dbSession
                    .createQuery(" from Bookinfo as b where b.id=:bookid");
            while (iterator.hasNext()) {
                query.setInteger("bookid", ((Integer) iterator.next())
                        .intValue());
                // 本来放到Session中的bookid全都是经过验证的，此处不需要再作检查
                // 但少数情况下在用户放书到购物车到结算之间管理员可能对图书进行管理
                // 故在此处再对结果进行验证，如果bookid不存在则不在购物车页面中显示
                List result = query.list();
                if (result.size() > 0) {
                    bookInfo.add(result.get(0));
                }
            }
        }
        return bookInfo;
    }
}
