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
 * ������Ȩ�ޣ���Resource��Operation�Լ��ɲ�����ΧRange�����
 * @author liudong
 */
public interface Privilege {
	
	/**
	 * ����Ȩ�޶�Ӧ������ʵ���Դ
	 * @return
	 */
	public Resource getResource();
	
	/**
	 * ����Ȩ�޶�Ӧ����Ĳ���
	 * @return
	 */
	public Operation getOperation();
	
	/**
	 * ���ظ�Ȩ�޵Ŀɲ�����Χ
	 * @return
	 */
	public Range getRange();
	
	/**
	 * �ж�����Ȩ���Ƿ���ͬ
	 * @param pvg
	 * @return
	 */
	public boolean equals(Privilege pvg);

}
