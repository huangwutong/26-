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
package dlog4j.formbean;

/**
 * 日记附件,对应表dlog_attachement
 * @author Liudong
 */
public class AttachmentForm extends DlogActionForm {
    
    int id;
    int type;
    LogForm log;
    int urlType;
    String url;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public LogForm getLog() {
        return log;
    }
    public void setLog(LogForm log) {
        this.log = log;
    }
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public int getUrlType() {
        return urlType;
    }
    public void setUrlType(int urlType) {
        this.urlType = urlType;
    }
}
