package bookstore;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.Query;
import org.hibernate.Session;

import bookstore.database.HibernateUtil;
import bookstore.database.Order;
import bookstore.database.Userinfo;

public class OrderDetailAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm srcForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionMessages errors = new ActionMessages();
        // 验证是否已经登录
        if(request.getSession().getAttribute("user") == null) {
            return mapping.findForward("frontPage");
        }
        Userinfo user = (Userinfo) request.getSession().getAttribute("user");
        // 验证是否给出了合法的订单ID
        if (request.getParameter("id") == null
                || request.getParameter("id").equals("")) {
            errors.add("noid", new ActionMessage("orderdetail.noid"));
            this.saveErrors(request, errors);
            return mapping.findForward("errorPage");
        }
        // 开始查询订单
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = loadOrderInfo(id, user.getId().intValue(), errors);
        if(order == null) {
            this.saveErrors(request, errors);
            return mapping.findForward("errorPage");
        }
        request.setAttribute("order", order);
        return mapping.findForward("orderdetail");
    }

    private Order loadOrderInfo(int id, int userid, ActionMessages errors) {
        Session dbSession = HibernateUtil.currentSession();
        // 查询订单中订单号是给定号码，
        // 并且该订单的用户ID是当前用户(不允许查询其他用户的订单)
        try {
            HibernateUtil.beginTransaction();
            Query query = dbSession.createQuery(" from Order as o where o.id=:id and userid=:userid")
                .setInteger("id", id)
                .setInteger("userid", userid)
                .setMaxResults(1);
            List result = query.list();
            HibernateUtil.commitTransaction();
            if(result.size() != 0) {
                return (Order) result.get(0);
            }
            errors.add("noOrder", new ActionMessage("orderdetail.noOrder"));
        } catch(Exception e) {
            errors.add("dbError", new ActionMessage("globle.dbError"));
        }
        return null;
    }

}
