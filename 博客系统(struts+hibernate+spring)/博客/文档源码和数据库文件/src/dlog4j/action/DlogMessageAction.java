/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.action;

import java.util.Date;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.formbean.MessageForm;
import dlog4j.formbean.UserForm;

/**
 * 点对点消息传递
 * 
 * @author Liudong
 */
public class DlogMessageAction extends DlogActionBase {

    public final static String ERROR_KEY = "message";

    /**
     * 删除消息
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @param msgid
     * @return
     * @throws Exception
     */
    public ActionForward doDelete(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response, String msgid)
            throws Exception {
        int mid = -1;
        Session ssn = null;
        ActionErrors errors = new ActionErrors();
        UserForm loginUser = UserForm.getLoginUser(request);
        if (loginUser != null && loginUser.isLogin()) {
        try {
            mid = Integer.parseInt(msgid);
            if(mid>0) {
                ssn = getSession();                
                MessageForm msg = (MessageForm)ssn.load(MessageForm.class,new Integer(mid));
                if(msg.getToUser().getId()!=loginUser.getId())
                    errors.add(ERROR_KEY,new ActionError("operation_not_allow"));
                else {
                    msg.setStatus(MessageForm.STATUS_DELETE);
                    if(msg.getReadTime()==null)
                        msg.setReadTime(new Date());
                    ssn.update(msg);
                }
            }
        }catch(NumberFormatException e) {            
        }catch (HibernateException e) {
            errors.add(ERROR_KEY,
                    new ActionError("hibernate_exception"));
        } catch (SQLException e) {
            errors.add(ERROR_KEY, new ActionError("database_exception"));
        }finally {
            if(ssn!=null)
                commitSession(ssn,true);
        }
        } else
            errors.add(ERROR_KEY, new ActionError("user_not_login"));
        if (!errors.isEmpty()) 
            saveErrors(request, errors);
        return mapping.findForward("list");        
    }
    /**
     * 发送信息给某人
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return @throws
     *         Exception
     */
    public ActionForward doSend(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionErrors errors = new ActionErrors();
        MessageForm msg = (MessageForm) form;
        UserForm loginUser = UserForm.getLoginUser(request);
        if (loginUser != null && loginUser.isLogin()) {
            if (msg.getToUser() == null || msg.getToUser().getId() == -1) 
                errors.add(ERROR_KEY, new ActionError("operation_not_allow"));
            else if (msg.getToUser().getId() == loginUser.getId()) 
                errors.add(ERROR_KEY, new ActionError("message_to_self"));
            else {
                Session ssn = null;
                try {
                    msg.setFromUser(loginUser);
                    msg.setSendTime(new Date());
                    ssn = getSession();
                    ssn.save(msg);
                    errors.add(ERROR_KEY, new ActionError("message_send_ok"));
                } catch (HibernateException e) {
                    errors.add(ERROR_KEY,
                            new ActionError("hibernate_exception"));
                } catch (SQLException e) {
                    errors.add(ERROR_KEY, new ActionError("database_exception"));
                } finally {
                    commitSession(ssn, true);
                }
            }
        } else
            errors.add(ERROR_KEY, new ActionError("user_not_login"));
        if (!errors.isEmpty()) 
            saveErrors(request, errors);
        return mapping.getInputForward();
    }
}
