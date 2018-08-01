package bookstore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.Session;

import bookstore.database.HibernateUtil;
import bookstore.database.Userinfo;

public class ModifyAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm srcForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        Userinfo user = (Userinfo) session.getAttribute("user");

        // 当密码不为空并且两次输入密码一致时，修改密码
        RegisterForm form = (RegisterForm) srcForm;
        if (form.getPassword() != null && !form.getPassword().equals("")
                && form.getPassword().equals(form.getConfirm())) {
            user.setPwd(form.getPassword());
        }
        // 当Email不空时修改Email
        // 可在此处再添加代码验证Email格式是否合法
        if (form.getEmail() != null && !form.getEmail().equals("")) {
            user.setEmail(form.getEmail());
        }

        // 当地址不空时修改地址
        if (form.getAddress() != null && !form.getAddress().equals("")) {
            user.setAddress(new String(
                    form.getAddress().getBytes("ISO-8859-1"), "GB2312"));
        }

        // 当邮编不空时修改邮编
        // 可在此处再添加代码验证邮编是否有效
        if (form.getPostcode() != null && !form.getPostcode().equals("")) {
            user.setPostcode(form.getPostcode());
        }

        Session dbSession = HibernateUtil.currentSession();
        ActionMessages errors = new ActionMessages();
        // 保存用户修改
        try {
            HibernateUtil.beginTransaction();
            dbSession.update(user);
            HibernateUtil.commitTransaction();
        } catch (Exception e) {
            errors.add("dbError", new ActionMessage("globle.dbError"));
            this.saveErrors(request, errors);
            return mapping.getInputForward();
        }
        return mapping.findForward("frontPage");
    }

}
