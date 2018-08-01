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
package dlog4j.security;

import web.security.Operation;
import web.security.impl.OperationImpl;

/**
 * DLOG�Ĳ�����չ
 * @author Winter Lau
 */
public class MaintainOperation extends OperationImpl {

	public boolean equals(Operation opt) {
		Class thisClass = getClass();
		Class thatClass = opt.getClass();
		if(thisClass.equals(thatClass))
			return super.equals(opt);
		Class superClass = thisClass;
		do{
			superClass = superClass.getSuperclass();
			if(superClass==null)
				break;
			if(superClass.equals(thatClass))
				return true;
		}while(true);
		return false;
	}
}
