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
package web.security;

/**
 * ����
 * <p>
 * �������Ƕ�һ�����Ĺ��ܵ����ã�������ӡ��޸ġ�ɾ���Ȳ���
 * </p>
 * @author liudong
 */
public interface Operation {
	
	public final static String EDIT 	= "Edit";
	public final static String DELETE 	= "Delete";
	public final static String CREATE 	= "Create";
	public final static String LIST 	= "List";
	public final static String VIEW 	= "View";
	
	/**
	 * �õ�����������
	 * @return
	 */
	public String getName();
	
	/**
	 * ��������ϸ������Ϣ
	 * @return
	 */
	public String getDesc();

	/**
	 * �ж����������Ƿ�������
	 * @param opt
	 * @return
	 */
	public boolean equals(Operation opt);
}
