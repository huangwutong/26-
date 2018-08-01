<%
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
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="name" name="name" value="faceUrl"/>
<dlog:getLoginUser id="loginUser"/>
<select onchange="document.images['face'].src=options[selectedIndex].value;" name="<bean:write name="name"/>">
    <option value="faces/face1.gif" <logic:equal name="loginUser" property="portrait" value="faces/face1.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>1</option>
    <option value="faces/face2.gif" <logic:equal name="loginUser" property="portrait" value="faces/face2.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>2</option>
    <option value="faces/face3.gif" <logic:equal name="loginUser" property="portrait" value="faces/face3.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>3</option>
    <option value="faces/face4.gif" <logic:equal name="loginUser" property="portrait" value="faces/face4.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>4</option>
    <option value="faces/face5.gif" <logic:equal name="loginUser" property="portrait" value="faces/face5.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>5</option>
    <option value="faces/face6.gif" <logic:equal name="loginUser" property="portrait" value="faces/face6.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>6</option>
    <option value="faces/face7.gif" <logic:equal name="loginUser" property="portrait" value="faces/face7.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>7</option>
    <option value="faces/face8.gif" <logic:equal name="loginUser" property="portrait" value="faces/face8.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>8</option>
    <option value="faces/face9.gif" <logic:equal name="loginUser" property="portrait" value="faces/face9.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>9</option>
    <option value="faces/face10.gif" <logic:equal name="loginUser" property="portrait" value="faces/face10.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>10</option>
    <option value="faces/face11.gif" <logic:equal name="loginUser" property="portrait" value="faces/face11.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>11</option>
    <option value="faces/face12.gif" <logic:equal name="loginUser" property="portrait" value="faces/face12.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>12</option>
    <option value="faces/face13.gif" <logic:equal name="loginUser" property="portrait" value="faces/face13.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>13</option>
    <option value="faces/face14.gif" <logic:equal name="loginUser" property="portrait" value="faces/face14.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>14</option>
    <option value="faces/face15.gif" <logic:equal name="loginUser" property="portrait" value="faces/face15.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>15</option>
    <option value="faces/face16.gif" <logic:equal name="loginUser" property="portrait" value="faces/face16.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>16</option>
    <option value="faces/face17.gif" <logic:equal name="loginUser" property="portrait" value="faces/face17.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>17</option>
    <option value="faces/face18.gif" <logic:equal name="loginUser" property="portrait" value="faces/face18.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>18</option>
    <option value="faces/face19.gif" <logic:equal name="loginUser" property="portrait" value="faces/face19.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>19</option>
    <option value="faces/face20.gif" <logic:equal name="loginUser" property="portrait" value="faces/face20.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>20</option>
    <option value="faces/face21.gif" <logic:equal name="loginUser" property="portrait" value="faces/face21.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>21</option>
    <option value="faces/face22.gif" <logic:equal name="loginUser" property="portrait" value="faces/face22.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>22</option>
    <option value="faces/face23.gif" <logic:equal name="loginUser" property="portrait" value="faces/face23.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>23</option>
    <option value="faces/face24.gif" <logic:equal name="loginUser" property="portrait" value="faces/face24.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>24</option>
    <option value="faces/face25.gif" <logic:equal name="loginUser" property="portrait" value="faces/face25.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>25</option>
    <option value="faces/face26.gif" <logic:equal name="loginUser" property="portrait" value="faces/face26.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>26</option>
    <option value="faces/face27.gif" <logic:equal name="loginUser" property="portrait" value="faces/face27.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>27</option>
    <option value="faces/face28.gif" <logic:equal name="loginUser" property="portrait" value="faces/face28.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>28</option>
    <option value="faces/face29.gif" <logic:equal name="loginUser" property="portrait" value="faces/face29.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>29</option>
    <option value="faces/face30.gif" <logic:equal name="loginUser" property="portrait" value="faces/face30.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>30</option>
    <option value="faces/face31.gif" <logic:equal name="loginUser" property="portrait" value="faces/face31.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>31</option>
    <option value="faces/face32.gif" <logic:equal name="loginUser" property="portrait" value="faces/face32.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>32</option>
    <option value="faces/face33.gif" <logic:equal name="loginUser" property="portrait" value="faces/face33.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>33</option>
    <option value="faces/face34.gif" <logic:equal name="loginUser" property="portrait" value="faces/face34.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>34</option>
    <option value="faces/face35.gif" <logic:equal name="loginUser" property="portrait" value="faces/face35.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>35</option>
    <option value="faces/face36.gif" <logic:equal name="loginUser" property="portrait" value="faces/face36.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>36</option>
    <option value="faces/face37.gif" <logic:equal name="loginUser" property="portrait" value="faces/face37.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>37</option>
    <option value="faces/face38.gif" <logic:equal name="loginUser" property="portrait" value="faces/face38.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>38</option>
    <option value="faces/face39.gif" <logic:equal name="loginUser" property="portrait" value="faces/face39.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>39</option>
    <option value="faces/face40.gif" <logic:equal name="loginUser" property="portrait" value="faces/face40.gif">selected</logic:equal>><bean:message key="PORTRAIT_HEAD" bundle="html"/>40</option>
</select><bean:message key="PORTRAIT_PREVIEW" bundle="html"/>:<img id="face" height="20" alt="<bean:message key="PORTRAIT_HEAD" bundle="html"/>" src="<%=((loginUser.getPortrait()==null)?"faces/face1.gif":loginUser.getPortrait())%>" width="20" align="absmiddle">
